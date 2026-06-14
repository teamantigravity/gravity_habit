// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSettingsEntityCollection on Isar {
  IsarCollection<SettingsEntity> get settingsEntitys => this.collection();
}

const SettingsEntitySchema = CollectionSchema(
  name: r'SettingsEntity',
  id: -7271317039764597112,
  properties: {
    r'accentColor': PropertySchema(
      id: 0,
      name: r'accentColor',
      type: IsarType.long,
    ),
    r'adsRemoved': PropertySchema(
      id: 1,
      name: r'adsRemoved',
      type: IsarType.bool,
    ),
    r'ambientEnabled': PropertySchema(
      id: 2,
      name: r'ambientEnabled',
      type: IsarType.bool,
    ),
    r'appIconId': PropertySchema(
      id: 3,
      name: r'appIconId',
      type: IsarType.string,
    ),
    r'appLockEnabled': PropertySchema(
      id: 4,
      name: r'appLockEnabled',
      type: IsarType.bool,
    ),
    r'appLockTimeout': PropertySchema(
      id: 5,
      name: r'appLockTimeout',
      type: IsarType.long,
    ),
    r'colorBlindMode': PropertySchema(
      id: 6,
      name: r'colorBlindMode',
      type: IsarType.bool,
    ),
    r'colorBlindType': PropertySchema(
      id: 7,
      name: r'colorBlindType',
      type: IsarType.long,
    ),
    r'dyslexiaFont': PropertySchema(
      id: 8,
      name: r'dyslexiaFont',
      type: IsarType.bool,
    ),
    r'firstDayOfWeek': PropertySchema(
      id: 9,
      name: r'firstDayOfWeek',
      type: IsarType.long,
    ),
    r'fontScale': PropertySchema(
      id: 10,
      name: r'fontScale',
      type: IsarType.double,
    ),
    r'hapticIntensity': PropertySchema(
      id: 11,
      name: r'hapticIntensity',
      type: IsarType.long,
    ),
    r'hasOnboarded': PropertySchema(
      id: 12,
      name: r'hasOnboarded',
      type: IsarType.bool,
    ),
    r'highContrast': PropertySchema(
      id: 13,
      name: r'highContrast',
      type: IsarType.bool,
    ),
    r'installDate': PropertySchema(
      id: 14,
      name: r'installDate',
      type: IsarType.dateTime,
    ),
    r'isListMode': PropertySchema(
      id: 15,
      name: r'isListMode',
      type: IsarType.bool,
    ),
    r'isUnder13': PropertySchema(
      id: 16,
      name: r'isUnder13',
      type: IsarType.bool,
    ),
    r'languageCode': PropertySchema(
      id: 17,
      name: r'languageCode',
      type: IsarType.string,
    ),
    r'monthlyReviewEnabled': PropertySchema(
      id: 18,
      name: r'monthlyReviewEnabled',
      type: IsarType.bool,
    ),
    r'notificationStyle': PropertySchema(
      id: 19,
      name: r'notificationStyle',
      type: IsarType.long,
    ),
    r'paletteId': PropertySchema(
      id: 20,
      name: r'paletteId',
      type: IsarType.string,
    ),
    r'personalizedAdsConsent': PropertySchema(
      id: 21,
      name: r'personalizedAdsConsent',
      type: IsarType.bool,
    ),
    r'quietHoursEnd': PropertySchema(
      id: 22,
      name: r'quietHoursEnd',
      type: IsarType.long,
    ),
    r'quietHoursStart': PropertySchema(
      id: 23,
      name: r'quietHoursStart',
      type: IsarType.long,
    ),
    r'reduceMotion': PropertySchema(
      id: 24,
      name: r'reduceMotion',
      type: IsarType.bool,
    ),
    r'screenshotBlocking': PropertySchema(
      id: 25,
      name: r'screenshotBlocking',
      type: IsarType.bool,
    ),
    r'smartNudgesEnabled': PropertySchema(
      id: 26,
      name: r'smartNudgesEnabled',
      type: IsarType.bool,
    ),
    r'soundEnabled': PropertySchema(
      id: 27,
      name: r'soundEnabled',
      type: IsarType.bool,
    ),
    r'soundPackId': PropertySchema(
      id: 28,
      name: r'soundPackId',
      type: IsarType.string,
    ),
    r'soundVolume': PropertySchema(
      id: 29,
      name: r'soundVolume',
      type: IsarType.double,
    ),
    r'streakSaveReminderEnabled': PropertySchema(
      id: 30,
      name: r'streakSaveReminderEnabled',
      type: IsarType.bool,
    ),
    r'themeMode': PropertySchema(
      id: 31,
      name: r'themeMode',
      type: IsarType.long,
    ),
    r'totalCompletions': PropertySchema(
      id: 32,
      name: r'totalCompletions',
      type: IsarType.long,
    ),
    r'userBirthDateJson': PropertySchema(
      id: 33,
      name: r'userBirthDateJson',
      type: IsarType.string,
    ),
    r'weeklyReviewEnabled': PropertySchema(
      id: 34,
      name: r'weeklyReviewEnabled',
      type: IsarType.bool,
    )
  },
  estimateSize: _settingsEntityEstimateSize,
  serialize: _settingsEntitySerialize,
  deserialize: _settingsEntityDeserialize,
  deserializeProp: _settingsEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _settingsEntityGetId,
  getLinks: _settingsEntityGetLinks,
  attach: _settingsEntityAttach,
  version: '3.1.0+1',
);

int _settingsEntityEstimateSize(
  SettingsEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.appIconId.length * 3;
  bytesCount += 3 + object.languageCode.length * 3;
  bytesCount += 3 + object.paletteId.length * 3;
  bytesCount += 3 + object.soundPackId.length * 3;
  {
    final value = object.userBirthDateJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _settingsEntitySerialize(
  SettingsEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.accentColor);
  writer.writeBool(offsets[1], object.adsRemoved);
  writer.writeBool(offsets[2], object.ambientEnabled);
  writer.writeString(offsets[3], object.appIconId);
  writer.writeBool(offsets[4], object.appLockEnabled);
  writer.writeLong(offsets[5], object.appLockTimeout);
  writer.writeBool(offsets[6], object.colorBlindMode);
  writer.writeLong(offsets[7], object.colorBlindType);
  writer.writeBool(offsets[8], object.dyslexiaFont);
  writer.writeLong(offsets[9], object.firstDayOfWeek);
  writer.writeDouble(offsets[10], object.fontScale);
  writer.writeLong(offsets[11], object.hapticIntensity);
  writer.writeBool(offsets[12], object.hasOnboarded);
  writer.writeBool(offsets[13], object.highContrast);
  writer.writeDateTime(offsets[14], object.installDate);
  writer.writeBool(offsets[15], object.isListMode);
  writer.writeBool(offsets[16], object.isUnder13);
  writer.writeString(offsets[17], object.languageCode);
  writer.writeBool(offsets[18], object.monthlyReviewEnabled);
  writer.writeLong(offsets[19], object.notificationStyle);
  writer.writeString(offsets[20], object.paletteId);
  writer.writeBool(offsets[21], object.personalizedAdsConsent);
  writer.writeLong(offsets[22], object.quietHoursEnd);
  writer.writeLong(offsets[23], object.quietHoursStart);
  writer.writeBool(offsets[24], object.reduceMotion);
  writer.writeBool(offsets[25], object.screenshotBlocking);
  writer.writeBool(offsets[26], object.smartNudgesEnabled);
  writer.writeBool(offsets[27], object.soundEnabled);
  writer.writeString(offsets[28], object.soundPackId);
  writer.writeDouble(offsets[29], object.soundVolume);
  writer.writeBool(offsets[30], object.streakSaveReminderEnabled);
  writer.writeLong(offsets[31], object.themeMode);
  writer.writeLong(offsets[32], object.totalCompletions);
  writer.writeString(offsets[33], object.userBirthDateJson);
  writer.writeBool(offsets[34], object.weeklyReviewEnabled);
}

SettingsEntity _settingsEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SettingsEntity();
  object.accentColor = reader.readLong(offsets[0]);
  object.adsRemoved = reader.readBool(offsets[1]);
  object.ambientEnabled = reader.readBool(offsets[2]);
  object.appIconId = reader.readString(offsets[3]);
  object.appLockEnabled = reader.readBool(offsets[4]);
  object.appLockTimeout = reader.readLong(offsets[5]);
  object.colorBlindMode = reader.readBool(offsets[6]);
  object.colorBlindType = reader.readLong(offsets[7]);
  object.dyslexiaFont = reader.readBool(offsets[8]);
  object.firstDayOfWeek = reader.readLong(offsets[9]);
  object.fontScale = reader.readDouble(offsets[10]);
  object.hapticIntensity = reader.readLong(offsets[11]);
  object.hasOnboarded = reader.readBool(offsets[12]);
  object.highContrast = reader.readBool(offsets[13]);
  object.id = id;
  object.installDate = reader.readDateTime(offsets[14]);
  object.isListMode = reader.readBool(offsets[15]);
  object.isUnder13 = reader.readBool(offsets[16]);
  object.languageCode = reader.readString(offsets[17]);
  object.monthlyReviewEnabled = reader.readBool(offsets[18]);
  object.notificationStyle = reader.readLong(offsets[19]);
  object.paletteId = reader.readString(offsets[20]);
  object.personalizedAdsConsent = reader.readBool(offsets[21]);
  object.quietHoursEnd = reader.readLong(offsets[22]);
  object.quietHoursStart = reader.readLong(offsets[23]);
  object.reduceMotion = reader.readBool(offsets[24]);
  object.screenshotBlocking = reader.readBool(offsets[25]);
  object.smartNudgesEnabled = reader.readBool(offsets[26]);
  object.soundEnabled = reader.readBool(offsets[27]);
  object.soundPackId = reader.readString(offsets[28]);
  object.soundVolume = reader.readDouble(offsets[29]);
  object.streakSaveReminderEnabled = reader.readBool(offsets[30]);
  object.themeMode = reader.readLong(offsets[31]);
  object.totalCompletions = reader.readLong(offsets[32]);
  object.userBirthDateJson = reader.readStringOrNull(offsets[33]);
  object.weeklyReviewEnabled = reader.readBool(offsets[34]);
  return object;
}

P _settingsEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readBool(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readDouble(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readBool(offset)) as P;
    case 13:
      return (reader.readBool(offset)) as P;
    case 14:
      return (reader.readDateTime(offset)) as P;
    case 15:
      return (reader.readBool(offset)) as P;
    case 16:
      return (reader.readBool(offset)) as P;
    case 17:
      return (reader.readString(offset)) as P;
    case 18:
      return (reader.readBool(offset)) as P;
    case 19:
      return (reader.readLong(offset)) as P;
    case 20:
      return (reader.readString(offset)) as P;
    case 21:
      return (reader.readBool(offset)) as P;
    case 22:
      return (reader.readLong(offset)) as P;
    case 23:
      return (reader.readLong(offset)) as P;
    case 24:
      return (reader.readBool(offset)) as P;
    case 25:
      return (reader.readBool(offset)) as P;
    case 26:
      return (reader.readBool(offset)) as P;
    case 27:
      return (reader.readBool(offset)) as P;
    case 28:
      return (reader.readString(offset)) as P;
    case 29:
      return (reader.readDouble(offset)) as P;
    case 30:
      return (reader.readBool(offset)) as P;
    case 31:
      return (reader.readLong(offset)) as P;
    case 32:
      return (reader.readLong(offset)) as P;
    case 33:
      return (reader.readStringOrNull(offset)) as P;
    case 34:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _settingsEntityGetId(SettingsEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _settingsEntityGetLinks(SettingsEntity object) {
  return [];
}

void _settingsEntityAttach(
    IsarCollection<dynamic> col, Id id, SettingsEntity object) {
  object.id = id;
}

extension SettingsEntityQueryWhereSort
    on QueryBuilder<SettingsEntity, SettingsEntity, QWhere> {
  QueryBuilder<SettingsEntity, SettingsEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SettingsEntityQueryWhere
    on QueryBuilder<SettingsEntity, SettingsEntity, QWhereClause> {
  QueryBuilder<SettingsEntity, SettingsEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SettingsEntityQueryFilter
    on QueryBuilder<SettingsEntity, SettingsEntity, QFilterCondition> {
  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      accentColorEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'accentColor',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      accentColorGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'accentColor',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      accentColorLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'accentColor',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      accentColorBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'accentColor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      adsRemovedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'adsRemoved',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      ambientEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ambientEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appIconIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appIconIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appIconIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appIconIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appIconId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appIconIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'appIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appIconIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'appIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appIconIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'appIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appIconIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'appIconId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appIconIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appIconId',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appIconIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'appIconId',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appLockEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appLockEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appLockTimeoutEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'appLockTimeout',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appLockTimeoutGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'appLockTimeout',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appLockTimeoutLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'appLockTimeout',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      appLockTimeoutBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'appLockTimeout',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      colorBlindModeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorBlindMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      colorBlindTypeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'colorBlindType',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      colorBlindTypeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'colorBlindType',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      colorBlindTypeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'colorBlindType',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      colorBlindTypeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'colorBlindType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      dyslexiaFontEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'dyslexiaFont',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      firstDayOfWeekEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'firstDayOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      firstDayOfWeekGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'firstDayOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      firstDayOfWeekLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'firstDayOfWeek',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      firstDayOfWeekBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'firstDayOfWeek',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      fontScaleEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fontScale',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      fontScaleGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fontScale',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      fontScaleLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fontScale',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      fontScaleBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fontScale',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      hapticIntensityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hapticIntensity',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      hapticIntensityGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hapticIntensity',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      hapticIntensityLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hapticIntensity',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      hapticIntensityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hapticIntensity',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      hasOnboardedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hasOnboarded',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      highContrastEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'highContrast',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      installDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'installDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      installDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'installDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      installDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'installDate',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      installDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'installDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      isListModeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isListMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      isUnder13EqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isUnder13',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      languageCodeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      languageCodeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      languageCodeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      languageCodeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'languageCode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      languageCodeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      languageCodeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      languageCodeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'languageCode',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      languageCodeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'languageCode',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      languageCodeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'languageCode',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      languageCodeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'languageCode',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      monthlyReviewEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'monthlyReviewEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      notificationStyleEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'notificationStyle',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      notificationStyleGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'notificationStyle',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      notificationStyleLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'notificationStyle',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      notificationStyleBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'notificationStyle',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      paletteIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paletteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      paletteIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'paletteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      paletteIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'paletteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      paletteIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'paletteId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      paletteIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'paletteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      paletteIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'paletteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      paletteIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'paletteId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      paletteIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'paletteId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      paletteIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'paletteId',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      paletteIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'paletteId',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      personalizedAdsConsentEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'personalizedAdsConsent',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      quietHoursEndEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quietHoursEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      quietHoursEndGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quietHoursEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      quietHoursEndLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quietHoursEnd',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      quietHoursEndBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quietHoursEnd',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      quietHoursStartEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'quietHoursStart',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      quietHoursStartGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'quietHoursStart',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      quietHoursStartLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'quietHoursStart',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      quietHoursStartBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'quietHoursStart',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      reduceMotionEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'reduceMotion',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      screenshotBlockingEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'screenshotBlocking',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      smartNudgesEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'smartNudgesEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soundEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundPackIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soundPackId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundPackIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soundPackId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundPackIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soundPackId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundPackIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soundPackId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundPackIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'soundPackId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundPackIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'soundPackId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundPackIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'soundPackId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundPackIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'soundPackId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundPackIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soundPackId',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundPackIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'soundPackId',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundVolumeEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'soundVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundVolumeGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'soundVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundVolumeLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'soundVolume',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      soundVolumeBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'soundVolume',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      streakSaveReminderEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streakSaveReminderEnabled',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      themeModeEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      themeModeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      themeModeLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'themeMode',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      themeModeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'themeMode',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      totalCompletionsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalCompletions',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      totalCompletionsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalCompletions',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      totalCompletionsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalCompletions',
        value: value,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      totalCompletionsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalCompletions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'userBirthDateJson',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'userBirthDateJson',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userBirthDateJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'userBirthDateJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'userBirthDateJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'userBirthDateJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'userBirthDateJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'userBirthDateJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'userBirthDateJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'userBirthDateJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'userBirthDateJson',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      userBirthDateJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'userBirthDateJson',
        value: '',
      ));
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterFilterCondition>
      weeklyReviewEnabledEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'weeklyReviewEnabled',
        value: value,
      ));
    });
  }
}

extension SettingsEntityQueryObject
    on QueryBuilder<SettingsEntity, SettingsEntity, QFilterCondition> {}

extension SettingsEntityQueryLinks
    on QueryBuilder<SettingsEntity, SettingsEntity, QFilterCondition> {}

extension SettingsEntityQuerySortBy
    on QueryBuilder<SettingsEntity, SettingsEntity, QSortBy> {
  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAccentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAccentColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAdsRemoved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adsRemoved', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAdsRemovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adsRemoved', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAmbientEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambientEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAmbientEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambientEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> sortByAppIconId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appIconId', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAppIconIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appIconId', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAppLockEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLockEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAppLockEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLockEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAppLockTimeout() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLockTimeout', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByAppLockTimeoutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLockTimeout', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByColorBlindMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorBlindMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByColorBlindModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorBlindMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByColorBlindType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorBlindType', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByColorBlindTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorBlindType', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByDyslexiaFont() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dyslexiaFont', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByDyslexiaFontDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dyslexiaFont', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByFirstDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstDayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByFirstDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstDayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> sortByFontScale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontScale', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByFontScaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontScale', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByHapticIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hapticIntensity', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByHapticIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hapticIntensity', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByHasOnboarded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasOnboarded', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByHasOnboardedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasOnboarded', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByHighContrast() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highContrast', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByHighContrastDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highContrast', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByInstallDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installDate', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByInstallDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installDate', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByIsListMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isListMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByIsListModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isListMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> sortByIsUnder13() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnder13', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByIsUnder13Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnder13', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByMonthlyReviewEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyReviewEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByMonthlyReviewEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyReviewEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByNotificationStyle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationStyle', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByNotificationStyleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationStyle', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> sortByPaletteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paletteId', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByPaletteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paletteId', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByPersonalizedAdsConsent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizedAdsConsent', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByPersonalizedAdsConsentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizedAdsConsent', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByQuietHoursEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnd', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByQuietHoursEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnd', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByQuietHoursStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursStart', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByQuietHoursStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursStart', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByReduceMotion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reduceMotion', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByReduceMotionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reduceMotion', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByScreenshotBlocking() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'screenshotBlocking', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByScreenshotBlockingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'screenshotBlocking', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortBySmartNudgesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartNudgesEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortBySmartNudgesEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartNudgesEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortBySoundEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortBySoundEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortBySoundPackId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundPackId', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortBySoundPackIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundPackId', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortBySoundVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundVolume', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortBySoundVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundVolume', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByStreakSaveReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakSaveReminderEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByStreakSaveReminderEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakSaveReminderEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> sortByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByTotalCompletions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompletions', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByTotalCompletionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompletions', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByUserBirthDateJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userBirthDateJson', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByUserBirthDateJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userBirthDateJson', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByWeeklyReviewEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyReviewEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      sortByWeeklyReviewEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyReviewEnabled', Sort.desc);
    });
  }
}

extension SettingsEntityQuerySortThenBy
    on QueryBuilder<SettingsEntity, SettingsEntity, QSortThenBy> {
  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAccentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAccentColorDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'accentColor', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAdsRemoved() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adsRemoved', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAdsRemovedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'adsRemoved', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAmbientEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambientEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAmbientEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ambientEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> thenByAppIconId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appIconId', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAppIconIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appIconId', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAppLockEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLockEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAppLockEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLockEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAppLockTimeout() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLockTimeout', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByAppLockTimeoutDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'appLockTimeout', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByColorBlindMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorBlindMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByColorBlindModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorBlindMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByColorBlindType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorBlindType', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByColorBlindTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'colorBlindType', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByDyslexiaFont() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dyslexiaFont', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByDyslexiaFontDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'dyslexiaFont', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByFirstDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstDayOfWeek', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByFirstDayOfWeekDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'firstDayOfWeek', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> thenByFontScale() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontScale', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByFontScaleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fontScale', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByHapticIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hapticIntensity', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByHapticIntensityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hapticIntensity', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByHasOnboarded() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasOnboarded', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByHasOnboardedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hasOnboarded', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByHighContrast() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highContrast', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByHighContrastDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'highContrast', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByInstallDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installDate', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByInstallDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'installDate', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByIsListMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isListMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByIsListModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isListMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> thenByIsUnder13() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnder13', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByIsUnder13Desc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isUnder13', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByLanguageCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByLanguageCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'languageCode', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByMonthlyReviewEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyReviewEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByMonthlyReviewEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'monthlyReviewEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByNotificationStyle() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationStyle', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByNotificationStyleDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'notificationStyle', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> thenByPaletteId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paletteId', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByPaletteIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'paletteId', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByPersonalizedAdsConsent() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizedAdsConsent', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByPersonalizedAdsConsentDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'personalizedAdsConsent', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByQuietHoursEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnd', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByQuietHoursEndDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursEnd', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByQuietHoursStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursStart', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByQuietHoursStartDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'quietHoursStart', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByReduceMotion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reduceMotion', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByReduceMotionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'reduceMotion', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByScreenshotBlocking() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'screenshotBlocking', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByScreenshotBlockingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'screenshotBlocking', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenBySmartNudgesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartNudgesEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenBySmartNudgesEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'smartNudgesEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenBySoundEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenBySoundEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenBySoundPackId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundPackId', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenBySoundPackIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundPackId', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenBySoundVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundVolume', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenBySoundVolumeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'soundVolume', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByStreakSaveReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakSaveReminderEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByStreakSaveReminderEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakSaveReminderEnabled', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy> thenByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByThemeModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'themeMode', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByTotalCompletions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompletions', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByTotalCompletionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalCompletions', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByUserBirthDateJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userBirthDateJson', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByUserBirthDateJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'userBirthDateJson', Sort.desc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByWeeklyReviewEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyReviewEnabled', Sort.asc);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QAfterSortBy>
      thenByWeeklyReviewEnabledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'weeklyReviewEnabled', Sort.desc);
    });
  }
}

extension SettingsEntityQueryWhereDistinct
    on QueryBuilder<SettingsEntity, SettingsEntity, QDistinct> {
  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByAccentColor() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'accentColor');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByAdsRemoved() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'adsRemoved');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByAmbientEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ambientEnabled');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct> distinctByAppIconId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appIconId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByAppLockEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appLockEnabled');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByAppLockTimeout() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'appLockTimeout');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByColorBlindMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorBlindMode');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByColorBlindType() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'colorBlindType');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByDyslexiaFont() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'dyslexiaFont');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByFirstDayOfWeek() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'firstDayOfWeek');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByFontScale() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fontScale');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByHapticIntensity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hapticIntensity');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByHasOnboarded() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hasOnboarded');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByHighContrast() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'highContrast');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByInstallDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'installDate');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByIsListMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isListMode');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByIsUnder13() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isUnder13');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByLanguageCode({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'languageCode', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByMonthlyReviewEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'monthlyReviewEnabled');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByNotificationStyle() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'notificationStyle');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct> distinctByPaletteId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'paletteId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByPersonalizedAdsConsent() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'personalizedAdsConsent');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByQuietHoursEnd() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quietHoursEnd');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByQuietHoursStart() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'quietHoursStart');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByReduceMotion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'reduceMotion');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByScreenshotBlocking() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'screenshotBlocking');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctBySmartNudgesEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'smartNudgesEnabled');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctBySoundEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soundEnabled');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct> distinctBySoundPackId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soundPackId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctBySoundVolume() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'soundVolume');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByStreakSaveReminderEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streakSaveReminderEnabled');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByThemeMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'themeMode');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByTotalCompletions() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalCompletions');
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByUserBirthDateJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'userBirthDateJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<SettingsEntity, SettingsEntity, QDistinct>
      distinctByWeeklyReviewEnabled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'weeklyReviewEnabled');
    });
  }
}

extension SettingsEntityQueryProperty
    on QueryBuilder<SettingsEntity, SettingsEntity, QQueryProperty> {
  QueryBuilder<SettingsEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SettingsEntity, int, QQueryOperations> accentColorProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'accentColor');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations> adsRemovedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'adsRemoved');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations>
      ambientEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ambientEnabled');
    });
  }

  QueryBuilder<SettingsEntity, String, QQueryOperations> appIconIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appIconId');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations>
      appLockEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appLockEnabled');
    });
  }

  QueryBuilder<SettingsEntity, int, QQueryOperations> appLockTimeoutProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'appLockTimeout');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations>
      colorBlindModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorBlindMode');
    });
  }

  QueryBuilder<SettingsEntity, int, QQueryOperations> colorBlindTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'colorBlindType');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations> dyslexiaFontProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'dyslexiaFont');
    });
  }

  QueryBuilder<SettingsEntity, int, QQueryOperations> firstDayOfWeekProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'firstDayOfWeek');
    });
  }

  QueryBuilder<SettingsEntity, double, QQueryOperations> fontScaleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fontScale');
    });
  }

  QueryBuilder<SettingsEntity, int, QQueryOperations>
      hapticIntensityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hapticIntensity');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations> hasOnboardedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hasOnboarded');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations> highContrastProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'highContrast');
    });
  }

  QueryBuilder<SettingsEntity, DateTime, QQueryOperations>
      installDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'installDate');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations> isListModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isListMode');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations> isUnder13Property() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isUnder13');
    });
  }

  QueryBuilder<SettingsEntity, String, QQueryOperations>
      languageCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'languageCode');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations>
      monthlyReviewEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'monthlyReviewEnabled');
    });
  }

  QueryBuilder<SettingsEntity, int, QQueryOperations>
      notificationStyleProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'notificationStyle');
    });
  }

  QueryBuilder<SettingsEntity, String, QQueryOperations> paletteIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'paletteId');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations>
      personalizedAdsConsentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'personalizedAdsConsent');
    });
  }

  QueryBuilder<SettingsEntity, int, QQueryOperations> quietHoursEndProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quietHoursEnd');
    });
  }

  QueryBuilder<SettingsEntity, int, QQueryOperations>
      quietHoursStartProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'quietHoursStart');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations> reduceMotionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'reduceMotion');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations>
      screenshotBlockingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'screenshotBlocking');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations>
      smartNudgesEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'smartNudgesEnabled');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations> soundEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soundEnabled');
    });
  }

  QueryBuilder<SettingsEntity, String, QQueryOperations> soundPackIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soundPackId');
    });
  }

  QueryBuilder<SettingsEntity, double, QQueryOperations> soundVolumeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'soundVolume');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations>
      streakSaveReminderEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streakSaveReminderEnabled');
    });
  }

  QueryBuilder<SettingsEntity, int, QQueryOperations> themeModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'themeMode');
    });
  }

  QueryBuilder<SettingsEntity, int, QQueryOperations>
      totalCompletionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalCompletions');
    });
  }

  QueryBuilder<SettingsEntity, String?, QQueryOperations>
      userBirthDateJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'userBirthDateJson');
    });
  }

  QueryBuilder<SettingsEntity, bool, QQueryOperations>
      weeklyReviewEnabledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'weeklyReviewEnabled');
    });
  }
}
