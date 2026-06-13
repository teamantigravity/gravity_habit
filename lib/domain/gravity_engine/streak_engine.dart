import 'package:gravity_habit/data/isar/schemas/habit_entry_schema.dart';
import 'package:gravity_habit/domain/entities/habit.dart';

class StreakEngine {
  StreakEngine._();

  /// Calculate current streak for a habit given its entries (sorted by date
  /// descending).
  static StreakResult calculateStreak({
    required List<HabitEntry> entries,
    required List<DateTime> scheduledDates,
  }) {
    if (entries.isEmpty || scheduledDates.isEmpty) {
      return const StreakResult(current: 0, longest: 0, isAtRisk: false);
    }

    var current = 0;
    var longest = 0;
    var tempStreak = 0;

    // Sort scheduled dates descending
    final sorted = List<DateTime>.from(scheduledDates)
      ..sort((a, b) => b.compareTo(a));

    final entryMap = <String, HabitEntry>{};
    for (final entry in entries) {
      final key = _dateKey(entry.date);
      entryMap[key] = entry;
    }

    var streakBroken = false;
    for (final date in sorted) {
      final key = _dateKey(date);
      final entry = entryMap[key];

      if (entry != null) {
        if (entry.isComplete) {
          tempStreak++;
        } else if (entry.skipReason != null &&
            entry.skipReason != SkipReason.forgot) {
          // Paused streak — doesn't count against
          continue;
        } else {
          if (!streakBroken) {
            current = tempStreak;
            streakBroken = true;
          }
          longest = tempStreak > longest ? tempStreak : longest;
          tempStreak = 0;
        }
      } else {
        // No entry for scheduled date
        if (date.isAfter(DateTime.now())) continue; // Future dates
        if (!streakBroken) {
          current = tempStreak;
          streakBroken = true;
        }
        longest = tempStreak > longest ? tempStreak : longest;
        tempStreak = 0;
      }
    }

    if (!streakBroken) current = tempStreak;
    longest = tempStreak > longest ? tempStreak : longest;
    if (current > longest) longest = current;

    // Check if today's habit is at risk (scheduled but not done)
    final today = DateTime.now();
    final todayKey = _dateKey(today);
    final todayScheduled =
        sorted.any((d) => _dateKey(d) == todayKey);
    final todayDone = entryMap[todayKey]?.isComplete ?? false;
    final isAtRisk = todayScheduled && !todayDone && current >= 7;

    return StreakResult(
      current: current,
      longest: longest,
      isAtRisk: isAtRisk,
    );
  }

  static String _dateKey(DateTime date) =>
      '${date.year}-${date.month.toString().padLeft(2, '0')}'
      '-${date.day.toString().padLeft(2, '0')}';

  /// Milestones and their stardust rewards.
  static const streakMilestones = <int, StreakMilestone>{
    3: StreakMilestone('Foundation', 10),
    7: StreakMilestone('First Orbit', 25),
    14: StreakMilestone('Steady Pull', 50),
    21: StreakMilestone('Habit Formed', 100),
    30: StreakMilestone('Lunar Cycle', 150),
    50: StreakMilestone('Gravity Set', 200),
    75: StreakMilestone('Resilient Orbit', 300),
    100: StreakMilestone('Centurion', 500),
    150: StreakMilestone('Steadfast Star', 750),
    200: StreakMilestone('Bicentennial', 1000),
    300: StreakMilestone('Cosmic Devotion', 1500),
    365: StreakMilestone('Year of Light', 3000),
    500: StreakMilestone('Beyond Years', 5000),
    730: StreakMilestone('Two-Year Voyager', 7500),
    1000: StreakMilestone('Millennium Mind', 10000),
  };

  static StreakMilestone? milestoneForStreak(int streak) =>
      streakMilestones[streak];

  static bool isMilestoneTakeover(int streak) {
    return streak == 7 ||
        streak == 21 ||
        streak == 30 ||
        streak == 100 ||
        streak == 365;
  }
}

class StreakResult {
  const StreakResult({
    required this.current,
    required this.longest,
    required this.isAtRisk,
  });

  final int current;
  final int longest;
  final bool isAtRisk;
}

class StreakMilestone {
  const StreakMilestone(this.name, this.stardustReward);

  final String name;
  final int stardustReward;
}
