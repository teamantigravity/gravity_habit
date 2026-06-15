// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Habit _$HabitFromJson(Map<String, dynamic> json) {
  return _Habit.fromJson(json);
}

/// @nodoc
mixin _$Habit {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get emoji => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  HabitFrequency get frequency => throw _privateConstructorUsedError;
  HabitTargetType get targetType => throw _privateConstructorUsedError;
  double get targetValue => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  GravityClass get gravityClass => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Map<String, dynamic>? get frequencyConfig =>
      throw _privateConstructorUsedError;
  List<TimeOfDayData> get reminderTimes => throw _privateConstructorUsedError;
  List<int> get reminderDays => throw _privateConstructorUsedError;
  DateTime? get archivedAt => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  List<String> get linkedHabitIds => throw _privateConstructorUsedError;
  String? get cueText => throw _privateConstructorUsedError;
  String? get whyText => throw _privateConstructorUsedError;

  /// Serializes this Habit to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitCopyWith<Habit> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCopyWith<$Res> {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) then) =
      _$HabitCopyWithImpl<$Res, Habit>;
  @useResult
  $Res call(
      {String id,
      String name,
      String emoji,
      int color,
      HabitFrequency frequency,
      HabitTargetType targetType,
      double targetValue,
      String unit,
      GravityClass gravityClass,
      DateTime createdAt,
      int order,
      String? description,
      Map<String, dynamic>? frequencyConfig,
      List<TimeOfDayData> reminderTimes,
      List<int> reminderDays,
      DateTime? archivedAt,
      String? categoryId,
      List<String> linkedHabitIds,
      String? cueText,
      String? whyText});
}

/// @nodoc
class _$HabitCopyWithImpl<$Res, $Val extends Habit>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? emoji = null,
    Object? color = null,
    Object? frequency = null,
    Object? targetType = null,
    Object? targetValue = null,
    Object? unit = null,
    Object? gravityClass = null,
    Object? createdAt = null,
    Object? order = null,
    Object? description = freezed,
    Object? frequencyConfig = freezed,
    Object? reminderTimes = null,
    Object? reminderDays = null,
    Object? archivedAt = freezed,
    Object? categoryId = freezed,
    Object? linkedHabitIds = null,
    Object? cueText = freezed,
    Object? whyText = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as HabitFrequency,
      targetType: null == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as HabitTargetType,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      gravityClass: null == gravityClass
          ? _value.gravityClass
          : gravityClass // ignore: cast_nullable_to_non_nullable
              as GravityClass,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      frequencyConfig: freezed == frequencyConfig
          ? _value.frequencyConfig
          : frequencyConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      reminderTimes: null == reminderTimes
          ? _value.reminderTimes
          : reminderTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDayData>,
      reminderDays: null == reminderDays
          ? _value.reminderDays
          : reminderDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      archivedAt: freezed == archivedAt
          ? _value.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedHabitIds: null == linkedHabitIds
          ? _value.linkedHabitIds
          : linkedHabitIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cueText: freezed == cueText
          ? _value.cueText
          : cueText // ignore: cast_nullable_to_non_nullable
              as String?,
      whyText: freezed == whyText
          ? _value.whyText
          : whyText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitImplCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$$HabitImplCopyWith(
          _$HabitImpl value, $Res Function(_$HabitImpl) then) =
      __$$HabitImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String emoji,
      int color,
      HabitFrequency frequency,
      HabitTargetType targetType,
      double targetValue,
      String unit,
      GravityClass gravityClass,
      DateTime createdAt,
      int order,
      String? description,
      Map<String, dynamic>? frequencyConfig,
      List<TimeOfDayData> reminderTimes,
      List<int> reminderDays,
      DateTime? archivedAt,
      String? categoryId,
      List<String> linkedHabitIds,
      String? cueText,
      String? whyText});
}

/// @nodoc
class __$$HabitImplCopyWithImpl<$Res>
    extends _$HabitCopyWithImpl<$Res, _$HabitImpl>
    implements _$$HabitImplCopyWith<$Res> {
  __$$HabitImplCopyWithImpl(
      _$HabitImpl _value, $Res Function(_$HabitImpl) _then)
      : super(_value, _then);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? emoji = null,
    Object? color = null,
    Object? frequency = null,
    Object? targetType = null,
    Object? targetValue = null,
    Object? unit = null,
    Object? gravityClass = null,
    Object? createdAt = null,
    Object? order = null,
    Object? description = freezed,
    Object? frequencyConfig = freezed,
    Object? reminderTimes = null,
    Object? reminderDays = null,
    Object? archivedAt = freezed,
    Object? categoryId = freezed,
    Object? linkedHabitIds = null,
    Object? cueText = freezed,
    Object? whyText = freezed,
  }) {
    return _then(_$HabitImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      emoji: null == emoji
          ? _value.emoji
          : emoji // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      frequency: null == frequency
          ? _value.frequency
          : frequency // ignore: cast_nullable_to_non_nullable
              as HabitFrequency,
      targetType: null == targetType
          ? _value.targetType
          : targetType // ignore: cast_nullable_to_non_nullable
              as HabitTargetType,
      targetValue: null == targetValue
          ? _value.targetValue
          : targetValue // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      gravityClass: null == gravityClass
          ? _value.gravityClass
          : gravityClass // ignore: cast_nullable_to_non_nullable
              as GravityClass,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      frequencyConfig: freezed == frequencyConfig
          ? _value._frequencyConfig
          : frequencyConfig // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      reminderTimes: null == reminderTimes
          ? _value._reminderTimes
          : reminderTimes // ignore: cast_nullable_to_non_nullable
              as List<TimeOfDayData>,
      reminderDays: null == reminderDays
          ? _value._reminderDays
          : reminderDays // ignore: cast_nullable_to_non_nullable
              as List<int>,
      archivedAt: freezed == archivedAt
          ? _value.archivedAt
          : archivedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      linkedHabitIds: null == linkedHabitIds
          ? _value._linkedHabitIds
          : linkedHabitIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cueText: freezed == cueText
          ? _value.cueText
          : cueText // ignore: cast_nullable_to_non_nullable
              as String?,
      whyText: freezed == whyText
          ? _value.whyText
          : whyText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitImpl implements _Habit {
  const _$HabitImpl(
      {required this.id,
      required this.name,
      required this.emoji,
      required this.color,
      required this.frequency,
      required this.targetType,
      required this.targetValue,
      required this.unit,
      required this.gravityClass,
      required this.createdAt,
      required this.order,
      this.description,
      final Map<String, dynamic>? frequencyConfig,
      final List<TimeOfDayData> reminderTimes = const [],
      final List<int> reminderDays = const [],
      this.archivedAt,
      this.categoryId,
      final List<String> linkedHabitIds = const [],
      this.cueText,
      this.whyText})
      : _frequencyConfig = frequencyConfig,
        _reminderTimes = reminderTimes,
        _reminderDays = reminderDays,
        _linkedHabitIds = linkedHabitIds;

  factory _$HabitImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String emoji;
  @override
  final int color;
  @override
  final HabitFrequency frequency;
  @override
  final HabitTargetType targetType;
  @override
  final double targetValue;
  @override
  final String unit;
  @override
  final GravityClass gravityClass;
  @override
  final DateTime createdAt;
  @override
  final int order;
  @override
  final String? description;
  final Map<String, dynamic>? _frequencyConfig;
  @override
  Map<String, dynamic>? get frequencyConfig {
    final value = _frequencyConfig;
    if (value == null) return null;
    if (_frequencyConfig is EqualUnmodifiableMapView) return _frequencyConfig;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final List<TimeOfDayData> _reminderTimes;
  @override
  @JsonKey()
  List<TimeOfDayData> get reminderTimes {
    if (_reminderTimes is EqualUnmodifiableListView) return _reminderTimes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminderTimes);
  }

  final List<int> _reminderDays;
  @override
  @JsonKey()
  List<int> get reminderDays {
    if (_reminderDays is EqualUnmodifiableListView) return _reminderDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reminderDays);
  }

  @override
  final DateTime? archivedAt;
  @override
  final String? categoryId;
  final List<String> _linkedHabitIds;
  @override
  @JsonKey()
  List<String> get linkedHabitIds {
    if (_linkedHabitIds is EqualUnmodifiableListView) return _linkedHabitIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_linkedHabitIds);
  }

  @override
  final String? cueText;
  @override
  final String? whyText;

  @override
  String toString() {
    return 'Habit(id: $id, name: $name, emoji: $emoji, color: $color, frequency: $frequency, targetType: $targetType, targetValue: $targetValue, unit: $unit, gravityClass: $gravityClass, createdAt: $createdAt, order: $order, description: $description, frequencyConfig: $frequencyConfig, reminderTimes: $reminderTimes, reminderDays: $reminderDays, archivedAt: $archivedAt, categoryId: $categoryId, linkedHabitIds: $linkedHabitIds, cueText: $cueText, whyText: $whyText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.emoji, emoji) || other.emoji == emoji) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.frequency, frequency) ||
                other.frequency == frequency) &&
            (identical(other.targetType, targetType) ||
                other.targetType == targetType) &&
            (identical(other.targetValue, targetValue) ||
                other.targetValue == targetValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.gravityClass, gravityClass) ||
                other.gravityClass == gravityClass) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.order, order) || other.order == order) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._frequencyConfig, _frequencyConfig) &&
            const DeepCollectionEquality()
                .equals(other._reminderTimes, _reminderTimes) &&
            const DeepCollectionEquality()
                .equals(other._reminderDays, _reminderDays) &&
            (identical(other.archivedAt, archivedAt) ||
                other.archivedAt == archivedAt) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality()
                .equals(other._linkedHabitIds, _linkedHabitIds) &&
            (identical(other.cueText, cueText) || other.cueText == cueText) &&
            (identical(other.whyText, whyText) || other.whyText == whyText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        name,
        emoji,
        color,
        frequency,
        targetType,
        targetValue,
        unit,
        gravityClass,
        createdAt,
        order,
        description,
        const DeepCollectionEquality().hash(_frequencyConfig),
        const DeepCollectionEquality().hash(_reminderTimes),
        const DeepCollectionEquality().hash(_reminderDays),
        archivedAt,
        categoryId,
        const DeepCollectionEquality().hash(_linkedHabitIds),
        cueText,
        whyText
      ]);

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      __$$HabitImplCopyWithImpl<_$HabitImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitImplToJson(
      this,
    );
  }
}

abstract class _Habit implements Habit {
  const factory _Habit(
      {required final String id,
      required final String name,
      required final String emoji,
      required final int color,
      required final HabitFrequency frequency,
      required final HabitTargetType targetType,
      required final double targetValue,
      required final String unit,
      required final GravityClass gravityClass,
      required final DateTime createdAt,
      required final int order,
      final String? description,
      final Map<String, dynamic>? frequencyConfig,
      final List<TimeOfDayData> reminderTimes,
      final List<int> reminderDays,
      final DateTime? archivedAt,
      final String? categoryId,
      final List<String> linkedHabitIds,
      final String? cueText,
      final String? whyText}) = _$HabitImpl;

  factory _Habit.fromJson(Map<String, dynamic> json) = _$HabitImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get emoji;
  @override
  int get color;
  @override
  HabitFrequency get frequency;
  @override
  HabitTargetType get targetType;
  @override
  double get targetValue;
  @override
  String get unit;
  @override
  GravityClass get gravityClass;
  @override
  DateTime get createdAt;
  @override
  int get order;
  @override
  String? get description;
  @override
  Map<String, dynamic>? get frequencyConfig;
  @override
  List<TimeOfDayData> get reminderTimes;
  @override
  List<int> get reminderDays;
  @override
  DateTime? get archivedAt;
  @override
  String? get categoryId;
  @override
  List<String> get linkedHabitIds;
  @override
  String? get cueText;
  @override
  String? get whyText;

  /// Create a copy of Habit
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitImplCopyWith<_$HabitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TimeOfDayData _$TimeOfDayDataFromJson(Map<String, dynamic> json) {
  return _TimeOfDayData.fromJson(json);
}

/// @nodoc
mixin _$TimeOfDayData {
  int get hour => throw _privateConstructorUsedError;
  int get minute => throw _privateConstructorUsedError;

  /// Serializes this TimeOfDayData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimeOfDayData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimeOfDayDataCopyWith<TimeOfDayData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimeOfDayDataCopyWith<$Res> {
  factory $TimeOfDayDataCopyWith(
          TimeOfDayData value, $Res Function(TimeOfDayData) then) =
      _$TimeOfDayDataCopyWithImpl<$Res, TimeOfDayData>;
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class _$TimeOfDayDataCopyWithImpl<$Res, $Val extends TimeOfDayData>
    implements $TimeOfDayDataCopyWith<$Res> {
  _$TimeOfDayDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimeOfDayData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_value.copyWith(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimeOfDayDataImplCopyWith<$Res>
    implements $TimeOfDayDataCopyWith<$Res> {
  factory _$$TimeOfDayDataImplCopyWith(
          _$TimeOfDayDataImpl value, $Res Function(_$TimeOfDayDataImpl) then) =
      __$$TimeOfDayDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int hour, int minute});
}

/// @nodoc
class __$$TimeOfDayDataImplCopyWithImpl<$Res>
    extends _$TimeOfDayDataCopyWithImpl<$Res, _$TimeOfDayDataImpl>
    implements _$$TimeOfDayDataImplCopyWith<$Res> {
  __$$TimeOfDayDataImplCopyWithImpl(
      _$TimeOfDayDataImpl _value, $Res Function(_$TimeOfDayDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimeOfDayData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hour = null,
    Object? minute = null,
  }) {
    return _then(_$TimeOfDayDataImpl(
      hour: null == hour
          ? _value.hour
          : hour // ignore: cast_nullable_to_non_nullable
              as int,
      minute: null == minute
          ? _value.minute
          : minute // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimeOfDayDataImpl implements _TimeOfDayData {
  const _$TimeOfDayDataImpl({required this.hour, required this.minute});

  factory _$TimeOfDayDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimeOfDayDataImplFromJson(json);

  @override
  final int hour;
  @override
  final int minute;

  @override
  String toString() {
    return 'TimeOfDayData(hour: $hour, minute: $minute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimeOfDayDataImpl &&
            (identical(other.hour, hour) || other.hour == hour) &&
            (identical(other.minute, minute) || other.minute == minute));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, hour, minute);

  /// Create a copy of TimeOfDayData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimeOfDayDataImplCopyWith<_$TimeOfDayDataImpl> get copyWith =>
      __$$TimeOfDayDataImplCopyWithImpl<_$TimeOfDayDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimeOfDayDataImplToJson(
      this,
    );
  }
}

abstract class _TimeOfDayData implements TimeOfDayData {
  const factory _TimeOfDayData(
      {required final int hour,
      required final int minute}) = _$TimeOfDayDataImpl;

  factory _TimeOfDayData.fromJson(Map<String, dynamic> json) =
      _$TimeOfDayDataImpl.fromJson;

  @override
  int get hour;
  @override
  int get minute;

  /// Create a copy of TimeOfDayData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimeOfDayDataImplCopyWith<_$TimeOfDayDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HabitEntry _$HabitEntryFromJson(Map<String, dynamic> json) {
  return _HabitEntry.fromJson(json);
}

/// @nodoc
mixin _$HabitEntry {
  String get id => throw _privateConstructorUsedError;
  String get habitId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  double get completedValue => throw _privateConstructorUsedError;
  bool get isComplete => throw _privateConstructorUsedError;
  DateTime? get completedAt => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;
  int? get mood => throw _privateConstructorUsedError;
  SkipReason? get skipReason => throw _privateConstructorUsedError;

  /// Serializes this HabitEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitEntryCopyWith<HabitEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitEntryCopyWith<$Res> {
  factory $HabitEntryCopyWith(
          HabitEntry value, $Res Function(HabitEntry) then) =
      _$HabitEntryCopyWithImpl<$Res, HabitEntry>;
  @useResult
  $Res call(
      {String id,
      String habitId,
      DateTime date,
      double completedValue,
      bool isComplete,
      DateTime? completedAt,
      String? note,
      int? mood,
      SkipReason? skipReason});
}

/// @nodoc
class _$HabitEntryCopyWithImpl<$Res, $Val extends HabitEntry>
    implements $HabitEntryCopyWith<$Res> {
  _$HabitEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? habitId = null,
    Object? date = null,
    Object? completedValue = null,
    Object? isComplete = null,
    Object? completedAt = freezed,
    Object? note = freezed,
    Object? mood = freezed,
    Object? skipReason = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      habitId: null == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedValue: null == completedValue
          ? _value.completedValue
          : completedValue // ignore: cast_nullable_to_non_nullable
              as double,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as int?,
      skipReason: freezed == skipReason
          ? _value.skipReason
          : skipReason // ignore: cast_nullable_to_non_nullable
              as SkipReason?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitEntryImplCopyWith<$Res>
    implements $HabitEntryCopyWith<$Res> {
  factory _$$HabitEntryImplCopyWith(
          _$HabitEntryImpl value, $Res Function(_$HabitEntryImpl) then) =
      __$$HabitEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String habitId,
      DateTime date,
      double completedValue,
      bool isComplete,
      DateTime? completedAt,
      String? note,
      int? mood,
      SkipReason? skipReason});
}

/// @nodoc
class __$$HabitEntryImplCopyWithImpl<$Res>
    extends _$HabitEntryCopyWithImpl<$Res, _$HabitEntryImpl>
    implements _$$HabitEntryImplCopyWith<$Res> {
  __$$HabitEntryImplCopyWithImpl(
      _$HabitEntryImpl _value, $Res Function(_$HabitEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? habitId = null,
    Object? date = null,
    Object? completedValue = null,
    Object? isComplete = null,
    Object? completedAt = freezed,
    Object? note = freezed,
    Object? mood = freezed,
    Object? skipReason = freezed,
  }) {
    return _then(_$HabitEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      habitId: null == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completedValue: null == completedValue
          ? _value.completedValue
          : completedValue // ignore: cast_nullable_to_non_nullable
              as double,
      isComplete: null == isComplete
          ? _value.isComplete
          : isComplete // ignore: cast_nullable_to_non_nullable
              as bool,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
      mood: freezed == mood
          ? _value.mood
          : mood // ignore: cast_nullable_to_non_nullable
              as int?,
      skipReason: freezed == skipReason
          ? _value.skipReason
          : skipReason // ignore: cast_nullable_to_non_nullable
              as SkipReason?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitEntryImpl implements _HabitEntry {
  const _$HabitEntryImpl(
      {required this.id,
      required this.habitId,
      required this.date,
      required this.completedValue,
      required this.isComplete,
      this.completedAt,
      this.note,
      this.mood,
      this.skipReason});

  factory _$HabitEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String habitId;
  @override
  final DateTime date;
  @override
  final double completedValue;
  @override
  final bool isComplete;
  @override
  final DateTime? completedAt;
  @override
  final String? note;
  @override
  final int? mood;
  @override
  final SkipReason? skipReason;

  @override
  String toString() {
    return 'HabitEntry(id: $id, habitId: $habitId, date: $date, completedValue: $completedValue, isComplete: $isComplete, completedAt: $completedAt, note: $note, mood: $mood, skipReason: $skipReason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.completedValue, completedValue) ||
                other.completedValue == completedValue) &&
            (identical(other.isComplete, isComplete) ||
                other.isComplete == isComplete) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt) &&
            (identical(other.note, note) || other.note == note) &&
            (identical(other.mood, mood) || other.mood == mood) &&
            (identical(other.skipReason, skipReason) ||
                other.skipReason == skipReason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, habitId, date,
      completedValue, isComplete, completedAt, note, mood, skipReason);

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitEntryImplCopyWith<_$HabitEntryImpl> get copyWith =>
      __$$HabitEntryImplCopyWithImpl<_$HabitEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitEntryImplToJson(
      this,
    );
  }
}

abstract class _HabitEntry implements HabitEntry {
  const factory _HabitEntry(
      {required final String id,
      required final String habitId,
      required final DateTime date,
      required final double completedValue,
      required final bool isComplete,
      final DateTime? completedAt,
      final String? note,
      final int? mood,
      final SkipReason? skipReason}) = _$HabitEntryImpl;

  factory _HabitEntry.fromJson(Map<String, dynamic> json) =
      _$HabitEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get habitId;
  @override
  DateTime get date;
  @override
  double get completedValue;
  @override
  bool get isComplete;
  @override
  DateTime? get completedAt;
  @override
  String? get note;
  @override
  int? get mood;
  @override
  SkipReason? get skipReason;

  /// Create a copy of HabitEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitEntryImplCopyWith<_$HabitEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
