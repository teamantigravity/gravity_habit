import 'package:isar/isar.dart';

part 'habit_schema.g.dart';

@collection
class HabitEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  late String name;
  late String emoji;
  late int color;
  String? description;

  @Enumerated(EnumType.ordinal)
  late HabitFrequency frequency;

  String? frequencyConfigJson;

  @Enumerated(EnumType.ordinal)
  late HabitTargetType targetType;

  late double targetValue;
  late String unit;

  String? reminderTimesJson; // List<TimeOfDay> serialized
  String? reminderDaysJson; // List<int> serialized

  @Enumerated(EnumType.ordinal)
  late GravityClass gravityClass;

  late DateTime createdAt;
  DateTime? archivedAt;
  late int order;

  String? categoryId;
  String? linkedHabitIdsJson; // List<String> serialized
  String? cueText;
  String? whyText;

  @Index()
  bool get isArchived => archivedAt != null;
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
