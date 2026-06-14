import 'dart:convert';

import 'package:gravity_habit/data/repositories/habit_repository.dart';
import 'package:gravity_habit/data/repositories/orbit_repository.dart';
import 'package:gravity_habit/domain/entities/habit.dart';
import 'package:gravity_habit/domain/entities/orbit_profile.dart';

class DataImporter {
  DataImporter(this._habitRepo, this._orbitRepo);

  final HabitRepository _habitRepo;
  final OrbitRepository _orbitRepo;

  /// Import from .gravity JSON file.
  /// Returns number of habits imported.
  Future<ImportResult> importFromJson(String jsonString) async {
    try {
      final data = jsonDecode(jsonString) as Map<String, dynamic>;

      // Schema validation
      final version = data['version'] as int?;
      if (version == null || version < 1) {
        return const ImportResult(success: false, message: 'Invalid file version');
      }

      final habitsJson = data['habits'] as List<dynamic>?;
      if (habitsJson == null) {
        return const ImportResult(success: false, message: 'No habits found in file');
      }

      var imported = 0;
      for (final hJson in habitsJson) {
        final h = hJson as Map<String, dynamic>;
        await _habitRepo.createHabit(
          Habit(
            id: '',
            name: h['name'] as String? ?? 'Imported Habit',
            emoji: h['emoji'] as String? ?? '⭐',
            color: h['color'] as int? ?? 0xFF6EE7FF,
            description: h['description'] as String?,
            frequency: HabitFrequency.values[(h['frequency'] as int?) ?? 0],
            targetType: HabitTargetType.values[(h['targetType'] as int?) ?? 0],
            targetValue: (h['targetValue'] as num?)?.toDouble() ?? 1,
            unit: h['unit'] as String? ?? '',
            gravityClass: GravityClass.values[(h['gravityClass'] as int?) ?? 1],
            createdAt: h['createdAt'] != null
                ? DateTime.parse(h['createdAt'] as String)
                : DateTime.now(),
            archivedAt: h['archivedAt'] != null
                ? DateTime.parse(h['archivedAt'] as String)
                : null,
            order: h['order'] as int? ?? imported,
            categoryId: h['categoryId'] as String?,
            cueText: h['cueText'] as String?,
            whyText: h['whyText'] as String?,
          ),
        );
        imported++;
      }

      // Import entries
      final entriesJson = data['entries'] as List<dynamic>?;
      if (entriesJson != null) {
        for (final eJson in entriesJson) {
          final e = eJson as Map<String, dynamic>;
          await _habitRepo.createEntry(
            HabitEntry(
              id: '',
              habitId: e['habitId'] as String,
              date: DateTime.parse(e['date'] as String),
              completedValue: (e['completedValue'] as num).toDouble(),
              isComplete: e['isComplete'] as bool,
              completedAt: e['completedAt'] != null
                  ? DateTime.parse(e['completedAt'] as String)
                  : null,
              note: e['note'] as String?,
              mood: e['mood'] as int?,
            ),
          );
        }
      }

      return ImportResult(
        success: true,
        message: 'Imported $imported habits',
        habitsImported: imported,
      );
    } catch (e) {
      return ImportResult(
        success: false,
        message: 'Import failed: ${e.toString().take(100)}',
      );
    }
  }
}

class ImportResult {
  const ImportResult({
    required this.success,
    required this.message,
    this.habitsImported = 0,
  });

  final bool success;
  final String message;
  final int habitsImported;
}

extension _StringTake on String {
  String take(int n) => length <= n ? this : substring(0, n);
}
