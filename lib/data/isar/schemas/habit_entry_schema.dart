import 'package:json_annotation/json_annotation.dart';

part 'habit_entry_schema.g.dart';

@JsonSerializable()
class HabitEntryEntity {
  int? id;

  late String uuid;

  late String habitId;

  late DateTime date;

  late double completedValue;
  late bool isComplete;
  DateTime? completedAt;
  String? note;
  int? mood; // 1-5
  
  String? skipReason;

  HabitEntryEntity();

  factory HabitEntryEntity.fromJson(Map<String, dynamic> json) => _$HabitEntryEntityFromJson(json);
  Map<String, dynamic> toJson() => _$HabitEntryEntityToJson(this);
}

enum SkipReason {
  sick,
  traveling,
  restDay,
  forgot,
  other,
}
