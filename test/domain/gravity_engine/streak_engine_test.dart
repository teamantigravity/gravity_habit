import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_habit/domain/entities/habit.dart';
import 'package:gravity_habit/domain/gravity_engine/streak_engine.dart';

void main() {
  group('StreakEngine', () {
    test('empty entries returns 0 streak', () {
      final result = StreakEngine.calculateStreak(
        entries: [],
        scheduledDates: [DateTime.now()],
      );
      expect(result.current, 0);
      expect(result.longest, 0);
    });

    test('consecutive completions build streak', () {
      final now = DateTime.now();
      final entries = List.generate(
        7,
        (i) => HabitEntry(
          id: 'e$i',
          habitId: 'h1',
          date: now.subtract(Duration(days: i)),
          completedValue: 1,
          isComplete: true,
          completedAt: now.subtract(Duration(days: i)),
        ),
      );
      final scheduledDates = List.generate(
        10,
        (i) => now.subtract(Duration(days: i)),
      );

      final result = StreakEngine.calculateStreak(
        entries: entries,
        scheduledDates: scheduledDates,
      );
      expect(result.current, 7);
    });

    test('streak milestones exist for all defined days', () {
      const milestones = StreakEngine.streakMilestones;
      expect(milestones.containsKey(3), true);
      expect(milestones.containsKey(7), true);
      expect(milestones.containsKey(14), true);
      expect(milestones.containsKey(21), true);
      expect(milestones.containsKey(30), true);
      expect(milestones.containsKey(100), true);
      expect(milestones.containsKey(365), true);
      expect(milestones.containsKey(1000), true);
    });

    test('isMilestoneTakeover returns true for specified days', () {
      expect(StreakEngine.isMilestoneTakeover(7), true);
      expect(StreakEngine.isMilestoneTakeover(21), true);
      expect(StreakEngine.isMilestoneTakeover(30), true);
      expect(StreakEngine.isMilestoneTakeover(100), true);
      expect(StreakEngine.isMilestoneTakeover(365), true);
      expect(StreakEngine.isMilestoneTakeover(14), false);
      expect(StreakEngine.isMilestoneTakeover(50), false);
    });
  });
}
