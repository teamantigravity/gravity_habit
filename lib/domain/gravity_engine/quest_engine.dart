import 'dart:math';

class QuestEngine {
  QuestEngine._();

  static final _random = Random();

  static DailyQuest selectQuestForDate(
    DateTime date, {
    required List<String> strongCategories,
    required int totalHabits,
  }) {
    final dayHash = date.year * 10000 + date.month * 100 + date.day;
    final rng = Random(dayHash);

    // Weight: 60% strong, 30% gentle, 10% random
    final roll = rng.nextDouble();
    List<DailyQuest> pool;
    if (roll < 0.6 && strongCategories.isNotEmpty) {
      pool = _quests.where((q) => q.category == 'strong').toList();
    } else if (roll < 0.9) {
      pool = _quests.where((q) => q.category == 'gentle').toList();
    } else {
      pool = _quests;
    }

    if (pool.isEmpty) pool = _quests;

    final selected = pool[rng.nextInt(pool.length)];
    final reward = 10 + rng.nextInt(16); // 10-25
    return selected.copyWith(stardustReward: reward);
  }

  static final _quests = [
    DailyQuest(id: 'Q1', name: 'Early Bird', description: 'Complete a habit before 9 AM', category: 'gentle', stardustReward: 15),
    DailyQuest(id: 'Q2', name: 'Night Cap', description: 'Complete your last habit after 8 PM', category: 'gentle', stardustReward: 15),
    DailyQuest(id: 'Q3', name: 'Triple Play', description: 'Complete 3 habits today', category: 'strong', stardustReward: 20),
    DailyQuest(id: 'Q4', name: 'Heavy Lifter', description: 'Complete a Boulder or Planet habit', category: 'strong', stardustReward: 20),
    DailyQuest(id: 'Q5', name: 'Featherlight', description: 'Complete a Feather habit', category: 'gentle', stardustReward: 10),
    DailyQuest(id: 'Q6', name: 'Mindful Moment', description: 'Add a note to a completion', category: 'gentle', stardustReward: 15),
    DailyQuest(id: 'Q7', name: 'Reflective Soul', description: 'Log a mood with a completion', category: 'gentle', stardustReward: 15),
    DailyQuest(id: 'Q8', name: 'Resonance', description: 'Complete 2 linked habits within 2 hours', category: 'strong', stardustReward: 20),
    DailyQuest(id: 'Q9', name: 'Perfect Day', description: 'Complete all scheduled habits', category: 'strong', stardustReward: 25),
    DailyQuest(id: 'Q10', name: 'Streak Saver', description: 'Maintain all active streaks', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q11', name: 'First Light', description: 'Complete your first habit of the day', category: 'gentle', stardustReward: 10),
    DailyQuest(id: 'Q12', name: 'Stargazer', description: 'Visit the Cosmos screen', category: 'gentle', stardustReward: 10),
    DailyQuest(id: 'Q13', name: 'Cartographer', description: 'View your Stats', category: 'gentle', stardustReward: 10),
    DailyQuest(id: 'Q14', name: 'Customizer', description: 'Change any cosmetic setting', category: 'gentle', stardustReward: 15),
    DailyQuest(id: 'Q15', name: 'Variety Hour', description: 'Complete habits from 2+ categories', category: 'strong', stardustReward: 20),
    DailyQuest(id: 'Q16', name: 'Counter Champion', description: 'Complete a count-type habit', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q17', name: 'Time Keeper', description: 'Complete a duration-type habit', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q18', name: 'Mover', description: 'Complete a distance-type habit', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q19', name: 'Two Worlds', description: 'Complete habits in both morning and evening', category: 'strong', stardustReward: 20),
    DailyQuest(id: 'Q20', name: 'Gratitude', description: 'Write a note expressing thanks', category: 'gentle', stardustReward: 15),
    DailyQuest(id: 'Q21', name: 'Why Today', description: "Read your habit's Why", category: 'gentle', stardustReward: 10),
    DailyQuest(id: 'Q22', name: 'Stacker', description: 'Complete 2 habits back-to-back', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q23', name: 'Quick Strike', description: 'Complete a habit within 1 min of opening', category: 'gentle', stardustReward: 15),
    DailyQuest(id: 'Q24', name: 'Slow Burn', description: 'Take more than 5 minutes on a habit', category: 'gentle', stardustReward: 15),
    DailyQuest(id: 'Q25', name: 'Touchstone', description: 'Complete your oldest habit', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q26', name: 'Rest Awareness', description: 'Mark a rest day consciously', category: 'gentle', stardustReward: 10),
    DailyQuest(id: 'Q27', name: 'Constellation Watch', description: 'Check progress on a constellation', category: 'gentle', stardustReward: 10),
    DailyQuest(id: 'Q28', name: 'Heavy Heart', description: 'Complete a Stone+ gravity habit', category: 'strong', stardustReward: 20),
    DailyQuest(id: 'Q29', name: 'Five for Five', description: 'Complete 5 habits today', category: 'strong', stardustReward: 25),
    DailyQuest(id: 'Q30', name: 'Quiet Win', description: 'Complete a habit without fanfare', category: 'gentle', stardustReward: 10),
    DailyQuest(id: 'Q31', name: 'Share Your Sky', description: 'Generate a share card', category: 'gentle', stardustReward: 15),
    DailyQuest(id: 'Q32', name: 'Stardust Spender', description: 'Purchase a cosmetic', category: 'gentle', stardustReward: 10),
    DailyQuest(id: 'Q33', name: 'Color Today', description: 'View habits by category color', category: 'gentle', stardustReward: 10),
    DailyQuest(id: 'Q34', name: 'Sound of Today', description: 'Enable sound and complete a habit', category: 'gentle', stardustReward: 15),
    DailyQuest(id: 'Q35', name: 'Connection', description: 'Complete a Connection category habit', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q36', name: 'Body Today', description: 'Complete a Body category habit', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q37', name: 'Mind Today', description: 'Complete a Mind category habit', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q38', name: 'Spirit Today', description: 'Complete a Spirit category habit', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q39', name: 'Maker Today', description: 'Complete a Creative category habit', category: 'strong', stardustReward: 15),
    DailyQuest(id: 'Q40', name: 'Gentle Day', description: 'Complete at least 1 habit — that is enough', category: 'gentle', stardustReward: 10),
  ];
}

class DailyQuest {
  const DailyQuest({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.stardustReward,
  });

  final String id;
  final String name;
  final String description;
  final String category;
  final int stardustReward;

  DailyQuest copyWith({int? stardustReward}) {
    return DailyQuest(
      id: id,
      name: name,
      description: description,
      category: category,
      stardustReward: stardustReward ?? this.stardustReward,
    );
  }
}
