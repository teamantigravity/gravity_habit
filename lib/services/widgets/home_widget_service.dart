/// Platform widget service.
/// Provides data for home screen widgets:
/// - Small: Pull gauge
/// - Medium: Top 3 habits with tap-to-complete
/// - Large: Full orbit view
/// - Lock screen: Mini gauge (iOS 16+)
///
/// Widgets update via local timeline, no network calls.
class HomeWidgetService {
  HomeWidgetService._();

  static Future<void> updateWidgets({
    required double pullScore,
    required int completedCount,
    required int totalCount,
    required List<WidgetHabitData> topHabits,
  }) async {
    // Platform channel to native widget code
    // Android: AppWidgetProvider
    // iOS: WidgetKit timeline
    // Updates are pushed from app when data changes
  }
}

class WidgetHabitData {
  const WidgetHabitData({
    required this.id,
    required this.name,
    required this.emoji,
    required this.isComplete,
  });

  final String id;
  final String name;
  final String emoji;
  final bool isComplete;
}
