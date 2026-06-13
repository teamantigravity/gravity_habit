import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/data/isar/database.dart';
import 'package:gravity_habit/data/isar/schemas/habit_entry_schema.dart';
import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';
import 'package:gravity_habit/domain/entities/habit.dart';
import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

final habitRepositoryProvider = Provider<HabitRepository>((ref) {
  final db = ref.watch(gravityDatabaseProvider);
  return HabitRepository(db);
});

class HabitRepository {
  HabitRepository(this._db);

  final GravityDatabase _db;
  final _uuid = const Uuid();

  Isar get _isar => _db.isar;

  // ---- HABITS ----

  Future<List<Habit>> getAllHabits({bool includeArchived = false}) async {
    var query = _isar.habitEntitys.where();
    final entities = await query.findAll();
    return entities
        .where((e) => includeArchived || e.archivedAt == null)
        .map(_entityToHabit)
        .toList()
      ..sort((a, b) => a.order.compareTo(b.order));
  }

  Future<Habit?> getHabit(String id) async {
    final entity = await _isar.habitEntitys
        .where()
        .filter()
        .uuidEqualTo(id)
        .findFirst();
    if (entity == null) return null;
    return _entityToHabit(entity);
  }

  Stream<List<Habit>> watchAllHabits() {
    return _isar.habitEntitys
        .where()
        .watch(fireImmediately: true)
        .map((entities) => entities
            .where((e) => e.archivedAt == null)
            .map(_entityToHabit)
            .toList()
          ..sort((a, b) => a.order.compareTo(b.order)));
  }

  Future<Habit> createHabit(Habit habit) async {
    final id = _uuid.v4();
    final entity = _habitToEntity(habit.copyWith(id: id));
    await _isar.writeTxn(() async {
      await _isar.habitEntitys.put(entity);
    });
    return habit.copyWith(id: id);
  }

  Future<void> updateHabit(Habit habit) async {
    final existing = await _isar.habitEntitys
        .where()
        .filter()
        .uuidEqualTo(habit.id)
        .findFirst();
    if (existing == null) return;

    final entity = _habitToEntity(habit)..id = existing.id;
    await _isar.writeTxn(() async {
      await _isar.habitEntitys.put(entity);
    });
  }

  Future<void> archiveHabit(String id) async {
    final existing = await _isar.habitEntitys
        .where()
        .filter()
        .uuidEqualTo(id)
        .findFirst();
    if (existing == null) return;

    existing.archivedAt = DateTime.now();
    await _isar.writeTxn(() async {
      await _isar.habitEntitys.put(existing);
    });
  }

  Future<void> deleteHabit(String id) async {
    final existing = await _isar.habitEntitys
        .where()
        .filter()
        .uuidEqualTo(id)
        .findFirst();
    if (existing == null) return;

    await _isar.writeTxn(() async {
      await _isar.habitEntitys.delete(existing.id);
      // Also delete all entries
      await _isar.habitEntryEntitys
          .where()
          .filter()
          .habitIdEqualTo(id)
          .deleteAll();
    });
  }

  Future<void> reorderHabits(List<String> orderedIds) async {
    await _isar.writeTxn(() async {
      for (var i = 0; i < orderedIds.length; i++) {
        final entity = await _isar.habitEntitys
            .where()
            .filter()
            .uuidEqualTo(orderedIds[i])
            .findFirst();
        if (entity != null) {
          entity.order = i;
          await _isar.habitEntitys.put(entity);
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
    var query = _isar.habitEntryEntitys
        .where()
        .filter()
        .habitIdEqualTo(habitId);

    final entities = await query.findAll();
    return entities
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

    final entities = await _isar.habitEntryEntitys
        .where()
        .filter()
        .dateGreaterThan(startOfDay.subtract(const Duration(seconds: 1)))
        .dateLessThan(endOfDay)
        .findAll();

    return entities.map(_entityToEntry).toList();
  }

  Stream<List<HabitEntry>> watchEntriesForDate(DateTime date) {
    final startOfDay = DateTime(date.year, date.month, date.day);
    final endOfDay = startOfDay.add(const Duration(days: 1));

    return _isar.habitEntryEntitys
        .where()
        .filter()
        .dateGreaterThan(startOfDay.subtract(const Duration(seconds: 1)))
        .dateLessThan(endOfDay)
        .watch(fireImmediately: true)
        .map((entities) => entities.map(_entityToEntry).toList());
  }

  Future<HabitEntry> createEntry(HabitEntry entry) async {
    final id = _uuid.v4();
    final entity = _entryToEntity(entry.copyWith(id: id));
    await _isar.writeTxn(() async {
      await _isar.habitEntryEntitys.put(entity);
    });
    return entry.copyWith(id: id);
  }

  Future<void> updateEntry(HabitEntry entry) async {
    final existing = await _isar.habitEntryEntitys
        .where()
        .filter()
        .uuidEqualTo(entry.id)
        .findFirst();
    if (existing == null) return;

    final entity = _entryToEntity(entry)..id = existing.id;
    await _isar.writeTxn(() async {
      await _isar.habitEntryEntitys.put(entity);
    });
  }

  // ---- CONVERTERS ----

  Habit _entityToHabit(HabitEntity e) {
    return Habit(
      id: e.uuid,
      name: e.name,
      emoji: e.emoji,
      color: e.color,
      description: e.description,
      frequency: e.frequency,
      frequencyConfig: e.frequencyConfigJson != null
          ? jsonDecode(e.frequencyConfigJson!) as Map<String, dynamic>
          : null,
      targetType: e.targetType,
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
      gravityClass: e.gravityClass,
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
      ..frequency = h.frequency
      ..frequencyConfigJson =
          h.frequencyConfig != null ? jsonEncode(h.frequencyConfig) : null
      ..targetType = h.targetType
      ..targetValue = h.targetValue
      ..unit = h.unit
      ..reminderTimesJson = h.reminderTimes.isNotEmpty
          ? jsonEncode(h.reminderTimes.map((t) => {'hour': t.hour, 'minute': t.minute}).toList())
          : null
      ..reminderDaysJson =
          h.reminderDays.isNotEmpty ? jsonEncode(h.reminderDays) : null
      ..gravityClass = h.gravityClass
      ..createdAt = h.createdAt
      ..archivedAt = h.archivedAt
      ..order = h.order
      ..categoryId = h.categoryId
      ..linkedHabitIdsJson = h.linkedHabitIds.isNotEmpty
          ? jsonEncode(h.linkedHabitIds)
          : null
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
      skipReason: e.skipReason,
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
      ..skipReason = e.skipReason;
  }
}
