// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AchievementEntity _$AchievementEntityFromJson(Map<String, dynamic> json) =>
    AchievementEntity()
      ..id = (json['id'] as num?)?.toInt()
      ..achievementId = json['achievementId'] as String
      ..unlockedAt = json['unlockedAt'] == null
          ? null
          : DateTime.parse(json['unlockedAt'] as String)
      ..progress = (json['progress'] as num).toDouble();

Map<String, dynamic> _$AchievementEntityToJson(AchievementEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'achievementId': instance.achievementId,
      'unlockedAt': instance.unlockedAt?.toIso8601String(),
      'progress': instance.progress,
    };
