import 'package:gravity_habit/core/extensions/date_extensions.dart';

/// Identity-reinforcing copy system.
/// RULES: No exclamation marks. Active voice. Numerals for counts.
/// Em-dashes for emphasis. Never "you failed". Never numeric shame.
class DynamicCopy {
  DynamicCopy._();

  // ---- GREETINGS ----

  static String greeting(DateTime now, {bool perfectYesterday = false, bool missedYesterday = false, int dayAbsence = 0}) {
    if (dayAbsence >= 7) {
      return 'Welcome back. Nothing was lost. Begin again with one.';
    }
    if (now.isLateNight) {
      return 'It\'s late. One small act is enough.';
    }
    if (perfectYesterday) {
      return 'Welcome back, voyager. Yesterday was complete.';
    }
    if (missedYesterday) {
      return 'Today gravity returns. Where would you like to begin?';
    }

    return switch (now.greetingKey) {
      'morning' => 'Good morning',
      'afternoon' => 'Good afternoon',
      'evening' => 'Good evening',
      'night' => 'Good evening',
      _ => 'Welcome back',
    };
  }

  // ---- STREAKS ----

  static String streakBroken() =>
      'Yesterday drifted. Today gravity returns.';

  static String streakMilestone(int days) {
    return switch (days) {
      3 => 'Three days. A foundation is forming.',
      7 => 'Seven days \u2014 your first orbit is complete.',
      14 => 'Fourteen days of steady pull.',
      21 => 'Twenty-one days. This is becoming who you are.\n\n'
          '(The "21-day habit" is a myth \u2014 real habits form at your own pace. '
          'What matters is that you showed up.)',
      30 => 'Thirty days. This is who you are now.',
      50 => 'Fifty days \u2014 gravity is set.',
      75 => 'Seventy-five days. Your orbit is resilient.',
      100 => 'One hundred days \u2014 a centurion of consistency.',
      150 => 'One hundred fifty days. A steadfast star.',
      200 => 'Two hundred days \u2014 a bicentennial of becoming.',
      300 => 'Three hundred days of cosmic devotion.',
      365 => 'A year of light. You became this.',
      500 => 'Five hundred days \u2014 beyond years.',
      730 => 'Two years. A voyager of the highest order.',
      1000 => 'One thousand days \u2014 a millennium mind.',
      _ => '$days days. Your orbit holds.',
    };
  }

  static String streakFreezeApplied(int streakDays) =>
      'Your $streakDays-day orbit held. You earned this rest.';

  static String streakAtRisk(int streakDays) =>
      'Your $streakDays-day orbit is holding. One habit closes today.';

  // ---- TIER ----

  static String tierUp(String tierName) =>
      'You have become $tierName.';

  static String tierProgress(int currentTier, int nextTier, double progress) {
    final pct = (progress * 100).round();
    return 'Tier $currentTier \u2014 $pct% to Tier $nextTier';
  }

  // ---- COMPLETION ----

  static String completionCelebration(int done, int total) {
    if (done == total) return 'Every orbit complete. Your day is whole.';
    if (done == total - 1) return 'One remains. You are almost there.';
    if (done == 1) return 'The first act of the day \u2014 momentum begins.';
    return '$done habits done.';
  }

  static String lastHabitOfDay() =>
      'Your day is complete.';

  static String perfectDay() =>
      'Every orbit complete. Well done, voyager.';

  // ---- IDENTITY REINFORCEMENT ----

  static String identityStatement(String habitName, int streakDays) {
    if (streakDays >= 30) {
      return 'You are the kind of person who ${habitName.toLowerCase()}s daily.';
    }
    if (streakDays >= 7) {
      return 'You are building a ${habitName.toLowerCase()} practice.';
    }
    return 'Each time you ${habitName.toLowerCase()}, you become someone new.';
  }

  // ---- EMPTY STATES ----

  static const emptyToday = 'Your cosmos is waiting. Add a single small thing.';
  static const emptyStats = 'Complete habits to see your patterns emerge.';
  static const emptyAchievements = 'Your achievements will appear here as you grow.';

  // ---- RECOVERY ----

  static String recoveryQuestCopy(String habitName) =>
      'Complete $habitName 3 days in a row to rebuild momentum.';

  static const welcomeBack =
      'Welcome back. Nothing was lost. Begin again with one.';

  // ---- NOTIFICATIONS ----

  static String reminderBody(String emoji, String habitName) =>
      '$emoji $habitName \u2014 tap to complete';

  static String smartNudge(String habitName) =>
      'Your usual $habitName time. One moment is enough.';

  static String streakSaveReminder(int streakDays) =>
      'Your $streakDays-day orbit is holding. One habit closes today.';

  static const weeklyReviewNotification =
      'Your week is ready to reflect on.';

  // ---- FORBIDDEN PATTERNS (for reference/lint) ----
  // NEVER: "We miss you", "Come back!", "You haven't opened",
  //        "Other users are...", sales, promos, upsells, FOMO
  // NEVER: "you failed", "you broke your streak", "only X of Y"
  // NEVER: exclamation marks in default copy
}
