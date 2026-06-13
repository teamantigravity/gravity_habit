import 'package:isar/isar.dart';

part 'daily_quest_schema.g.dart';

@collection
class DailyQuestEntity {
  Id id = 0; // Singleton for current quest

  late String questId;
  late DateTime assignedDate;
  late bool isCompleted;
  late double progress;
  late int stardustReward;
}
