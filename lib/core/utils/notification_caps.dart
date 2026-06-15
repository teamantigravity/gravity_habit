/// Enforces the hard notification cap: max 5/day, configurable to 0.
/// Zero in quiet hours. Zero re-engagement spam ever.
class NotificationCaps {
  NotificationCaps._();

  static const maxPerDay = 5;

  static bool canSendNotification({
    required int sentTodayCount,
    required int quietHoursStart, // minutes from midnight
    required int quietHoursEnd,
    required DateTime now,
  }) {
    if (sentTodayCount >= maxPerDay) return false;

    final nowMinutes = now.hour * 60 + now.minute;

    // Check quiet hours (handles overnight ranges)
    if (quietHoursStart < quietHoursEnd) {
      // Same day range (e.g., 23:00 - 07:00 is overnight, not this case)
      if (nowMinutes >= quietHoursStart && nowMinutes < quietHoursEnd) {
        return false;
      }
    } else {
      // Overnight range (e.g., 23:00 - 07:00)
      if (nowMinutes >= quietHoursStart || nowMinutes < quietHoursEnd) {
        return false;
      }
    }

    return true;
  }

  /// FORBIDDEN notification copy patterns.
  static const forbiddenPatterns = [
    'we miss you',
    'come back',
    "you haven't opened",
    'other users',
    'limited time',
    'sale',
    'discount',
    'hurry',
    "don't miss",
    'last chance',
  ];

  static bool isForbiddenCopy(String text) {
    final lower = text.toLowerCase();
    return forbiddenPatterns.any(lower.contains);
  }
}
