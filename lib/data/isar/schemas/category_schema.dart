import 'package:json_annotation/json_annotation.dart';

part 'category_schema.g.dart';

@JsonSerializable()
class CategoryEntity {
  CategoryEntity();

  factory CategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$CategoryEntityFromJson(json);
  int? id;

  late String uuid;

  late String name;
  late String emoji;
  late int color;
  late int order;
  Map<String, dynamic> toJson() => _$CategoryEntityToJson(this);
}
