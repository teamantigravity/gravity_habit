import 'package:isar/isar.dart';

part 'habit_entry_schema.g.dart';

@collection
class HabitEntryEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  @Index()
  late String habitId;

  @Index()
  late DateTime date;

  late double completedValue;
  late bool isComplete;
  DateTime? completedAt;
  String? note;
  int? mood; // 1-5
  
  @Enumerated(EnumType.name)
  SkipReason? skipReason;
}

enum SkipReason {
  sick,
  traveling,
  restDay,
  forgot,
  other,
}
