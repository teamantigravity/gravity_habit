// lib/domain/entities/habit.dart
// COMPLETE CORRECTED FILE

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gravity_habit/data/isar/schemas/habit_entry_schema.dart';
import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';

part 'habit.freezed.dart';
part 'habit.g.dart';

@freezed
class Habit with _$Habit {
  const factory Habit({
    required String id,
    required String name,
    required String emoji,
    required int color,
    required HabitFrequency frequency,
    required HabitTargetType targetType,
    required double targetValue,
    required String unit,
    required GravityClass gravityClass,
    required DateTime createdAt,
    required int order,
    String? description,
    Map<String, dynamic>? frequencyConfig,
    @Default([]) List<TimeOfDayData> reminderTimes,
    @Default([]) List<int> reminderDays,
    DateTime? archivedAt,
    String? categoryId,
    @Default([]) List<String> linkedHabitIds,
    String? cueText,
    String? whyText,
  }) = _Habit;

  factory Habit.fromJson(Map<String, dynamic> json) => _$HabitFromJson(json);
}

@freezed
class TimeOfDayData with _$TimeOfDayData {
  const factory TimeOfDayData({
    required int hour,
    required int minute,
  }) = _TimeOfDayData;

  factory TimeOfDayData.fromJson(Map<String, dynamic> json) =>
      _$TimeOfDayDataFromJson(json);
}

@freezed
class HabitEntry with _$HabitEntry {
  const factory HabitEntry({
    required String id,
    required String habitId,
    required DateTime date,
    required double completedValue,
    required bool isComplete,
    DateTime? completedAt,
    String? note,
    int? mood,
    SkipReason?
        skipReason, // Now correctly imported from habit_entry_schema.dart
  }) = _HabitEntry;

  factory HabitEntry.fromJson(Map<String, dynamic> json) =>
      _$HabitEntryFromJson(json);
}
