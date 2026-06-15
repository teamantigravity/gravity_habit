import 'dart:convert';

import 'package:gravity_habit/data/repositories/habit_repository.dart';
import 'package:gravity_habit/data/repositories/orbit_repository.dart';

class DataExporter {
  DataExporter(this._habitRepo, this._orbitRepo);

  final HabitRepository _habitRepo;
  final OrbitRepository _orbitRepo;

  Future<String> exportToJson() async {
    final habits = await _habitRepo.getAllHabits(includeArchived: true);
    final allEntries = <Map<String, dynamic>>[];
    for (final habit in habits) {
      final entries = await _habitRepo.getEntriesForHabit(habit.id);
      for (final entry in entries) {
        allEntries.add({
          'id': entry.id,
          'habitId': entry.habitId,
          'date': entry.date.toIso8601String(),
          'completedValue': entry.completedValue,
          'isComplete': entry.isComplete,
          'completedAt': entry.completedAt?.toIso8601String(),
          'note': entry.note,
          'mood': entry.mood,
          'skipReason': entry.skipReason?.index,
        });
      }
    }

    final profile = await _orbitRepo.getProfile();

    final export = {
      'version': 1,
      'exportedAt': DateTime.now().toIso8601String(),
      'habits': habits
          .map(
            (h) => {
              'id': h.id,
              'name': h.name,
              'emoji': h.emoji,
              'color': h.color,
              'description': h.description,
              'frequency': h.frequency.index,
              'targetType': h.targetType.index,
              'targetValue': h.targetValue,
              'unit': h.unit,
              'gravityClass': h.gravityClass.index,
              'createdAt': h.createdAt.toIso8601String(),
              'archivedAt': h.archivedAt?.toIso8601String(),
              'order': h.order,
              'categoryId': h.categoryId,
              'cueText': h.cueText,
              'whyText': h.whyText,
            },
          )
          .toList(),
      'entries': allEntries,
      'profile': {
        'totalMass': profile.totalMass,
        'currentOrbitTier': profile.currentOrbitTier,
        'collectedStardust': profile.collectedStardust,
        'prestigeLevel': profile.prestigeLevel,
      },
    };

    return const JsonEncoder.withIndent('  ').convert(export);
  }

  Future<String> exportToCsv() async {
    final habits = await _habitRepo.getAllHabits(includeArchived: true);
    final buffer = StringBuffer();
    buffer.writeln('habit_name,date,completed,value,note,mood,skip_reason');

    for (final habit in habits) {
      final entries = await _habitRepo.getEntriesForHabit(habit.id);
      for (final entry in entries) {
        buffer.writeln(
          '${_escapeCsv(habit.name)},${entry.date.toIso8601String().split("T").first},'
          '${entry.isComplete},${entry.completedValue},'
          '${_escapeCsv(entry.note ?? "")},${entry.mood ?? ""},'
          '${entry.skipReason?.name ?? ""}',
        );
      }
    }

    return buffer.toString();
  }

  String _escapeCsv(String value) {
    if (value.contains(',') || value.contains('"') || value.contains('\n')) {
      return '"${value.replaceAll('"', '""')}"';
    }
    return value;
  }
}
