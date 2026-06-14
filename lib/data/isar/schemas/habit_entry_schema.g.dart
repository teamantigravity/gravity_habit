// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_entry_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitEntryEntity _$HabitEntryEntityFromJson(Map<String, dynamic> json) =>
    HabitEntryEntity()
      ..id = (json['id'] as num?)?.toInt()
      ..uuid = json['uuid'] as String
      ..habitId = json['habitId'] as String
      ..date = DateTime.parse(json['date'] as String)
      ..completedValue = (json['completedValue'] as num).toDouble()
      ..isComplete = json['isComplete'] as bool
      ..completedAt = json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String)
      ..note = json['note'] as String?
      ..mood = (json['mood'] as num?)?.toInt()
      ..skipReason = json['skipReason'] as String?;

Map<String, dynamic> _$HabitEntryEntityToJson(HabitEntryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'habitId': instance.habitId,
      'date': instance.date.toIso8601String(),
      'completedValue': instance.completedValue,
      'isComplete': instance.isComplete,
      'completedAt': instance.completedAt?.toIso8601String(),
      'note': instance.note,
      'mood': instance.mood,
      'skipReason': instance.skipReason,
    };
