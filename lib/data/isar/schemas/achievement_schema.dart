import 'package:json_annotation/json_annotation.dart';

part 'achievement_schema.g.dart';

@JsonSerializable()
class AchievementEntity {
  // 0.0 to 1.0

  AchievementEntity();

  factory AchievementEntity.fromJson(Map<String, dynamic> json) =>
      _$AchievementEntityFromJson(json);
  int? id;

  late String achievementId;

  DateTime? unlockedAt;
  late double progress;
  Map<String, dynamic> toJson() => _$AchievementEntityToJson(this);
}
