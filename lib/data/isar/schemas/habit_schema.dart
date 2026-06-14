import 'package:json_annotation/json_annotation.dart';

part 'habit_schema.g.dart';

@JsonSerializable()
class HabitEntity {
  int? id;

  late String uuid;

  late String name;
  late String emoji;
  late int color;
  String? description;

  late String frequency;

  String? frequencyConfigJson;

  late String targetType;

  late double targetValue;
  late String unit;

  String? reminderTimesJson; // List<TimeOfDay> serialized
  String? reminderDaysJson; // List<int> serialized

  late String gravityClass;

  late DateTime createdAt;
  DateTime? archivedAt;
  late int order;

  String? categoryId;
  String? linkedHabitIdsJson; // List<String> serialized
  String? cueText;
  String? whyText;

  bool get isArchived => archivedAt != null;

  HabitEntity();

  factory HabitEntity.fromJson(Map<String, dynamic> json) => _$HabitEntityFromJson(json);
  Map<String, dynamic> toJson() => _$HabitEntityToJson(this);
}

enum HabitFrequency {
  daily,
  weeklyOnDays,
  xTimesPerWeek,
  everyNDays,
  custom,
}

enum HabitTargetType {
  binary,
  count,
  duration,
  distance,
}

enum GravityClass {
  feather,
  pebble,
  stone,
  boulder,
  planet,
}
