import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_habit/core/utils/notification_caps.dart';

void main() {
  group('NotificationCaps', () {
    test('blocks after 5 notifications sent', () {
      expect(
        NotificationCaps.canSendNotification(
          sentTodayCount: 5,
          quietHoursStart: 1380,
          quietHoursEnd: 420,
          now: DateTime(2025, 1, 1, 12),
        ),
        false,
      );
    });

    test('allows first notification of the day', () {
      expect(
        NotificationCaps.canSendNotification(
          sentTodayCount: 0,
          quietHoursStart: 1380,
          quietHoursEnd: 420,
          now: DateTime(2025, 1, 1, 12),
        ),
        true,
      );
    });

    test('blocks during quiet hours (overnight)', () {
      expect(
        NotificationCaps.canSendNotification(
          sentTodayCount: 0,
          quietHoursStart: 1380, // 23:00
          quietHoursEnd: 420, // 07:00
          now: DateTime(2025, 1, 1, 23, 30),
        ),
        false,
      );
    });

    test('blocks during quiet hours (early morning)', () {
      expect(
        NotificationCaps.canSendNotification(
          sentTodayCount: 0,
          quietHoursStart: 1380,
          quietHoursEnd: 420,
          now: DateTime(2025, 1, 1, 3),
        ),
        false,
      );
    });

    test('allows outside quiet hours', () {
      expect(
        NotificationCaps.canSendNotification(
          sentTodayCount: 0,
          quietHoursStart: 1380,
          quietHoursEnd: 420,
          now: DateTime(2025, 1, 1, 8),
        ),
        true,
      );
    });

    test('detects forbidden notification copy', () {
      expect(NotificationCaps.isForbiddenCopy('We miss you'), true);
      expect(NotificationCaps.isForbiddenCopy('Come back to the app'), true);
      expect(NotificationCaps.isForbiddenCopy('Limited time offer'), true);
      expect(NotificationCaps.isForbiddenCopy('Your orbit holds'), false);
      expect(
        NotificationCaps.isForbiddenCopy('Your usual Meditate time'),
        false,
      );
    });
  });
}
