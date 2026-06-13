import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/data/isar/database.dart';
import 'package:gravity_habit/data/isar/schemas/orbit_profile_schema.dart';
import 'package:gravity_habit/data/isar/schemas/stardust_ledger_schema.dart';
import 'package:gravity_habit/data/isar/schemas/achievement_schema.dart';
import 'package:gravity_habit/data/isar/schemas/settings_schema.dart';
import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';
import 'package:gravity_habit/data/isar/schemas/habit_entry_schema.dart';
import 'package:gravity_habit/domain/entities/orbit_profile.dart';
import 'package:gravity_habit/domain/entities/achievement_catalog.dart';
import 'package:isar/isar.dart';

final orbitRepositoryProvider = Provider<OrbitRepository>((ref) {
  final db = ref.watch(gravityDatabaseProvider);
  return OrbitRepository(db);
});

class OrbitRepository {
  OrbitRepository(this._db);

  final GravityDatabase _db;

  Isar get _isar => _db.isar;

  Future<OrbitProfile> getProfile() async {
    final entity = await _isar.orbitProfileEntitys.get(0);
    if (entity == null) {
      return const OrbitProfile(
        totalMass: 0,
        currentOrbitTier: 0,
        streakDays: 0,
        longestStreak: 0,
        gravitationalPull: 0,
        collectedStardust: 0,
        prestigeLevel: 0,
        streakFreezes: 0,
      );
    }
    return _entityToProfile(entity);
  }

  Stream<OrbitProfile> watchProfile() {
    return _isar.orbitProfileEntitys
        .watchObject(0, fireImmediately: true)
        .map((entity) {
      if (entity == null) {
        return const OrbitProfile(
          totalMass: 0,
          currentOrbitTier: 0,
          streakDays: 0,
          longestStreak: 0,
          gravitationalPull: 0,
          collectedStardust: 0,
          prestigeLevel: 0,
          streakFreezes: 0,
        );
      }
      return _entityToProfile(entity);
    });
  }

  Future<void> updateProfile(OrbitProfile profile) async {
    final entity = _profileToEntity(profile);
    await _isar.writeTxn(() async {
      await _isar.orbitProfileEntitys.put(entity);
    });
  }

  Future<void> addStardust(int amount, String source,
      [String? referenceId]) async {
    await _isar.writeTxn(() async {
      // Update profile
      final profile =
          await _isar.orbitProfileEntitys.get(0) ?? OrbitProfileEntity()
            ..id = 0
            ..totalMass = 0
            ..currentOrbitTier = 0
            ..streakDays = 0
            ..longestStreak = 0
            ..gravitationalPull = 0
            ..collectedStardust = 0
            ..prestigeLevel = 0
            ..streakFreezes = 0
            ..lastCalculatedDate = DateTime.now();

      profile.collectedStardust += amount;
      await _isar.orbitProfileEntitys.put(profile);

      // Add ledger entry
      await _isar.stardustLedgerEntrys.put(
        StardustLedgerEntry()
          ..timestamp = DateTime.now()
          ..amount = amount
          ..source = source
          ..referenceId = referenceId,
      );
    });
  }

  Future<bool> spendStardust(int amount) async {
    final profile = await _isar.orbitProfileEntitys.get(0);
    if (profile == null || profile.collectedStardust < amount) return false;

    await _isar.writeTxn(() async {
      profile.collectedStardust -= amount;
      await _isar.orbitProfileEntitys.put(profile);

      await _isar.stardustLedgerEntrys.put(
        StardustLedgerEntry()
          ..timestamp = DateTime.now()
          ..amount = -amount
          ..source = 'purchase',
      );
    });
    return true;
  }

  Future<void> addMass(double mass) async {
    await _isar.writeTxn(() async {
      final profile =
          await _isar.orbitProfileEntitys.get(0) ?? OrbitProfileEntity()
            ..id = 0
            ..totalMass = 0
            ..currentOrbitTier = 0
            ..streakDays = 0
            ..longestStreak = 0
            ..gravitationalPull = 0
            ..collectedStardust = 0
            ..prestigeLevel = 0
            ..streakFreezes = 0
            ..lastCalculatedDate = DateTime.now();

      profile.totalMass += mass;
      await _isar.orbitProfileEntitys.put(profile);
    });
  }

  // ---- ACHIEVEMENTS ----

  Future<List<AchievementEntity>> getUnlockedAchievements() async {
    return _isar.achievementEntitys.where().findAll();
  }

  Stream<List<AchievementEntity>> watchUnlockedAchievements() {
    return _isar.achievementEntitys.where().watch(fireImmediately: true);
  }

  Future<void> checkAndUnlockAchievements() async {
    final profile = await _isar.orbitProfileEntitys.get(0);
    if (profile == null) return;

    final habits = await _isar.habitEntitys.where().findAll();
    final entries = await _isar.habitEntryEntitys.where().findAll();
    final settings = await _isar.settingsEntitys.get(0);
    if (settings == null) return;

    final unlocked = await _isar.achievementEntitys.where().findAll();
    final unlockedIds = unlocked.map((e) => e.achievementId).toSet();

    final now = DateTime.now();

    final activeHabitsList = habits.where((h) => h.archivedAt == null).toList();
    final activeHabitsCount = activeHabitsList.length;

    final completedEntries = entries.where((e) => e.isComplete).toList();
    final totalCompletionsCount = completedEntries.length;

    final daysInstalledCount = now.difference(settings.installDate).inDays;

    final categoriesUsedSet = activeHabitsList
        .map((h) => h.categoryId)
        .where((id) => id != null)
        .toSet();
    final categoriesUsedCount = categoriesUsedSet.length;

    final moodLogsCount = entries.where((e) => e.mood != null).length;

    final notesWrittenCount = entries
        .where((e) => e.note != null && e.note!.trim().isNotEmpty)
        .length;

    final stardustCollectedCount = await _isar.stardustLedgerEntrys
        .filter()
        .amountGreaterThan(0)
        .findAll()
        .then((list) => list.fold<int>(0, (sum, e) => sum + e.amount));

    final questsCompletedCount = await _isar.stardustLedgerEntrys
        .filter()
        .sourceEqualTo('quest')
        .count();

    // Recoveries check
    var recoveriesCount = 0;
    for (final habit in habits) {
      final habitEntries = entries
          .where((e) => e.habitId == habit.uuid)
          .toList()
        ..sort((a, b) => a.date.compareTo(b.date));
      for (var i = 1; i < habitEntries.length; i++) {
        if (habitEntries[i].isComplete && !habitEntries[i - 1].isComplete) {
          recoveriesCount++;
        }
      }
    }

    // Perfect Days
    final entriesByDate = <DateTime, List<HabitEntryEntity>>{};
    for (final entry in entries) {
      final dateOnly = DateTime(entry.date.year, entry.date.month, entry.date.day);
      entriesByDate.putIfAbsent(dateOnly, () => []).add(entry);
    }
    
    var perfectDaysCount = 0;
    for (final date in entriesByDate.keys) {
      final dateEntries = entriesByDate[date]!;
      final scheduledHabits = activeHabitsList.where((h) {
        if (h.createdAt.isAfter(date.add(const Duration(days: 1)))) return false;
        if (h.archivedAt != null && h.archivedAt!.isBefore(date)) return false;
        return true;
      }).toList();

      if (scheduledHabits.isEmpty) continue;

      final completedOnDay = dateEntries.where((e) => e.isComplete).map((e) => e.habitId).toSet();
      final allCompleted = scheduledHabits.every((h) => completedOnDay.contains(h.uuid));
      if (allCompleted) {
        perfectDaysCount++;
      }
    }

    final perfectWeeksCount = perfectDaysCount ~/ 7;
    final perfectMonthsCount = perfectDaysCount ~/ 30;

    final newlyUnlocked = <String>[];
    for (final def in AchievementCatalog.all) {
      if (unlockedIds.contains(def.id)) continue;

      final criteria = def.criteria;
      var meets = true;

      if (criteria.streakDays != null && profile.streakDays < criteria.streakDays!) {
        meets = false;
      }
      if (criteria.totalCompletions != null && totalCompletionsCount < criteria.totalCompletions!) {
        meets = false;
      }
      if (criteria.activeHabits != null && activeHabitsCount < criteria.activeHabits!) {
        meets = false;
      }
      if (criteria.totalMass != null && profile.totalMass < criteria.totalMass!) {
        meets = false;
      }
      if (criteria.tier != null && profile.currentOrbitTier < criteria.tier!) {
        meets = false;
      }
      if (criteria.prestigeLevel != null && profile.prestigeLevel < criteria.prestigeLevel!) {
        meets = false;
      }
      if (criteria.stardustCollected != null && stardustCollectedCount < criteria.stardustCollected!) {
        meets = false;
      }
      if (criteria.questsCompleted != null && questsCompletedCount < criteria.questsCompleted!) {
        meets = false;
      }
      if (criteria.categoriesUsed != null && categoriesUsedCount < criteria.categoriesUsed!) {
        meets = false;
      }
      if (criteria.moodLogs != null && moodLogsCount < criteria.moodLogs!) {
        meets = false;
      }
      if (criteria.notesWritten != null && notesWrittenCount < criteria.notesWritten!) {
        meets = false;
      }
      if (criteria.recoveries != null && recoveriesCount < criteria.recoveries!) {
        meets = false;
      }
      if (criteria.perfectDays != null && perfectDaysCount < criteria.perfectDays!) {
        meets = false;
      }
      if (criteria.perfectWeeks != null && perfectWeeksCount < criteria.perfectWeeks!) {
        meets = false;
      }
      if (criteria.perfectMonths != null && perfectMonthsCount < criteria.perfectMonths!) {
        meets = false;
      }
      if (criteria.daysInstalled != null && daysInstalledCount < criteria.daysInstalled!) {
        meets = false;
      }

      if (criteria.customCheck != null) {
        final check = criteria.customCheck!;
        var customMeets = false;

        if (check == 'morning_completion') {
          customMeets = completedEntries.any((e) => e.completedAt != null && e.completedAt!.hour < 7);
        } else if (check == 'sunrise_five') {
          customMeets = completedEntries.where((e) => e.completedAt != null && e.completedAt!.hour < 9).length >= 5;
        } else if (check == 'night_owl') {
          customMeets = completedEntries.any((e) => e.completedAt != null && e.completedAt!.hour >= 22);
        } else if (check == 'eclipse') {
          final morning = completedEntries.any((e) => e.completedAt != null && e.completedAt!.hour < 7);
          final night = completedEntries.any((e) => e.completedAt != null && e.completedAt!.hour >= 22);
          customMeets = morning && night;
        } else if (check == 'weekend_warrior') {
          final sat = completedEntries.any((e) => e.completedAt != null && e.completedAt!.weekday == DateTime.saturday);
          final sun = completedEntries.any((e) => e.completedAt != null && e.completedAt!.weekday == DateTime.sunday);
          customMeets = sat && sun;
        } else if (check == 'weekday_engine') {
          final weekdays = <int>{};
          for (final e in completedEntries) {
            if (e.completedAt != null && e.completedAt!.weekday >= 1 && e.completedAt!.weekday <= 5) {
              weekdays.add(e.completedAt!.weekday);
            }
          }
          customMeets = weekdays.length == 5;
        } else if (check == 'holiday_spirit') {
          customMeets = completedEntries.any((e) =>
              e.completedAt != null &&
              ((e.completedAt!.month == 12 && e.completedAt!.day == 25) ||
                  (e.completedAt!.month == 1 && e.completedAt!.day == 1) ||
                  (e.completedAt!.month == 7 && e.completedAt!.day == 4)));
        } else if (check == 'birthday_promise') {
          customMeets = completedEntries.any((e) =>
              e.completedAt != null &&
              e.completedAt!.month == settings.installDate.month &&
              e.completedAt!.day == settings.installDate.day &&
              e.completedAt!.year > settings.installDate.year);
        } else if (check == 'travel_proof') {
          final travelSkipDays = entries
              .where((e) => e.skipReason == SkipReason.traveling)
              .map((e) => DateTime(e.date.year, e.date.month, e.date.day))
              .toSet();
          customMeets = travelSkipDays.length >= 5;
        } else if (check == 'sick_day_hero') {
          customMeets = recoveriesCount > 0;
        } else if (check == 'first_edit') {
          customMeets = true;
        } else if (check == 'templates_5') {
          customMeets = habits.length >= 5;
        } else if (check == 'colors_5') {
          final colors = habits.map((h) => h.color).toSet();
          customMeets = colors.length >= 5;
        } else if (check == 'emojis_10') {
          final emojis = habits.map((h) => h.emoji).toSet();
          customMeets = emojis.length >= 10;
        } else if (check == 'why_written') {
          customMeets = habits.any((h) => h.whyText != null && h.whyText!.trim().isNotEmpty);
        } else if (check == 'cues_3') {
          customMeets = habits.where((h) => h.cueText != null && h.cueText!.trim().isNotEmpty).length >= 3;
        } else if (check.startsWith('resonance_')) {
          customMeets = true;
        } else if (check == 'first_purchase') {
          final spent = await _isar.stardustLedgerEntrys.filter().amountLessThan(0).count();
          customMeets = spent > 0;
        } else if (check == 'cosmetics_5') {
          final count = _jsonToStringList(profile.unlockedThemesJson).length +
              _jsonToStringList(profile.unlockedAvatarsJson).length;
          customMeets = count >= 5;
        } else if (check == 'cosmetics_20') {
          final count = _jsonToStringList(profile.unlockedThemesJson).length +
              _jsonToStringList(profile.unlockedAvatarsJson).length;
          customMeets = count >= 20;
        } else if (check == 'cosmetics_all') {
          final count = _jsonToStringList(profile.unlockedThemesJson).length +
              _jsonToStringList(profile.unlockedAvatarsJson).length;
          customMeets = count >= 50;
        } else if (check == 'icon_changed') {
          customMeets = settings.appIconId != 'default';
        } else if (check == 'sound_changed') {
          customMeets = settings.soundPackId != 'cosmos';
        } else if (check == 'app_lock') {
          customMeets = settings.appLockEnabled;
        } else if (check == 'language_changed') {
          customMeets = settings.languageCode != 'en';
        } else if (check == 'onboarded') {
          customMeets = settings.hasOnboarded;
        } else {
          customMeets = true;
        }

        if (!customMeets) {
          meets = false;
        }
      }

      if (meets) {
        newlyUnlocked.add(def.id);
      }
    }

    if (newlyUnlocked.isNotEmpty) {
      await _isar.writeTxn(() async {
        for (final id in newlyUnlocked) {
          final entity = AchievementEntity()
            ..achievementId = id
            ..unlockedAt = DateTime.now()
            ..progress = 1.0;
          await _isar.achievementEntitys.put(entity);

          final def = AchievementCatalog.all.firstWhere((a) => a.id == id);
          
          profile.collectedStardust += def.stardustReward;

          await _isar.stardustLedgerEntrys.put(
            StardustLedgerEntry()
              ..timestamp = DateTime.now()
              ..amount = def.stardustReward
              ..source = 'achievement'
              ..referenceId = id,
          );
        }
        await _isar.orbitProfileEntitys.put(profile);
      });
    }
  }

  OrbitProfile _entityToProfile(OrbitProfileEntity e) {
    return OrbitProfile(
      totalMass: e.totalMass,
      currentOrbitTier: e.currentOrbitTier,
      streakDays: e.streakDays,
      longestStreak: e.longestStreak,
      gravitationalPull: e.gravitationalPull,
      unlockedConstellations: _jsonToStringList(e.unlockedConstellationsJson),
      unlockedAvatars: _jsonToStringList(e.unlockedAvatarsJson),
      unlockedThemes: _jsonToStringList(e.unlockedThemesJson),
      collectedStardust: e.collectedStardust,
      prestigeLevel: e.prestigeLevel,
      streakFreezes: e.streakFreezes,
    );
  }

  OrbitProfileEntity _profileToEntity(OrbitProfile p) {
    return OrbitProfileEntity()
      ..id = 0
      ..totalMass = p.totalMass
      ..currentOrbitTier = p.currentOrbitTier
      ..streakDays = p.streakDays
      ..longestStreak = p.longestStreak
      ..gravitationalPull = p.gravitationalPull
      ..unlockedConstellationsJson =
          p.unlockedConstellations.isNotEmpty
              ? jsonEncode(p.unlockedConstellations)
              : null
      ..unlockedAvatarsJson =
          p.unlockedAvatars.isNotEmpty ? jsonEncode(p.unlockedAvatars) : null
      ..unlockedThemesJson =
          p.unlockedThemes.isNotEmpty ? jsonEncode(p.unlockedThemes) : null
      ..collectedStardust = p.collectedStardust
      ..prestigeLevel = p.prestigeLevel
      ..streakFreezes = p.streakFreezes
      ..lastCalculatedDate = DateTime.now();
  }

  List<String> _jsonToStringList(String? json) {
    if (json == null) return [];
    return (jsonDecode(json) as List).cast<String>();
  }
}
