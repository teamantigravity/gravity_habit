import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timezone/timezone.dart' as tz;

final notificationServiceProvider = Provider<NotificationService>((ref) {
  throw UnimplementedError('Must be overridden');
});

class NotificationService {
  final _plugin = FlutterLocalNotificationsPlugin();

  Future<void> initialize() async {
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );
    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTap,
    );
  }

  void _onNotificationTap(NotificationResponse response) {
    // Handle notification action — deep link to habit
  }

  Future<bool> requestPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (android != null) {
      return await android.requestNotificationsPermission() ?? false;
    }

    final ios = _plugin.resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>();
    if (ios != null) {
      return await ios.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          ) ??
          false;
    }

    return false;
  }

  Future<void> scheduleHabitReminder({
    required int notificationId,
    required String habitName,
    required String emoji,
    required int hour,
    required int minute,
    required List<int> days,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'habit_reminders',
      'Habit Reminders',
      channelDescription: 'Reminders for your habits',
      category: AndroidNotificationCategory.reminder,
      actions: [
        AndroidNotificationAction('complete', 'Complete'),
        AndroidNotificationAction('skip', 'Skip'),
        AndroidNotificationAction('snooze', 'Snooze 1hr'),
      ],
    );

    const iosDetails = DarwinNotificationDetails(
      categoryIdentifier: 'habit_reminder',
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    for (final day in days) {
      await _plugin.zonedSchedule(
        notificationId + day,
        '$emoji $habitName',
        'Tap to complete',
        _nextInstanceOfDayTime(day, hour, minute),
        details,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.wallClockTime,
        matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
      );
    }
  }

  tz.TZDateTime _nextInstanceOfDayTime(int day, int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    while (scheduledDate.weekday != day) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 7));
    }

    return scheduledDate;
  }

  Future<void> cancelHabitReminders(int baseNotificationId) async {
    for (var day = 1; day <= 7; day++) {
      await _plugin.cancel(baseNotificationId + day);
    }
  }

  Future<void> cancelAll() async {
    await _plugin.cancelAll();
  }
}
