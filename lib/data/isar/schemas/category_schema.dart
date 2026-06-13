import 'package:isar/isar.dart';

part 'category_schema.g.dart';

@collection
class CategoryEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String uuid;

  late String name;
  late String emoji;
  late int color;
  late int order;
}
