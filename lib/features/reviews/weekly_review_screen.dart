import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/repositories/habit_repository.dart';
import 'package:gravity_habit/data/repositories/orbit_repository.dart';
import 'package:gravity_habit/domain/entities/habit.dart';
import 'package:gravity_habit/ui/widgets/cosmic_button.dart';
import 'package:gravity_habit/ui/widgets/stardust_counter.dart';

class WeeklyReviewScreen extends ConsumerStatefulWidget {
  const WeeklyReviewScreen({super.key});

  @override
  ConsumerState<WeeklyReviewScreen> createState() => _WeeklyReviewScreenState();
}

class _WeeklyReviewScreenState extends ConsumerState<WeeklyReviewScreen> {
  WeeklyReviewData? _data;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final habitRepo = ref.read(habitRepositoryProvider);
    final orbitRepo = ref.read(orbitRepositoryProvider);
    final habits = await habitRepo.getAllHabits();
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday));

    var completions = 0;
    var totalScheduled = 0;
    String? starOfWeekId;
    var starOfWeekCount = 0;
    String? quietPerformerId;
    var quietPerformerStreak = 0;

    final moodValues = <int>[];

    for (final habit in habits) {
      final entries = await habitRepo.getEntriesForHabit(
        habit.id,
        from: weekStart,
        to: now,
      );
      final completed = entries.where((e) => e.isComplete).length;
      totalScheduled += 7;
      completions += completed;

      if (completed > starOfWeekCount) {
        starOfWeekCount = completed;
        starOfWeekId = habit.id;
      }

      for (final entry in entries) {
        if (entry.mood != null) moodValues.add(entry.mood!);
      }
    }

    // Find quiet performer (highest streak, lowest gravity class)
    for (final habit in habits) {
      if (habit.gravityClass.index <= 1) {
        final entries = await habitRepo.getEntriesForHabit(habit.id);
        final streak = entries.where((e) => e.isComplete).length;
        if (streak > quietPerformerStreak) {
          quietPerformerStreak = streak;
          quietPerformerId = habit.id;
        }
      }
    }

    final activeDays = <int>{};
    for (final habit in habits) {
      final entries = await habitRepo.getEntriesForHabit(
        habit.id,
        from: weekStart,
        to: now,
      );
      for (final e in entries.where((e) => e.isComplete)) {
        activeDays.add(e.date.day);
      }
    }

    final earnedStardust = activeDays.length >= 5 ? 50 : 0;
    if (earnedStardust > 0) {
      await orbitRepo.addStardust(earnedStardust, 'weekly_review');
    }

    final avgMood = moodValues.isEmpty
        ? 0.0
        : moodValues.reduce((a, b) => a + b) / moodValues.length;

    setState(() {
      _data = WeeklyReviewData(
        completions: completions,
        totalScheduled: totalScheduled,
        activeDays: activeDays.length,
        starOfWeek: starOfWeekId != null
            ? habits.firstWhere((h) => h.id == starOfWeekId)
            : null,
        quietPerformer: quietPerformerId != null
            ? habits.firstWhere((h) => h.id == quietPerformerId)
            : null,
        avgMood: avgMood,
        stardustEarned: earnedStardust,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_data == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(strokeWidth: 2)),
      );
    }

    final data = _data!;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.xxl),
          child: Column(
            children: [
              const Spacer(),

              Text(
                'Your Week',
                style: context.textTheme.displaySmall?.copyWith(
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.w700,
                ),
              ).animate().fadeIn(duration: 400.ms),

              const SizedBox(height: Spacing.xxl),

              // Stats row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _ReviewStat(
                    value: '${data.completions}',
                    label: 'Completions',
                  ),
                  _ReviewStat(
                    value: '${data.activeDays}',
                    label: 'Active Days',
                  ),
                  _ReviewStat(
                    value: data.avgMood > 0
                        ? data.avgMood.toStringAsFixed(1)
                        : '\u2014',
                    label: 'Avg Mood',
                  ),
                ],
              ).animate().fadeIn(delay: 200.ms, duration: 400.ms),

              const SizedBox(height: Spacing.xxl),

              // Star of the Week
              if (data.starOfWeek != null)
                _AwardCard(
                  title: 'Star of the Week',
                  habit: data.starOfWeek!,
                ).animate().fadeIn(delay: 400.ms, duration: 400.ms),

              const SizedBox(height: Spacing.md),

              // Quiet Performer
              if (data.quietPerformer != null)
                _AwardCard(
                  title: 'Quiet Performer',
                  habit: data.quietPerformer!,
                ).animate().fadeIn(delay: 600.ms, duration: 400.ms),

              const SizedBox(height: Spacing.xxl),

              // Stardust earned
              if (data.stardustEarned > 0)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+${data.stardustEarned}',
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: context.colors.primary,
                        fontFamily: 'JetBrainsMono',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('✨', style: TextStyle(fontSize: 24)),
                  ],
                ).animate().fadeIn(delay: 800.ms, duration: 400.ms),

              const Spacer(flex: 2),

              CosmicButton(
                label: 'Continue',
                isExpanded: true,
                onPressed: () => Navigator.pop(context),
              ).animate().fadeIn(delay: 1000.ms, duration: 300.ms),

              const SizedBox(height: Spacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}

class WeeklyReviewData {
  const WeeklyReviewData({
    required this.completions,
    required this.totalScheduled,
    required this.activeDays,
    this.starOfWeek,
    this.quietPerformer,
    required this.avgMood,
    required this.stardustEarned,
  });

  final int completions;
  final int totalScheduled;
  final int activeDays;
  final Habit? starOfWeek;
  final Habit? quietPerformer;
  final double avgMood;
  final int stardustEarned;
}

class _ReviewStat extends StatelessWidget {
  const _ReviewStat({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.headlineMedium?.copyWith(
            fontFamily: 'JetBrainsMono',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

class _AwardCard extends StatelessWidget {
  const _AwardCard({required this.title, required this.habit});
  final String title;
  final Habit habit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(Spacing.md),
      decoration: BoxDecoration(
        color: Color(habit.color).withOpacity(0.08),
        borderRadius: BorderRadius.circular(CornerRadii.md),
        border: Border.all(color: Color(habit.color).withOpacity(0.15)),
      ),
      child: Row(
        children: [
          Text(habit.emoji, style: const TextStyle(fontSize: 32)),
          const SizedBox(width: Spacing.sm),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.labelSmall?.copyWith(
                    fontFamily: 'Inter',
                    color: Color(habit.color),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(habit.name, style: context.textTheme.titleMedium),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
