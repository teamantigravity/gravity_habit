class PullCalculator {
  PullCalculator._();

  /// Daily pull score (0–100).
  /// 70% today's completion ratio
  /// 20% 7-day rolling consistency
  /// 10% streak protection (recovery counts positively)
  static double calculateDailyPull({
    required double todayCompletionRatio,
    required double weeklyConsistency,
    required bool hasActiveStreak,
    required bool recentRecovery,
  }) {
    final todayComponent = todayCompletionRatio * 70;
    final weeklyComponent = weeklyConsistency * 20;
    final streakComponent =
        (hasActiveStreak ? 7.0 : 0) + (recentRecovery ? 3.0 : 0);

    return (todayComponent + weeklyComponent + streakComponent).clamp(0, 100);
  }
}
