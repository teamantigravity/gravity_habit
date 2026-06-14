// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_quest_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyQuestEntity _$DailyQuestEntityFromJson(Map<String, dynamic> json) =>
    DailyQuestEntity()
      ..id = (json['id'] as num).toInt()
      ..questId = json['questId'] as String
      ..assignedDate = DateTime.parse(json['assignedDate'] as String)
      ..isCompleted = json['isCompleted'] as bool
      ..progress = (json['progress'] as num).toDouble()
      ..stardustReward = (json['stardustReward'] as num).toInt();

Map<String, dynamic> _$DailyQuestEntityToJson(DailyQuestEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'questId': instance.questId,
      'assignedDate': instance.assignedDate.toIso8601String(),
      'isCompleted': instance.isCompleted,
      'progress': instance.progress,
      'stardustReward': instance.stardustReward,
    };
