import 'package:json_annotation/json_annotation.dart';

part 'achievement_schema.g.dart';

@JsonSerializable()
class AchievementEntity {
  int? id;

  late String achievementId;

  DateTime? unlockedAt;
  late double progress; // 0.0 to 1.0

  AchievementEntity();

  factory AchievementEntity.fromJson(Map<String, dynamic> json) => _$AchievementEntityFromJson(json);
  Map<String, dynamic> toJson() => _$AchievementEntityToJson(this);
}
