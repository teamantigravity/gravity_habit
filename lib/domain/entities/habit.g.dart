// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitImpl _$$HabitImplFromJson(Map<String, dynamic> json) => _$HabitImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      emoji: json['emoji'] as String,
      color: (json['color'] as num).toInt(),
      frequency: $enumDecode(_$HabitFrequencyEnumMap, json['frequency']),
      targetType: $enumDecode(_$HabitTargetTypeEnumMap, json['targetType']),
      targetValue: (json['targetValue'] as num).toDouble(),
      unit: json['unit'] as String,
      gravityClass: $enumDecode(_$GravityClassEnumMap, json['gravityClass']),
      createdAt: DateTime.parse(json['createdAt'] as String),
      order: (json['order'] as num).toInt(),
      description: json['description'] as String?,
      frequencyConfig: json['frequencyConfig'] as Map<String, dynamic>?,
      reminderTimes: (json['reminderTimes'] as List<dynamic>?)
              ?.map((e) => TimeOfDayData.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      reminderDays: (json['reminderDays'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      archivedAt: json['archivedAt'] == null
          ? null
          : DateTime.parse(json['archivedAt'] as String),
      categoryId: json['categoryId'] as String?,
      linkedHabitIds: (json['linkedHabitIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cueText: json['cueText'] as String?,
      whyText: json['whyText'] as String?,
    );

Map<String, dynamic> _$$HabitImplToJson(_$HabitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'emoji': instance.emoji,
      'color': instance.color,
      'frequency': _$HabitFrequencyEnumMap[instance.frequency]!,
      'targetType': _$HabitTargetTypeEnumMap[instance.targetType]!,
      'targetValue': instance.targetValue,
      'unit': instance.unit,
      'gravityClass': _$GravityClassEnumMap[instance.gravityClass]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'order': instance.order,
      'description': instance.description,
      'frequencyConfig': instance.frequencyConfig,
      'reminderTimes': instance.reminderTimes,
      'reminderDays': instance.reminderDays,
      'archivedAt': instance.archivedAt?.toIso8601String(),
      'categoryId': instance.categoryId,
      'linkedHabitIds': instance.linkedHabitIds,
      'cueText': instance.cueText,
      'whyText': instance.whyText,
    };

const _$HabitFrequencyEnumMap = {
  HabitFrequency.daily: 'daily',
  HabitFrequency.weeklyOnDays: 'weeklyOnDays',
  HabitFrequency.xTimesPerWeek: 'xTimesPerWeek',
  HabitFrequency.everyNDays: 'everyNDays',
  HabitFrequency.custom: 'custom',
};

const _$HabitTargetTypeEnumMap = {
  HabitTargetType.binary: 'binary',
  HabitTargetType.count: 'count',
  HabitTargetType.duration: 'duration',
  HabitTargetType.distance: 'distance',
};

const _$GravityClassEnumMap = {
  GravityClass.feather: 'feather',
  GravityClass.pebble: 'pebble',
  GravityClass.stone: 'stone',
  GravityClass.boulder: 'boulder',
  GravityClass.planet: 'planet',
};

_$TimeOfDayDataImpl _$$TimeOfDayDataImplFromJson(Map<String, dynamic> json) =>
    _$TimeOfDayDataImpl(
      hour: (json['hour'] as num).toInt(),
      minute: (json['minute'] as num).toInt(),
    );

Map<String, dynamic> _$$TimeOfDayDataImplToJson(_$TimeOfDayDataImpl instance) =>
    <String, dynamic>{
      'hour': instance.hour,
      'minute': instance.minute,
    };

_$HabitEntryImpl _$$HabitEntryImplFromJson(Map<String, dynamic> json) =>
    _$HabitEntryImpl(
      id: json['id'] as String,
      habitId: json['habitId'] as String,
      date: DateTime.parse(json['date'] as String),
      completedValue: (json['completedValue'] as num).toDouble(),
      isComplete: json['isComplete'] as bool,
      completedAt: json['completedAt'] == null
          ? null
          : DateTime.parse(json['completedAt'] as String),
      note: json['note'] as String?,
      mood: (json['mood'] as num?)?.toInt(),
      skipReason: $enumDecodeNullable(_$SkipReasonEnumMap, json['skipReason']),
    );

Map<String, dynamic> _$$HabitEntryImplToJson(_$HabitEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'habitId': instance.habitId,
      'date': instance.date.toIso8601String(),
      'completedValue': instance.completedValue,
      'isComplete': instance.isComplete,
      'completedAt': instance.completedAt?.toIso8601String(),
      'note': instance.note,
      'mood': instance.mood,
      'skipReason': _$SkipReasonEnumMap[instance.skipReason],
    };

const _$SkipReasonEnumMap = {
  SkipReason.sick: 'sick',
  SkipReason.traveling: 'traveling',
  SkipReason.restDay: 'restDay',
  SkipReason.forgot: 'forgot',
  SkipReason.other: 'other',
};
