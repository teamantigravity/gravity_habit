class AchievementDef {
  const AchievementDef({
    required this.id,
    required this.name,
    required this.description,
    required this.rarity,
    required this.stardustReward,
    required this.group,
    required this.criteria,
  });

  final String id;
  final String name;
  final String description;
  final AchievementRarity rarity;
  final int stardustReward;
  final String group;
  final AchievementCriteria criteria;
}

enum AchievementRarity {
  common(5, '⭐'),
  rare(25, '🌟'),
  epic(100, '💫'),
  legendary(250, '🌠'),
  mythic(1000, '✨');

  const AchievementRarity(this.defaultReward, this.icon);
  final int defaultReward;
  final String icon;
}

class AchievementCriteria {
  const AchievementCriteria({
    this.streakDays,
    this.totalCompletions,
    this.activeHabits,
    this.totalMass,
    this.tier,
    this.prestigeLevel,
    this.stardustCollected,
    this.questsCompleted,
    this.categoriesUsed,
    this.moodLogs,
    this.notesWritten,
    this.recoveries,
    this.perfectDays,
    this.perfectWeeks,
    this.perfectMonths,
    this.daysInstalled,
    this.customCheck,
  });

  final int? streakDays;
  final int? totalCompletions;
  final int? activeHabits;
  final double? totalMass;
  final int? tier;
  final int? prestigeLevel;
  final int? stardustCollected;
  final int? questsCompleted;
  final int? categoriesUsed;
  final int? moodLogs;
  final int? notesWritten;
  final int? recoveries;
  final int? perfectDays;
  final int? perfectWeeks;
  final int? perfectMonths;
  final int? daysInstalled;
  final String? customCheck;
}
