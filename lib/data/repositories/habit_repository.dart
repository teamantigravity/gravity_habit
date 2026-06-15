import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/data/isar/database.dart';
import 'package:gravity_habit/data/isar/schemas/habit_entry_schema.dart';
import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';
import 'package:gravity_habit/domain/entities/habit.dart';
import 'package:sembast/sembast.dart';
import 'package:uuid/uuid.dart';

final habitRepositoryProvider = Provider<HabitRepository>((ref) {
  final db = ref.watch(gravityDatabaseProvider);
  return HabitRepository(db);
});

class HabitRepository {
  HabitRepository(this._db);

  final GravityDatabase _db;
  final _uuid = const Uuid();

  // ---- HABITS ----

  Future<List<Habit>> getAllHabits({bool includeArchived = false}) async {
    final snaps = await _db.habitStore.find(_db.db);
    return snaps
        .map((e) => HabitEntity.fromJson(e.value))
        .where((e) => includeArchived || e.archivedAt == null)
        .map(_entityToHabit)
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  Future<Habit?> getHabit(String id) async {
    final snap = await _db.habitStore.findFirst(
      _db.db,
      finder: Finder(filter: Filter.equals('uuid', id)),
    );
    if (snap == null) return null;
    return _entityToHabit(HabitEntity.fromJson(snap.value));
  }

  Stream<List<Habit>> watchAllHabits() {
    return _db.habitStore.query().onSnapshots(_db.db).map(
          (snaps) => snaps
              .map((e) => HabitEntity.fromJson(e.value))
              .where((e) => e.archivedAt == null)
              .map(_entityToHabit)
              .toList()
            ..sort((a, b) => a.order.compareTo(b.order)),
        );
  }

  Future<Habit> createHabit(Habit habit) async {
    final id = _uuid.v4();
    final entity = _habitToEntity(habit.copyWith(id: id));
    await _db.habitStore.add(_db.db, entity.toJson());
    return habit.copyWith(id: id);
  }

  Future<void> updateHabit(Habit habit) async {
    final entity = _habitToEntity(habit);
    await _db.habitStore.update(
      _db.db,
      entity.toJson(),
      finder: Finder(filter: Filter.equals('uuid', habit.id)),
    );
  }

  Future<void> archiveHabit(String id) async {
    final snap = await _db.habitStore.findFirst(
      _db.db,
      finder: Finder(filter: Filter.equals('uuid', id)),
    );
    if (snap == null) return;

    final existing = HabitEntity.fromJson(snap.value);
    existing.archivedAt = DateTime.now();
    await _db.habitStore.record(snap.key).put(_db.db, existing.toJson());
  }

  Future<void> deleteHabit(String id) async {
    await _db.db.transaction((txn) async {
      await _db.habitStore.delete(
        txn,
        finder: Finder(filter: Filter.equals('uuid', id)),
      );
      await _db.habitEntryStore.delete(
        txn,
        finder: Finder(filter: Filter.equals('habitId', id)),
      );
    });
  }

  Future<void> reorderHabits(List<String> orderedIds) async {
    await _db.db.transaction((txn) async {
      for (var i = 0; i < orderedIds.length; i++) {
        final snap = await _db.habitStore.findFirst(
          txn,
          finder: Finder(filter: Filter.equals('uuid', orderedIds[i])),
        );
        if (snap != null) {
          final entity = HabitEntity.fromJson(snap.value);
          entity.order = i;
          await _db.habitStore.record(snap.key).put(txn, entity.toJson());
        }
      }
    });
  }

  // ---- ENTRIES ----

  Future<List<HabitEntry>> getEntriesForHabit(
    String habitId, {
    DateTime? from,
    DateTime? to,
  }) async {
    final snaps = await _db.habitEntryStore.find(
      _db.db,
      finder: Finder(filter: Filter.equals('habitId', habitId)),
    );
    return snaps
        .map((e) => HabitEntryEntity.fromJson(e.value))
        .where((e) {
          if (from != null && e.date.isBefore(from)) return false;
          if (to != null && e.date.isAfter(to)) return false;
          return true;
        })
        .map(_entityToEntry)
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));
  }

  Future<List<HabitEntry>> getEntriesForDate(DateTime date) async {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    final snaps = await _db.habitEntryStore.find(
      _db.db,
      finder: Finder(
        filter: Filter.and([
          Filter.greaterThanOrEquals('date', startOfDay.toIso8601String()),
          Filter.lessThan('date', endOfDay.toIso8601String()),
        ]),
      ),
    );

    return snaps
        .map((e) => _entityToEntry(HabitEntryEntity.fromJson(e.value)))
        .toList();
  }

  Stream<List<HabitEntry>> watchEntriesForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return _db.habitEntryStore
        .query(
          finder: Finder(
            filter: Filter.and([
              Filter.greaterThanOrEquals('date', startOfDay.toIso8601String()),
              Filter.lessThan('date', endOfDay.toIso8601String()),
            ]),
          ),
        )
        .onSnapshots(_db.db)
        .map((snaps) => snaps
            .map((e) => _entityToEntry(HabitEntryEntity.fromJson(e.value)))
            .toList());
  }

  Future<HabitEntry> createEntry(HabitEntry entry) async {
    final id = _uuid.v4();
    final entity = _entryToEntity(entry.copyWith(id: id));
    await _db.habitEntryStore.add(_db.db, entity.toJson());
    return entry.copyWith(id: id);
  }

  Future<void> updateEntry(HabitEntry entry) async {
    final entity = _entryToEntity(entry);
    await _db.habitEntryStore.update(
      _db.db,
      entity.toJson(),
      finder: Finder(filter: Filter.equals('uuid', entry.id)),
    );
  }

  // ---- CONVERTERS ----

  Habit _entityToHabit(HabitEntity e) {
    return Habit(
      id: e.uuid,
      name: e.name,
      emoji: e.emoji,
      color: e.color,
      description: e.description,
      frequency: HabitFrequency.values.firstWhere((f) => f.name == e.frequency,
          orElse: () => HabitFrequency.daily),
      frequencyConfig: e.frequencyConfigJson != null
          ? jsonDecode(e.frequencyConfigJson!) as Map<String, dynamic>
          : null,
      targetType: HabitTargetType.values.firstWhere(
          (t) => t.name == e.targetType,
          orElse: () => HabitTargetType.binary),
      targetValue: e.targetValue,
      unit: e.unit,
      reminderTimes: e.reminderTimesJson != null
          ? (jsonDecode(e.reminderTimesJson!) as List)
              .map((t) => TimeOfDayData.fromJson(t as Map<String, dynamic>))
              .toList()
          : [],
      reminderDays: e.reminderDaysJson != null
          ? (jsonDecode(e.reminderDaysJson!) as List).cast<int>()
          : [],
      gravityClass: GravityClass.values.firstWhere(
          (g) => g.name == e.gravityClass,
          orElse: () => GravityClass.pebble),
      createdAt: e.createdAt,
      archivedAt: e.archivedAt,
      order: e.order,
      categoryId: e.categoryId,
      linkedHabitIds: e.linkedHabitIdsJson != null
          ? (jsonDecode(e.linkedHabitIdsJson!) as List).cast<String>()
          : [],
      cueText: e.cueText,
      whyText: e.whyText,
    );
  }

  HabitEntity _habitToEntity(Habit h) {
    return HabitEntity()
      ..uuid = h.id
      ..name = h.name
      ..emoji = h.emoji
      ..color = h.color
      ..description = h.description
      ..frequency = h.frequency.name
      ..frequencyConfigJson =
          h.frequencyConfig != null ? jsonEncode(h.frequencyConfig) : null
      ..targetType = h.targetType.name
      ..targetValue = h.targetValue
      ..unit = h.unit
      ..reminderTimesJson = h.reminderTimes.isNotEmpty
          ? jsonEncode(h.reminderTimes
              .map((t) => {'hour': t.hour, 'minute': t.minute})
              .toList())
          : null
      ..reminderDaysJson =
          h.reminderDays.isNotEmpty ? jsonEncode(h.reminderDays) : null
      ..gravityClass = h.gravityClass.name
      ..createdAt = h.createdAt
      ..archivedAt = h.archivedAt
      ..order = h.order
      ..categoryId = h.categoryId
      ..linkedHabitIdsJson =
          h.linkedHabitIds.isNotEmpty ? jsonEncode(h.linkedHabitIds) : null
      ..cueText = h.cueText
      ..whyText = h.whyText;
  }

  HabitEntry _entityToEntry(HabitEntryEntity e) {
    return HabitEntry(
      id: e.uuid,
      habitId: e.habitId,
      date: e.date,
      completedValue: e.completedValue,
      isComplete: e.isComplete,
      completedAt: e.completedAt,
      note: e.note,
      mood: e.mood,
      skipReason: e.skipReason != null
          ? SkipReason.values.firstWhere((s) => s.name == e.skipReason)
          : null,
    );
  }

  HabitEntryEntity _entryToEntity(HabitEntry e) {
    return HabitEntryEntity()
      ..uuid = e.id
      ..habitId = e.habitId
      ..date = e.date
      ..completedValue = e.completedValue
      ..isComplete = e.isComplete
      ..completedAt = e.completedAt
      ..note = e.note
      ..mood = e.mood
      ..skipReason = e.skipReason?.name;
  }
}
