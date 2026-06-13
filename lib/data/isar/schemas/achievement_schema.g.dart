// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAchievementEntityCollection on Isar {
  IsarCollection<AchievementEntity> get achievementEntitys => this.collection();
}

const AchievementEntitySchema = CollectionSchema(
  name: r'AchievementEntity',
  id: -1385440077593810,
  properties: {
    r'achievementId': PropertySchema(
      id: 0,
      name: r'achievementId',
      type: IsarType.string,
    ),
    r'progress': PropertySchema(
      id: 1,
      name: r'progress',
      type: IsarType.double,
    ),
    r'unlockedAt': PropertySchema(
      id: 2,
      name: r'unlockedAt',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _achievementEntityEstimateSize,
  serialize: _achievementEntitySerialize,
  deserialize: _achievementEntityDeserialize,
  deserializeProp: _achievementEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'achievementId': IndexSchema(
      id: 7055660077052397,
      name: r'achievementId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'achievementId',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _achievementEntityGetId,
  getLinks: _achievementEntityGetLinks,
  attach: _achievementEntityAttach,
  version: '3.1.0+1',
);

int _achievementEntityEstimateSize(
  AchievementEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.achievementId.length * 3;
  return bytesCount;
}

void _achievementEntitySerialize(
  AchievementEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.achievementId);
  writer.writeDouble(offsets[1], object.progress);
  writer.writeDateTime(offsets[2], object.unlockedAt);
}

AchievementEntity _achievementEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AchievementEntity();
  object.achievementId = reader.readString(offsets[0]);
  object.id = id;
  object.progress = reader.readDouble(offsets[1]);
  object.unlockedAt = reader.readDateTimeOrNull(offsets[2]);
  return object;
}

P _achievementEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDouble(offset)) as P;
    case 2:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _achievementEntityGetId(AchievementEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _achievementEntityGetLinks(
    AchievementEntity object) {
  return [];
}

void _achievementEntityAttach(
    IsarCollection<dynamic> col, Id id, AchievementEntity object) {
  object.id = id;
}

extension AchievementEntityByIndex on IsarCollection<AchievementEntity> {
  Future<AchievementEntity?> getByAchievementId(String achievementId) {
    return getByIndex(r'achievementId', [achievementId]);
  }

  AchievementEntity? getByAchievementIdSync(String achievementId) {
    return getByIndexSync(r'achievementId', [achievementId]);
  }

  Future<bool> deleteByAchievementId(String achievementId) {
    return deleteByIndex(r'achievementId', [achievementId]);
  }

  bool deleteByAchievementIdSync(String achievementId) {
    return deleteByIndexSync(r'achievementId', [achievementId]);
  }

  Future<List<AchievementEntity?>> getAllByAchievementId(
      List<String> achievementIdValues) {
    final values = achievementIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'achievementId', values);
  }

  List<AchievementEntity?> getAllByAchievementIdSync(
      List<String> achievementIdValues) {
    final values = achievementIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'achievementId', values);
  }

  Future<int> deleteAllByAchievementId(List<String> achievementIdValues) {
    final values = achievementIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'achievementId', values);
  }

  int deleteAllByAchievementIdSync(List<String> achievementIdValues) {
    final values = achievementIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'achievementId', values);
  }

  Future<Id> putByAchievementId(AchievementEntity object) {
    return putByIndex(r'achievementId', object);
  }

  Id putByAchievementIdSync(AchievementEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'achievementId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByAchievementId(List<AchievementEntity> objects) {
    return putAllByIndex(r'achievementId', objects);
  }

  List<Id> putAllByAchievementIdSync(List<AchievementEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'achievementId', objects, saveLinks: saveLinks);
  }
}

extension AchievementEntityQueryWhereSort
    on QueryBuilder<AchievementEntity, AchievementEntity, QWhere> {
  QueryBuilder<AchievementEntity, AchievementEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AchievementEntityQueryWhere
    on QueryBuilder<AchievementEntity, AchievementEntity, QWhereClause> {
  QueryBuilder<AchievementEntity, AchievementEntity, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterWhereClause>
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

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterWhereClause>
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

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterWhereClause>
      achievementIdEqualTo(String achievementId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'achievementId',
        value: [achievementId],
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterWhereClause>
      achievementIdNotEqualTo(String achievementId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'achievementId',
              lower: [],
              upper: [achievementId],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'achievementId',
              lower: [achievementId],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'achievementId',
              lower: [achievementId],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'achievementId',
              lower: [],
              upper: [achievementId],
              includeUpper: false,
            ));
      }
    });
  }
}

extension AchievementEntityQueryFilter
    on QueryBuilder<AchievementEntity, AchievementEntity, QFilterCondition> {
  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      achievementIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'achievementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      achievementIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'achievementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      achievementIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'achievementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      achievementIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'achievementId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      achievementIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'achievementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      achievementIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'achievementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      achievementIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'achievementId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      achievementIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'achievementId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      achievementIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'achievementId',
        value: '',
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      achievementIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'achievementId',
        value: '',
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
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

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
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

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
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

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      progressEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'progress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      progressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'progress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      progressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'progress',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      progressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'progress',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      unlockedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'unlockedAt',
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      unlockedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'unlockedAt',
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      unlockedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      unlockedAtGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      unlockedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'unlockedAt',
        value: value,
      ));
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterFilterCondition>
      unlockedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'unlockedAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension AchievementEntityQueryObject
    on QueryBuilder<AchievementEntity, AchievementEntity, QFilterCondition> {}

extension AchievementEntityQueryLinks
    on QueryBuilder<AchievementEntity, AchievementEntity, QFilterCondition> {}

extension AchievementEntityQuerySortBy
    on QueryBuilder<AchievementEntity, AchievementEntity, QSortBy> {
  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      sortByAchievementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievementId', Sort.asc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      sortByAchievementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievementId', Sort.desc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      sortByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      sortByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      sortByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      sortByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }
}

extension AchievementEntityQuerySortThenBy
    on QueryBuilder<AchievementEntity, AchievementEntity, QSortThenBy> {
  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      thenByAchievementId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievementId', Sort.asc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      thenByAchievementIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'achievementId', Sort.desc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      thenByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      thenByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      thenByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.asc);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QAfterSortBy>
      thenByUnlockedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'unlockedAt', Sort.desc);
    });
  }
}

extension AchievementEntityQueryWhereDistinct
    on QueryBuilder<AchievementEntity, AchievementEntity, QDistinct> {
  QueryBuilder<AchievementEntity, AchievementEntity, QDistinct>
      distinctByAchievementId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'achievementId',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QDistinct>
      distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progress');
    });
  }

  QueryBuilder<AchievementEntity, AchievementEntity, QDistinct>
      distinctByUnlockedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'unlockedAt');
    });
  }
}

extension AchievementEntityQueryProperty
    on QueryBuilder<AchievementEntity, AchievementEntity, QQueryProperty> {
  QueryBuilder<AchievementEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<AchievementEntity, String, QQueryOperations>
      achievementIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'achievementId');
    });
  }

  QueryBuilder<AchievementEntity, double, QQueryOperations> progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progress');
    });
  }

  QueryBuilder<AchievementEntity, DateTime?, QQueryOperations>
      unlockedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'unlockedAt');
    });
  }
}
