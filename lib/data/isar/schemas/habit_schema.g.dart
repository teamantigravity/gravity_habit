// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HabitEntity _$HabitEntityFromJson(Map<String, dynamic> json) => HabitEntity()
  ..id = (json['id'] as num?)?.toInt()
  ..uuid = json['uuid'] as String
  ..name = json['name'] as String
  ..emoji = json['emoji'] as String
  ..color = (json['color'] as num).toInt()
  ..description = json['description'] as String?
  ..frequency = json['frequency'] as String
  ..frequencyConfigJson = json['frequencyConfigJson'] as String?
  ..targetType = json['targetType'] as String
  ..targetValue = (json['targetValue'] as num).toDouble()
  ..unit = json['unit'] as String
  ..reminderTimesJson = json['reminderTimesJson'] as String?
  ..reminderDaysJson = json['reminderDaysJson'] as String?
  ..gravityClass = json['gravityClass'] as String
  ..createdAt = DateTime.parse(json['createdAt'] as String)
  ..archivedAt = json['archivedAt'] == null
      ? null
      : DateTime.parse(json['archivedAt'] as String)
  ..order = (json['order'] as num).toInt()
  ..categoryId = json['categoryId'] as String?
  ..linkedHabitIdsJson = json['linkedHabitIdsJson'] as String?
  ..cueText = json['cueText'] as String?
  ..whyText = json['whyText'] as String?;

Map<String, dynamic> _$HabitEntityToJson(HabitEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'emoji': instance.emoji,
      'color': instance.color,
      'description': instance.description,
      'frequency': instance.frequency,
      'frequencyConfigJson': instance.frequencyConfigJson,
      'targetType': instance.targetType,
      'targetValue': instance.targetValue,
      'unit': instance.unit,
      'reminderTimesJson': instance.reminderTimesJson,
      'reminderDaysJson': instance.reminderDaysJson,
      'gravityClass': instance.gravityClass,
      'createdAt': instance.createdAt.toIso8601String(),
      'archivedAt': instance.archivedAt?.toIso8601String(),
      'order': instance.order,
      'categoryId': instance.categoryId,
      'linkedHabitIdsJson': instance.linkedHabitIdsJson,
      'cueText': instance.cueText,
      'whyText': instance.whyText,
    };
