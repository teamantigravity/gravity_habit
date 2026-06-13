import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_habit/core/copy/dynamic_copy.dart';

void main() {
  group('DynamicCopy', () {
    test('no copy contains exclamation marks', () {
      final copies = [
        DynamicCopy.greeting(DateTime(2025, 1, 1, 10)),
        DynamicCopy.greeting(DateTime(2025, 1, 1, 15)),
        DynamicCopy.greeting(DateTime(2025, 1, 1, 20)),
        DynamicCopy.greeting(DateTime(2025, 1, 1, 23, 30)),
        DynamicCopy.streakBroken(),
        DynamicCopy.streakMilestone(7),
        DynamicCopy.streakMilestone(21),
        DynamicCopy.streakMilestone(30),
        DynamicCopy.streakMilestone(100),
        DynamicCopy.streakMilestone(365),
        DynamicCopy.streakFreezeApplied(14),
        DynamicCopy.tierUp('Asteroid Born'),
        DynamicCopy.completionCelebration(3, 5),
        DynamicCopy.completionCelebration(5, 5),
        DynamicCopy.lastHabitOfDay(),
        DynamicCopy.perfectDay(),
        DynamicCopy.identityStatement('Read', 30),
        DynamicCopy.emptyToday,
        DynamicCopy.welcomeBack,
        DynamicCopy.recoveryQuestCopy('Meditate'),
      ];

      for (final copy in copies) {
        expect(copy.contains('!'), false, reason: 'Copy contains "!": $copy');
      }
    });

    test('broken streak never says "failed"', () {
      final copy = DynamicCopy.streakBroken();
      expect(copy.toLowerCase().contains('fail'), false);
      expect(copy.toLowerCase().contains('broke'), false);
      expect(copy.toLowerCase().contains('lost'), false);
    });

    test('greeting returns late-night copy after 11pm', () {
      final copy = DynamicCopy.greeting(DateTime(2025, 1, 1, 23, 30));
      expect(copy.contains('late') || copy.contains('enough'), true);
    });

    test('7-day absence returns welcoming copy', () {
      final copy = DynamicCopy.greeting(
        DateTime.now(),
        dayAbsence: 10,
      );
      expect(copy.contains('Welcome back'), true);
      expect(copy.contains('Nothing was lost'), true);
    });

    test('21-day milestone includes myth-busting note', () {
      final copy = DynamicCopy.streakMilestone(21);
      expect(copy.contains('myth'), true);
    });
  });
}
