extension DateTimeX on DateTime {
  DateTime get dateOnly => DateTime(year, month, day);

  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool get isToday => isSameDay(DateTime.now());
  bool get isYesterday =>
      isSameDay(DateTime.now().subtract(const Duration(days: 1)));

  int get dayOfYear {
    final firstDay = DateTime(year);
    return difference(firstDay).inDays + 1;
  }

  String get greetingKey {
    final hour = this.hour;
    if (hour < 5) return 'night';
    if (hour < 12) return 'morning';
    if (hour < 17) return 'afternoon';
    if (hour < 21) return 'evening';
    return 'night';
  }

  bool get isLateNight => hour >= 23 || hour < 5;
}
