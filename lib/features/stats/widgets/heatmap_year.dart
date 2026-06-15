import 'package:flutter/material.dart';
import 'package:gravity_habit/domain/entities/habit.dart';

class HeatmapYear extends StatelessWidget {
  const HeatmapYear({
    required this.entries,
    required this.accentColor,
    super.key,
  });

  final List<HabitEntry> entries;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final completionsPerDay = <String, int>{};

    for (final e in entries.where((e) => e.isComplete)) {
      final key = '${e.date.year}-${e.date.month}-${e.date.day}';
      completionsPerDay[key] = (completionsPerDay[key] ?? 0) + 1;
    }

    final maxCompletions = completionsPerDay.values.isEmpty
        ? 1
        : completionsPerDay.values.reduce((a, b) => a > b ? a : b);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        direction: Axis.vertical,
        spacing: 2,
        runSpacing: 2,
        children: List.generate(365, (i) {
          final date = now.subtract(Duration(days: 364 - i));
          final key = '${date.year}-${date.month}-${date.day}';
          final count = completionsPerDay[key] ?? 0;
          final intensity = maxCompletions > 0 ? count / maxCompletions : 0.0;

          return Semantics(
            label: '${date.month}/${date.day}: $count completions',
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                color: count == 0
                    ? accentColor.withValues(alpha: 0.05)
                    : accentColor.withValues(alpha: 0.2 + intensity * 0.8),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }
}
