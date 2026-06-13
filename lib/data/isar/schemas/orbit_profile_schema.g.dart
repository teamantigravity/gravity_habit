// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orbit_profile_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrbitProfileEntityCollection on Isar {
  IsarCollection<OrbitProfileEntity> get orbitProfileEntitys =>
      this.collection();
}

const OrbitProfileEntitySchema = CollectionSchema(
  name: r'OrbitProfileEntity',
  id: -3710714448801668302,
  properties: {
    r'collectedStardust': PropertySchema(
      id: 0,
      name: r'collectedStardust',
      type: IsarType.long,
    ),
    r'currentOrbitTier': PropertySchema(
      id: 1,
      name: r'currentOrbitTier',
      type: IsarType.long,
    ),
    r'equippedAppIconId': PropertySchema(
      id: 2,
      name: r'equippedAppIconId',
      type: IsarType.string,
    ),
    r'equippedAvatarId': PropertySchema(
      id: 3,
      name: r'equippedAvatarId',
      type: IsarType.string,
    ),
    r'equippedConstellationThemeId': PropertySchema(
      id: 4,
      name: r'equippedConstellationThemeId',
      type: IsarType.string,
    ),
    r'equippedParticleEffectId': PropertySchema(
      id: 5,
      name: r'equippedParticleEffectId',
      type: IsarType.string,
    ),
    r'equippedPlanetSkinId': PropertySchema(
      id: 6,
      name: r'equippedPlanetSkinId',
      type: IsarType.string,
    ),
    r'gravitationalPull': PropertySchema(
      id: 7,
      name: r'gravitationalPull',
      type: IsarType.double,
    ),
    r'lastCalculatedDate': PropertySchema(
      id: 8,
      name: r'lastCalculatedDate',
      type: IsarType.dateTime,
    ),
    r'longestStreak': PropertySchema(
      id: 9,
      name: r'longestStreak',
      type: IsarType.long,
    ),
    r'prestigeLevel': PropertySchema(
      id: 10,
      name: r'prestigeLevel',
      type: IsarType.long,
    ),
    r'streakDays': PropertySchema(
      id: 11,
      name: r'streakDays',
      type: IsarType.long,
    ),
    r'streakFreezes': PropertySchema(
      id: 12,
      name: r'streakFreezes',
      type: IsarType.long,
    ),
    r'totalMass': PropertySchema(
      id: 13,
      name: r'totalMass',
      type: IsarType.double,
    ),
    r'unlockedAmbientSoundscapesJson': PropertySchema(
      id: 14,
      name: r'unlockedAmbientSoundscapesJson',
      type: IsarType.string,
    ),
    r'unlockedAppIconsJson': PropertySchema(
      id: 15,
      name: r'unlockedAppIconsJson',
      type: IsarType.string,
    ),
    r'unlockedAvatarsJson': PropertySchema(
      id: 16,
      name: r'unlockedAvatarsJson',
      type: IsarType.string,
    ),
    r'unlockedConstellationThemesJson': PropertySchema(
      id: 17,
      name: r'unlockedConstellationThemesJson',
      type: IsarType.string,
    ),
    r'unlockedConstellationsJson': PropertySchema(
      id: 18,
      name: r'unlockedConstellationsJson',
      type: IsarType.string,
    ),
    r'unlockedParticleEffectsJson': PropertySchema(
      id: 19,
      name: r'unlockedParticleEffectsJson',
      type: IsarType.string,
    ),
    r'unlockedPlanetSkinsJson': PropertySchema(
      id: 20,
      name: r'unlockedPlanetSkinsJson',
      type: IsarType.string,
    ),
    r'unlockedSoundPacksJson': PropertySchema(
      id: 21,
      name: r'unlockedSoundPacksJson',
      type: IsarType.string,
    ),
    r'unlockedThemesJson': PropertySchema(
      id: 22,
      name: r'unlockedThemesJson',
      type: IsarType.string,
    )
  },
  estimateSize: _orbitProfileEntityEstimateSize,
  serialize: _orbitProfileEntitySerialize,
  deserialize: _orbitProfileEntityDeserialize,
  deserializeProp: _orbitProfileEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _orbitProfileEntityGetId,
  getLinks: _orbitProfileEntityGetLinks,
  attach: _orbitProfileEntityAttach,
  version: '3.1.0+1',
);

int _orbitProfileEntityEstimateSize(
  OrbitProfileEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.equippedAppIconId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.equippedAvatarId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.equippedConstellationThemeId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.equippedParticleEffectId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.equippedPlanetSkinId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unlockedAmbientSoundscapesJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unlockedAppIconsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unlockedAvatarsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unlockedConstellationThemesJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unlockedConstellationsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unlockedParticleEffectsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unlockedPlanetSkinsJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unlockedSoundPacksJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.unlockedThemesJson;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _orbitProfileEntitySerialize(
  OrbitProfileEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.collectedStardust);
  writer.writeLong(offsets[1], object.currentOrbitTier);
  writer.writeString(offsets[2], object.equippedAppIconId);
  writer.writeString(offsets[3], object.equippedAvatarId);
  writer.writeString(offsets[4], object.equippedConstellationThemeId);
  writer.writeString(offsets[5], object.equippedParticleEffectId);
  writer.writeString(offsets[6], object.equippedPlanetSkinId);
  writer.writeDouble(offsets[7], object.gravitationalPull);
  writer.writeDateTime(offsets[8], object.lastCalculatedDate);
  writer.writeLong(offsets[9], object.longestStreak);
  writer.writeLong(offsets[10], object.prestigeLevel);
  writer.writeLong(offsets[11], object.streakDays);
  writer.writeLong(offsets[12], object.streakFreezes);
  writer.writeDouble(offsets[13], object.totalMass);
  writer.writeString(offsets[14], object.unlockedAmbientSoundscapesJson);
  writer.writeString(offsets[15], object.unlockedAppIconsJson);
  writer.writeString(offsets[16], object.unlockedAvatarsJson);
  writer.writeString(offsets[17], object.unlockedConstellationThemesJson);
  writer.writeString(offsets[18], object.unlockedConstellationsJson);
  writer.writeString(offsets[19], object.unlockedParticleEffectsJson);
  writer.writeString(offsets[20], object.unlockedPlanetSkinsJson);
  writer.writeString(offsets[21], object.unlockedSoundPacksJson);
  writer.writeString(offsets[22], object.unlockedThemesJson);
}

OrbitProfileEntity _orbitProfileEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrbitProfileEntity();
  object.collectedStardust = reader.readLong(offsets[0]);
  object.currentOrbitTier = reader.readLong(offsets[1]);
  object.equippedAppIconId = reader.readStringOrNull(offsets[2]);
  object.equippedAvatarId = reader.readStringOrNull(offsets[3]);
  object.equippedConstellationThemeId = reader.readStringOrNull(offsets[4]);
  object.equippedParticleEffectId = reader.readStringOrNull(offsets[5]);
  object.equippedPlanetSkinId = reader.readStringOrNull(offsets[6]);
  object.gravitationalPull = reader.readDouble(offsets[7]);
  object.id = id;
  object.lastCalculatedDate = reader.readDateTime(offsets[8]);
  object.longestStreak = reader.readLong(offsets[9]);
  object.prestigeLevel = reader.readLong(offsets[10]);
  object.streakDays = reader.readLong(offsets[11]);
  object.streakFreezes = reader.readLong(offsets[12]);
  object.totalMass = reader.readDouble(offsets[13]);
  object.unlockedAmbientSoundscapesJson = reader.readStringOrNull(offsets[14]);
  object.unlockedAppIconsJson = reader.readStringOrNull(offsets[15]);
  object.unlockedAvatarsJson = reader.readStringOrNull(offsets[16]);
  object.unlockedConstellationThemesJson = reader.readStringOrNull(offsets[17]);
  object.unlockedConstellationsJson = reader.readStringOrNull(offsets[18]);
  object.unlockedParticleEffectsJson = reader.readStringOrNull(offsets[19]);
  object.unlockedPlanetSkinsJson = reader.readStringOrNull(offsets[20]);
  object.unlockedSoundPacksJson = reader.readStringOrNull(offsets[21]);
  object.unlockedThemesJson = reader.readStringOrNull(offsets[22]);
  return object;
}

P _orbitProfileEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDouble(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readLong(offset)) as P;
    case 11:
      return (reader.readLong(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDouble(offset)) as P;
    case 14:
      return (reader.readStringOrNull(offset)) as P;
    case 15:
      return (reader.readStringOrNull(offset)) as P;
    case 16:
      return (reader.readStringOrNull(offset)) as P;
    case 17:
      return (reader.readStringOrNull(offset)) as P;
    case 18:
      return (reader.readStringOrNull(offset)) as P;
    case 19:
      return (reader.readStringOrNull(offset)) as P;
    case 20:
      return (reader.readStringOrNull(offset)) as P;
    case 21:
      return (reader.readStringOrNull(offset)) as P;
    case 22:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _orbitProfileEntityGetId(OrbitProfileEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _orbitProfileEntityGetLinks(
    OrbitProfileEntity object) {
  return [];
}

void _orbitProfileEntityAttach(
    IsarCollection<dynamic> col, Id id, OrbitProfileEntity object) {
  object.id = id;
}

extension OrbitProfileEntityQueryWhereSort
    on QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QWhere> {
  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OrbitProfileEntityQueryWhere
    on QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QWhereClause> {
  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterWhereClause>
      idBetween(
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

extension OrbitProfileEntityQueryFilter
    on QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QFilterCondition> {
  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      collectedStardustEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'collectedStardust',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      collectedStardustGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'collectedStardust',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      collectedStardustLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'collectedStardust',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      collectedStardustBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'collectedStardust',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      currentOrbitTierEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'currentOrbitTier',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      currentOrbitTierGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'currentOrbitTier',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      currentOrbitTierLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'currentOrbitTier',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      currentOrbitTierBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'currentOrbitTier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equippedAppIconId',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equippedAppIconId',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedAppIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equippedAppIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equippedAppIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equippedAppIconId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equippedAppIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equippedAppIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equippedAppIconId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equippedAppIconId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedAppIconId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAppIconIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equippedAppIconId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equippedAvatarId',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equippedAvatarId',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedAvatarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equippedAvatarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equippedAvatarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equippedAvatarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equippedAvatarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equippedAvatarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equippedAvatarId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equippedAvatarId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedAvatarId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedAvatarIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equippedAvatarId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equippedConstellationThemeId',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equippedConstellationThemeId',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedConstellationThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equippedConstellationThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equippedConstellationThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equippedConstellationThemeId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equippedConstellationThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equippedConstellationThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equippedConstellationThemeId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equippedConstellationThemeId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedConstellationThemeId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedConstellationThemeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equippedConstellationThemeId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equippedParticleEffectId',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equippedParticleEffectId',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedParticleEffectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equippedParticleEffectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equippedParticleEffectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equippedParticleEffectId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equippedParticleEffectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equippedParticleEffectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equippedParticleEffectId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equippedParticleEffectId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedParticleEffectId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedParticleEffectIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equippedParticleEffectId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'equippedPlanetSkinId',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'equippedPlanetSkinId',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedPlanetSkinId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'equippedPlanetSkinId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'equippedPlanetSkinId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'equippedPlanetSkinId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'equippedPlanetSkinId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'equippedPlanetSkinId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'equippedPlanetSkinId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'equippedPlanetSkinId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'equippedPlanetSkinId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      equippedPlanetSkinIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'equippedPlanetSkinId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      gravitationalPullEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'gravitationalPull',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      gravitationalPullGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'gravitationalPull',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      gravitationalPullLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'gravitationalPull',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      gravitationalPullBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'gravitationalPull',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
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

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
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

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      lastCalculatedDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastCalculatedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      lastCalculatedDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastCalculatedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      lastCalculatedDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastCalculatedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      lastCalculatedDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastCalculatedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      longestStreakEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'longestStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      longestStreakGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'longestStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      longestStreakLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'longestStreak',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      longestStreakBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'longestStreak',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      prestigeLevelEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'prestigeLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      prestigeLevelGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'prestigeLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      prestigeLevelLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'prestigeLevel',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      prestigeLevelBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'prestigeLevel',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      streakDaysEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streakDays',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      streakDaysGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streakDays',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      streakDaysLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streakDays',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      streakDaysBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streakDays',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      streakFreezesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streakFreezes',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      streakFreezesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streakFreezes',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      streakFreezesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streakFreezes',
        value: value,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      streakFreezesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streakFreezes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      totalMassEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalMass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      totalMassGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalMass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      totalMassLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalMass',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      totalMassBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalMass',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedAmbientSoundscapesJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedAmbientSoundscapesJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedAmbientSoundscapesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedAmbientSoundscapesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedAmbientSoundscapesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedAmbientSoundscapesJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unlockedAmbientSoundscapesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unlockedAmbientSoundscapesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unlockedAmbientSoundscapesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unlockedAmbientSoundscapesJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedAmbientSoundscapesJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAmbientSoundscapesJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unlockedAmbientSoundscapesJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedAppIconsJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedAppIconsJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedAppIconsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedAppIconsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedAppIconsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedAppIconsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unlockedAppIconsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unlockedAppIconsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unlockedAppIconsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unlockedAppIconsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedAppIconsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAppIconsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unlockedAppIconsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedAvatarsJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedAvatarsJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedAvatarsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedAvatarsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedAvatarsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedAvatarsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unlockedAvatarsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unlockedAvatarsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unlockedAvatarsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unlockedAvatarsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedAvatarsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedAvatarsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unlockedAvatarsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedConstellationThemesJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedConstellationThemesJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedConstellationThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedConstellationThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedConstellationThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedConstellationThemesJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unlockedConstellationThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unlockedConstellationThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unlockedConstellationThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unlockedConstellationThemesJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedConstellationThemesJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationThemesJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unlockedConstellationThemesJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedConstellationsJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedConstellationsJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedConstellationsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedConstellationsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedConstellationsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedConstellationsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unlockedConstellationsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unlockedConstellationsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unlockedConstellationsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unlockedConstellationsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedConstellationsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedConstellationsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unlockedConstellationsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedParticleEffectsJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedParticleEffectsJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedParticleEffectsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedParticleEffectsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedParticleEffectsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedParticleEffectsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unlockedParticleEffectsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unlockedParticleEffectsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unlockedParticleEffectsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unlockedParticleEffectsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedParticleEffectsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedParticleEffectsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unlockedParticleEffectsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedPlanetSkinsJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedPlanetSkinsJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedPlanetSkinsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedPlanetSkinsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedPlanetSkinsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedPlanetSkinsJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unlockedPlanetSkinsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unlockedPlanetSkinsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unlockedPlanetSkinsJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unlockedPlanetSkinsJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedPlanetSkinsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedPlanetSkinsJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unlockedPlanetSkinsJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedSoundPacksJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedSoundPacksJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedSoundPacksJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedSoundPacksJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedSoundPacksJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedSoundPacksJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unlockedSoundPacksJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unlockedSoundPacksJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unlockedSoundPacksJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unlockedSoundPacksJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedSoundPacksJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedSoundPacksJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unlockedSoundPacksJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedThemesJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedThemesJson',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedThemesJson',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'unlockedThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'unlockedThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'unlockedThemesJson',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'unlockedThemesJson',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedThemesJson',
        value: '',
      ));
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterFilterCondition>
      unlockedThemesJsonIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'unlockedThemesJson',
        value: '',
      ));
    });
  }
}

extension OrbitProfileEntityQueryObject
    on QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QFilterCondition> {}

extension OrbitProfileEntityQueryLinks
    on QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QFilterCondition> {}

extension OrbitProfileEntityQuerySortBy
    on QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QSortBy> {
  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByCollectedStardust() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectedStardust', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByCollectedStardustDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectedStardust', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByCurrentOrbitTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentOrbitTier', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByCurrentOrbitTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentOrbitTier', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByEquippedAppIconId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedAppIconId', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByEquippedAppIconIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedAppIconId', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByEquippedAvatarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedAvatarId', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByEquippedAvatarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedAvatarId', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByEquippedConstellationThemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedConstellationThemeId', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByEquippedConstellationThemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedConstellationThemeId', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByEquippedParticleEffectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedParticleEffectId', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByEquippedParticleEffectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedParticleEffectId', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByEquippedPlanetSkinId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedPlanetSkinId', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByEquippedPlanetSkinIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedPlanetSkinId', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByGravitationalPull() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravitationalPull', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByGravitationalPullDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravitationalPull', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByLastCalculatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCalculatedDate', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByLastCalculatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCalculatedDate', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByLongestStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longestStreak', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByLongestStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longestStreak', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByPrestigeLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prestigeLevel', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByPrestigeLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prestigeLevel', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByStreakDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByStreakFreezes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakFreezes', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByStreakFreezesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakFreezes', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByTotalMass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMass', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByTotalMassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMass', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedAmbientSoundscapesJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAmbientSoundscapesJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedAmbientSoundscapesJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAmbientSoundscapesJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedAppIconsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAppIconsJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedAppIconsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAppIconsJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedAvatarsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAvatarsJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedAvatarsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAvatarsJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedConstellationThemesJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedConstellationThemesJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedConstellationThemesJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedConstellationThemesJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedConstellationsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedConstellationsJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedConstellationsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedConstellationsJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedParticleEffectsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedParticleEffectsJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedParticleEffectsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedParticleEffectsJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedPlanetSkinsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedPlanetSkinsJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedPlanetSkinsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedPlanetSkinsJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedSoundPacksJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedSoundPacksJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedSoundPacksJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedSoundPacksJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedThemesJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedThemesJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      sortByUnlockedThemesJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedThemesJson', Sort.desc);
    });
  }
}

extension OrbitProfileEntityQuerySortThenBy
    on QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QSortThenBy> {
  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByCollectedStardust() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectedStardust', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByCollectedStardustDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'collectedStardust', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByCurrentOrbitTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentOrbitTier', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByCurrentOrbitTierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'currentOrbitTier', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByEquippedAppIconId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedAppIconId', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByEquippedAppIconIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedAppIconId', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByEquippedAvatarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedAvatarId', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByEquippedAvatarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedAvatarId', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByEquippedConstellationThemeId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedConstellationThemeId', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByEquippedConstellationThemeIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedConstellationThemeId', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByEquippedParticleEffectId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedParticleEffectId', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByEquippedParticleEffectIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedParticleEffectId', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByEquippedPlanetSkinId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedPlanetSkinId', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByEquippedPlanetSkinIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'equippedPlanetSkinId', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByGravitationalPull() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravitationalPull', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByGravitationalPullDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'gravitationalPull', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByLastCalculatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCalculatedDate', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByLastCalculatedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastCalculatedDate', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByLongestStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longestStreak', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByLongestStreakDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'longestStreak', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByPrestigeLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prestigeLevel', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByPrestigeLevelDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'prestigeLevel', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByStreakDaysDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakDays', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByStreakFreezes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakFreezes', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByStreakFreezesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'streakFreezes', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByTotalMass() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMass', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByTotalMassDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalMass', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedAmbientSoundscapesJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAmbientSoundscapesJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedAmbientSoundscapesJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAmbientSoundscapesJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedAppIconsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAppIconsJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedAppIconsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAppIconsJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedAvatarsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAvatarsJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedAvatarsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAvatarsJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedConstellationThemesJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedConstellationThemesJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedConstellationThemesJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedConstellationThemesJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedConstellationsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedConstellationsJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedConstellationsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedConstellationsJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedParticleEffectsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedParticleEffectsJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedParticleEffectsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedParticleEffectsJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedPlanetSkinsJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedPlanetSkinsJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedPlanetSkinsJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedPlanetSkinsJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedSoundPacksJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedSoundPacksJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedSoundPacksJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedSoundPacksJson', Sort.desc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedThemesJson() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedThemesJson', Sort.asc);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QAfterSortBy>
      thenByUnlockedThemesJsonDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedThemesJson', Sort.desc);
    });
  }
}

extension OrbitProfileEntityQueryWhereDistinct
    on QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct> {
  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByCollectedStardust() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'collectedStardust');
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByCurrentOrbitTier() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'currentOrbitTier');
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByEquippedAppIconId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equippedAppIconId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByEquippedAvatarId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equippedAvatarId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByEquippedConstellationThemeId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equippedConstellationThemeId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByEquippedParticleEffectId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equippedParticleEffectId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByEquippedPlanetSkinId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'equippedPlanetSkinId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByGravitationalPull() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'gravitationalPull');
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByLastCalculatedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastCalculatedDate');
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByLongestStreak() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'longestStreak');
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByPrestigeLevel() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'prestigeLevel');
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByStreakDays() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streakDays');
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByStreakFreezes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'streakFreezes');
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByTotalMass() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalMass');
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByUnlockedAmbientSoundscapesJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedAmbientSoundscapesJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByUnlockedAppIconsJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedAppIconsJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByUnlockedAvatarsJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedAvatarsJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByUnlockedConstellationThemesJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedConstellationThemesJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByUnlockedConstellationsJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedConstellationsJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByUnlockedParticleEffectsJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedParticleEffectsJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByUnlockedPlanetSkinsJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedPlanetSkinsJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByUnlockedSoundPacksJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedSoundPacksJson',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QDistinct>
      distinctByUnlockedThemesJson({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedThemesJson',
          caseSensitive: caseSensitive);
    });
  }
}

extension OrbitProfileEntityQueryProperty
    on QueryBuilder<OrbitProfileEntity, OrbitProfileEntity, QQueryProperty> {
  QueryBuilder<OrbitProfileEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OrbitProfileEntity, int, QQueryOperations>
      collectedStardustProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'collectedStardust');
    });
  }

  QueryBuilder<OrbitProfileEntity, int, QQueryOperations>
      currentOrbitTierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'currentOrbitTier');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      equippedAppIconIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equippedAppIconId');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      equippedAvatarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equippedAvatarId');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      equippedConstellationThemeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equippedConstellationThemeId');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      equippedParticleEffectIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equippedParticleEffectId');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      equippedPlanetSkinIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'equippedPlanetSkinId');
    });
  }

  QueryBuilder<OrbitProfileEntity, double, QQueryOperations>
      gravitationalPullProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'gravitationalPull');
    });
  }

  QueryBuilder<OrbitProfileEntity, DateTime, QQueryOperations>
      lastCalculatedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastCalculatedDate');
    });
  }

  QueryBuilder<OrbitProfileEntity, int, QQueryOperations>
      longestStreakProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'longestStreak');
    });
  }

  QueryBuilder<OrbitProfileEntity, int, QQueryOperations>
      prestigeLevelProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'prestigeLevel');
    });
  }

  QueryBuilder<OrbitProfileEntity, int, QQueryOperations> streakDaysProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streakDays');
    });
  }

  QueryBuilder<OrbitProfileEntity, int, QQueryOperations>
      streakFreezesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'streakFreezes');
    });
  }

  QueryBuilder<OrbitProfileEntity, double, QQueryOperations>
      totalMassProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalMass');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      unlockedAmbientSoundscapesJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedAmbientSoundscapesJson');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      unlockedAppIconsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedAppIconsJson');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      unlockedAvatarsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedAvatarsJson');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      unlockedConstellationThemesJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedConstellationThemesJson');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      unlockedConstellationsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedConstellationsJson');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      unlockedParticleEffectsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedParticleEffectsJson');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      unlockedPlanetSkinsJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedPlanetSkinsJson');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      unlockedSoundPacksJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedSoundPacksJson');
    });
  }

  QueryBuilder<OrbitProfileEntity, String?, QQueryOperations>
      unlockedThemesJsonProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedThemesJson');
    });
  }
}
