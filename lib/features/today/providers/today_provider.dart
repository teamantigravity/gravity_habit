import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/data/isar/schemas/habit_entry_schema.dart';
import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';
import 'package:gravity_habit/data/repositories/habit_repository.dart';
import 'package:gravity_habit/data/repositories/orbit_repository.dart';
import 'package:gravity_habit/domain/entities/habit.dart';
import 'package:gravity_habit/domain/gravity_engine/mass_calculator.dart';
import 'package:gravity_habit/domain/gravity_engine/pull_calculator.dart';
import 'package:gravity_habit/domain/gravity_engine/streak_engine.dart';

class TodayState {
  const TodayState({
    required this.habits,
    required this.todayEntries,
    required this.streaks,
    required this.stardust,
    required this.dailyPull,
    required this.completedCount,
    required this.totalScheduled,
    required this.metaStreak,
    required this.longestStreak,
  });

  final List<Habit> habits;
  final List<HabitEntry> todayEntries;
  final Map<String, int> streaks; // habitId -> streak
  final int stardust;
  final double dailyPull;
  final int completedCount;
  final int totalScheduled;
  final int metaStreak;
  final int longestStreak;

  static const empty = TodayState(
    habits: [],
    todayEntries: [],
    streaks: {},
    stardust: 0,
    dailyPull: 0,
    completedCount: 0,
    totalScheduled: 0,
    metaStreak: 0,
    longestStreak: 0,
  );
}

final todayProvider =
    StateNotifierProvider<TodayNotifier, AsyncValue<TodayState>>((ref) {
  final habitRepo = ref.watch(habitRepositoryProvider);
  final orbitRepo = ref.watch(orbitRepositoryProvider);
  return TodayNotifier(habitRepo, orbitRepo);
});

class TodayNotifier extends StateNotifier<AsyncValue<TodayState>> {
  TodayNotifier(this._habitRepo, this._orbitRepo)
      : super(const AsyncValue.loading()) {
    _load();
  }

  final HabitRepository _habitRepo;
  final OrbitRepository _orbitRepo;

  Future<void> _load() async {
    try {
      final habits = await _habitRepo.getAllHabits();
      final today = DateTime.now();
      final todayEntries = await _habitRepo.getEntriesForDate(today);
      final profile = await _orbitRepo.getProfile();

      // Calculate streaks
      final streaks = <String, int>{};
      var longestStreak = 0;

      for (final habit in habits) {
        final entries = await _habitRepo.getEntriesForHabit(habit.id);
        // For simplicity, build scheduled dates as all days from creation
        final daysSinceCreation =
            today.difference(habit.createdAt).inDays + 1;
        final scheduledDates = List.generate(
          daysSinceCreation,
          (i) => habit.createdAt.add(Duration(days: i)),
        );

        final result = StreakEngine.calculateStreak(
          entries: entries,
          scheduledDates: scheduledDates,
        );
        streaks[habit.id] = result.current;
        if (result.longest > longestStreak) {
          longestStreak = result.longest;
        }
      }

      final completedCount =
          todayEntries.where((e) => e.isComplete).length;
      final totalScheduled = habits.length; // simplified

      final dailyPull = PullCalculator.calculateDailyPull(
        todayCompletionRatio: totalScheduled > 0
            ? completedCount / totalScheduled
            : 0,
        weeklyConsistency: 0.5, // Would calculate from 7-day data
        hasActiveStreak: streaks.values.any((s) => s > 0),
        recentRecovery: false,
      );

      state = AsyncValue.data(
        TodayState(
          habits: habits,
          todayEntries: todayEntries,
          streaks: streaks,
          stardust: profile.collectedStardust,
          dailyPull: dailyPull,
          completedCount: completedCount,
          totalScheduled: totalScheduled,
          metaStreak: profile.streakDays,
          longestStreak: longestStreak,
        ),
      );
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> completeHabit(
    String habitId, {
    double? value,
    String? note,
    int? mood,
  }) async {
    final currentState = state.valueOrNull;
    if (currentState == null) return;

    final habit = currentState.habits.firstWhere((h) => h.id == habitId);
    final existingEntry = currentState.todayEntries
        .where((e) => e.habitId == habitId)
        .firstOrNull;

    final completedValue = value ?? habit.targetValue;
    final now = DateTime.now();

    if (existingEntry != null) {
      // Update existing entry
      await _habitRepo.updateEntry(
        existingEntry.copyWith(
          completedValue: completedValue,
          isComplete: true,
          completedAt: now,
          note: note ?? existingEntry.note,
          mood: mood ?? existingEntry.mood,
        ),
      );
    } else {
      // Create new entry
      await _habitRepo.createEntry(
        HabitEntry(
          id: '',
          habitId: habitId,
          date: DateTime(now.year, now.month, now.day),
          completedValue: completedValue,
          isComplete: true,
          completedAt: now,
          note: note,
          mood: mood,
        ),
      );
    }

    // Calculate mass and stardust
    final streak = currentState.streaks[habitId] ?? 0;
    final isShower = Random().nextInt(30) == 0;
    final mass = MassCalculator.calculateMass(
      gravityClass: habit.gravityClass,
      currentStreak: streak + 1,
    );
    final stardust = MassCalculator.stardustForCompletion(
      currentStreak: streak + 1,
      isStardustShower: isShower,
    );

    await _orbitRepo.addMass(mass);
    await _orbitRepo.addStardust(stardust, 'completion', habitId);

    // Check for streak milestones
    final milestone = StreakEngine.milestoneForStreak(streak + 1);
    if (milestone != null) {
      await _orbitRepo.addStardust(
        milestone.stardustReward,
        'milestone',
        '${habitId}_streak_${streak + 1}',
      );
    }

    await _load();
  }

  Future<void> skipHabit(String habitId, String reason) async {
    final now = DateTime.now();
    final skipReason = switch (reason) {
      'sick' => SkipReason.sick,
      'traveling' => SkipReason.traveling,
      'restDay' => SkipReason.restDay,
      'forgot' => SkipReason.forgot,
      _ => SkipReason.other,
    };

    await _habitRepo.createEntry(
      HabitEntry(
        id: '',
        habitId: habitId,
        date: DateTime(now.year, now.month, now.day),
        completedValue: 0,
        isComplete: false,
        skipReason: skipReason,
      ),
    );

    await _load();
  }

  Future<void> refresh() async => _load();
}
