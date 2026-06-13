import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_habit/domain/entities/achievement_catalog.dart';

void main() {
  group('AchievementCatalog', () {
    test('has exactly 150 achievements', () {
      expect(AchievementCatalog.all.length, 150);
    });

    test('all achievements have unique IDs', () {
      final ids = AchievementCatalog.all.map((a) => a.id).toSet();
      expect(ids.length, 150);
    });

    test('all achievements have non-empty names and descriptions', () {
      for (final a in AchievementCatalog.all) {
        expect(a.name, isNotEmpty, reason: 'ID ${a.id} has empty name');
        expect(a.description, isNotEmpty,
            reason: 'ID ${a.id} has empty description');
      }
    });

    test('all achievements have positive stardust rewards', () {
      for (final a in AchievementCatalog.all) {
        expect(a.stardustReward, greaterThan(0),
            reason: 'ID ${a.id} has 0 reward');
      }
    });

    test('all 6 groups are represented', () {
      final groups =
          AchievementCatalog.all.map((a) => a.group).toSet();
      expect(groups, containsAll(AchievementCatalog.groups));
    });

    test('Consistency group has 30 achievements', () {
      expect(AchievementCatalog.byGroup('Consistency').length, 30);
    });

    test('Variety group has 25 achievements', () {
      expect(AchievementCatalog.byGroup('Variety').length, 25);
    });

    test('Endurance group has 20 achievements', () {
      expect(AchievementCatalog.byGroup('Endurance').length, 20);
    });

    test('Recovery group has 15 achievements', () {
      expect(AchievementCatalog.byGroup('Recovery').length, 15);
    });

    test('Exploration group has 25 achievements', () {
      expect(AchievementCatalog.byGroup('Exploration').length, 25);
    });

    test('Mastery group has 35 achievements', () {
      expect(AchievementCatalog.byGroup('Mastery').length, 35);
    });
  });
}
