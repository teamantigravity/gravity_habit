import 'package:json_annotation/json_annotation.dart';

part 'daily_quest_schema.g.dart';

@JsonSerializable()
class DailyQuestEntity {
  DailyQuestEntity();

  factory DailyQuestEntity.fromJson(Map<String, dynamic> json) =>
      _$DailyQuestEntityFromJson(json);
  int id = 0; // Singleton for current quest

  late String questId;
  late DateTime assignedDate;
  late bool isCompleted;
  late double progress;
  late int stardustReward;
  Map<String, dynamic> toJson() => _$DailyQuestEntityToJson(this);
}
