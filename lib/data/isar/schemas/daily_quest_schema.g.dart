// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_quest_schema.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailyQuestEntityCollection on Isar {
  IsarCollection<DailyQuestEntity> get dailyQuestEntitys => this.collection();
}

const DailyQuestEntitySchema = CollectionSchema(
  name: r'DailyQuestEntity',
  id: 7078695488057903944,
  properties: {
    r'assignedDate': PropertySchema(
      id: 0,
      name: r'assignedDate',
      type: IsarType.dateTime,
    ),
    r'isCompleted': PropertySchema(
      id: 1,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'progress': PropertySchema(
      id: 2,
      name: r'progress',
      type: IsarType.double,
    ),
    r'questId': PropertySchema(
      id: 3,
      name: r'questId',
      type: IsarType.string,
    ),
    r'stardustReward': PropertySchema(
      id: 4,
      name: r'stardustReward',
      type: IsarType.long,
    )
  },
  estimateSize: _dailyQuestEntityEstimateSize,
  serialize: _dailyQuestEntitySerialize,
  deserialize: _dailyQuestEntityDeserialize,
  deserializeProp: _dailyQuestEntityDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dailyQuestEntityGetId,
  getLinks: _dailyQuestEntityGetLinks,
  attach: _dailyQuestEntityAttach,
  version: '3.1.0+1',
);

int _dailyQuestEntityEstimateSize(
  DailyQuestEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.questId.length * 3;
  return bytesCount;
}

void _dailyQuestEntitySerialize(
  DailyQuestEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.assignedDate);
  writer.writeBool(offsets[1], object.isCompleted);
  writer.writeDouble(offsets[2], object.progress);
  writer.writeString(offsets[3], object.questId);
  writer.writeLong(offsets[4], object.stardustReward);
}

DailyQuestEntity _dailyQuestEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyQuestEntity();
  object.assignedDate = reader.readDateTime(offsets[0]);
  object.id = id;
  object.isCompleted = reader.readBool(offsets[1]);
  object.progress = reader.readDouble(offsets[2]);
  object.questId = reader.readString(offsets[3]);
  object.stardustReward = reader.readLong(offsets[4]);
  return object;
}

P _dailyQuestEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDouble(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyQuestEntityGetId(DailyQuestEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyQuestEntityGetLinks(DailyQuestEntity object) {
  return [];
}

void _dailyQuestEntityAttach(
    IsarCollection<dynamic> col, Id id, DailyQuestEntity object) {
  object.id = id;
}

extension DailyQuestEntityQueryWhereSort
    on QueryBuilder<DailyQuestEntity, DailyQuestEntity, QWhere> {
  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DailyQuestEntityQueryWhere
    on QueryBuilder<DailyQuestEntity, DailyQuestEntity, QWhereClause> {
  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterWhereClause>
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

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterWhereClause> idBetween(
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

extension DailyQuestEntityQueryFilter
    on QueryBuilder<DailyQuestEntity, DailyQuestEntity, QFilterCondition> {
  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      assignedDateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'assignedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      assignedDateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'assignedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      assignedDateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'assignedDate',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      assignedDateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'assignedDate',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
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

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
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

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
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

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      isCompletedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isCompleted',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
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

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
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

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
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

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
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

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      questIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      questIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'questId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      questIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'questId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      questIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'questId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      questIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'questId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      questIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'questId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      questIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'questId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      questIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'questId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      questIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'questId',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      questIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'questId',
        value: '',
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      stardustRewardEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stardustReward',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      stardustRewardGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stardustReward',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      stardustRewardLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stardustReward',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterFilterCondition>
      stardustRewardBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stardustReward',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyQuestEntityQueryObject
    on QueryBuilder<DailyQuestEntity, DailyQuestEntity, QFilterCondition> {}

extension DailyQuestEntityQueryLinks
    on QueryBuilder<DailyQuestEntity, DailyQuestEntity, QFilterCondition> {}

extension DailyQuestEntityQuerySortBy
    on QueryBuilder<DailyQuestEntity, DailyQuestEntity, QSortBy> {
  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      sortByAssignedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedDate', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      sortByAssignedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedDate', Sort.desc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      sortByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      sortByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      sortByQuestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questId', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      sortByQuestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questId', Sort.desc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      sortByStardustReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stardustReward', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      sortByStardustRewardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stardustReward', Sort.desc);
    });
  }
}

extension DailyQuestEntityQuerySortThenBy
    on QueryBuilder<DailyQuestEntity, DailyQuestEntity, QSortThenBy> {
  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByAssignedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedDate', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByAssignedDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'assignedDate', Sort.desc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByQuestId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questId', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByQuestIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'questId', Sort.desc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByStardustReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stardustReward', Sort.asc);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QAfterSortBy>
      thenByStardustRewardDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stardustReward', Sort.desc);
    });
  }
}

extension DailyQuestEntityQueryWhereDistinct
    on QueryBuilder<DailyQuestEntity, DailyQuestEntity, QDistinct> {
  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QDistinct>
      distinctByAssignedDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'assignedDate');
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QDistinct>
      distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QDistinct>
      distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progress');
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QDistinct> distinctByQuestId(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'questId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<DailyQuestEntity, DailyQuestEntity, QDistinct>
      distinctByStardustReward() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stardustReward');
    });
  }
}

extension DailyQuestEntityQueryProperty
    on QueryBuilder<DailyQuestEntity, DailyQuestEntity, QQueryProperty> {
  QueryBuilder<DailyQuestEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyQuestEntity, DateTime, QQueryOperations>
      assignedDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignedDate');
    });
  }

  QueryBuilder<DailyQuestEntity, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<DailyQuestEntity, double, QQueryOperations> progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progress');
    });
  }

  QueryBuilder<DailyQuestEntity, String, QQueryOperations> questIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'questId');
    });
  }

  QueryBuilder<DailyQuestEntity, int, QQueryOperations>
      stardustRewardProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stardustReward');
    });
  }
}
