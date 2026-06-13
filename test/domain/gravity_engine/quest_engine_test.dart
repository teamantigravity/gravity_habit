import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_habit/domain/gravity_engine/quest_engine.dart';

void main() {
  group('QuestEngine', () {
    test('selectQuestForDate returns a quest', () {
      final quest = QuestEngine.selectQuestForDate(
        DateTime(2025, 1, 15),
        strongCategories: ['Body'],
        totalHabits: 5,
      );
      expect(quest.id, isNotEmpty);
      expect(quest.name, isNotEmpty);
      expect(quest.stardustReward, greaterThanOrEqualTo(10));
      expect(quest.stardustReward, lessThanOrEqualTo(25));
    });

    test('same date always returns same quest (deterministic)', () {
      final date = DateTime(2025, 6, 1);
      final quest1 = QuestEngine.selectQuestForDate(
        date,
        strongCategories: ['Mind'],
        totalHabits: 3,
      );
      final quest2 = QuestEngine.selectQuestForDate(
        date,
        strongCategories: ['Mind'],
        totalHabits: 3,
      );
      expect(quest1.id, quest2.id);
    });

    test('different dates return potentially different quests', () {
      final date1 = DateTime(2025, 1, 1);
      final date2 = DateTime(2025, 1, 2);
      final quest1 = QuestEngine.selectQuestForDate(
        date1,
        strongCategories: [],
        totalHabits: 3,
      );
      final quest2 = QuestEngine.selectQuestForDate(
        date2,
        strongCategories: [],
        totalHabits: 3,
      );
      // They might be the same but should not throw
      expect(quest1.id, isNotEmpty);
      expect(quest2.id, isNotEmpty);
    });
  });
}
