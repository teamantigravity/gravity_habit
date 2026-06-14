import 'package:json_annotation/json_annotation.dart';

part 'daily_quest_schema.g.dart';

@JsonSerializable()
class DailyQuestEntity {
  int id = 0; // Singleton for current quest

  late String questId;
  late DateTime assignedDate;
  late bool isCompleted;
  late double progress;
  late int stardustReward;

  DailyQuestEntity();

  factory DailyQuestEntity.fromJson(Map<String, dynamic> json) => _$DailyQuestEntityFromJson(json);
  Map<String, dynamic> toJson() => _$DailyQuestEntityToJson(this);
}
