import 'package:isar/isar.dart';

part 'achievement_schema.g.dart';

@collection
class AchievementEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String achievementId;

  DateTime? unlockedAt;
  late double progress; // 0.0 to 1.0
}
