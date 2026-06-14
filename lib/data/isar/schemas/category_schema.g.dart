// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryEntity _$CategoryEntityFromJson(Map<String, dynamic> json) =>
    CategoryEntity()
      ..id = (json['id'] as num?)?.toInt()
      ..uuid = json['uuid'] as String
      ..name = json['name'] as String
      ..emoji = json['emoji'] as String
      ..color = (json['color'] as num).toInt()
      ..order = (json['order'] as num).toInt();

Map<String, dynamic> _$CategoryEntityToJson(CategoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'name': instance.name,
      'emoji': instance.emoji,
      'color': instance.color,
      'order': instance.order,
    };
