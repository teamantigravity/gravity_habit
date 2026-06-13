// lib/data/isar/database.dart
// COMPLETE CORRECTED FILE

import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'schemas/achievement_schema.dart';
import 'schemas/category_schema.dart';
import 'schemas/daily_quest_schema.dart';
import 'schemas/habit_entry_schema.dart';
import 'schemas/habit_schema.dart';
import 'schemas/orbit_profile_schema.dart';
import 'schemas/settings_schema.dart';
import 'schemas/stardust_ledger_schema.dart';

final gravityDatabaseProvider = Provider<GravityDatabase>((ref) {
  throw UnimplementedError('Must be overridden in main');
});

class GravityDatabase {
  GravityDatabase._(this.isar);

  final Isar isar;

  static Future<GravityDatabase> initialize() async {
    final dir = await getApplicationDocumentsDirectory();

    final isar = await Isar.open(
      [
        HabitEntitySchema,
        HabitEntryEntitySchema,
        CategoryEntitySchema,
        OrbitProfileEntitySchema,
        AchievementEntitySchema,
        DailyQuestEntitySchema,
        StardustLedgerEntrySchema,
        SettingsEntitySchema,
      ],
      directory: dir.path,
      name: 'gravity_habit',
    );

    final db = GravityDatabase._(isar);
    await db._ensureDefaults();
    return db;
  }

  Future<void> _ensureDefaults() async {
    final existing = await isar.settingsEntitys.get(0);
    if (existing == null) {
      await isar.writeTxn(() async {
        await isar.settingsEntitys.put(
          SettingsEntity()
            ..id = 0
            ..themeMode = 0
            ..paletteId = 'midnight'
            ..accentColor = 0xFF6EE7FF
            ..hapticIntensity = 2
            ..soundEnabled = false
            ..soundVolume = 0.7
            ..soundPackId = 'cosmos'
            ..ambientEnabled = false
            ..reduceMotion = false
            ..highContrast = false
            ..colorBlindMode = false
            ..colorBlindType = 0
            ..fontScale = 1.0
            ..dyslexiaFont = false
            ..languageCode = 'en'
            ..firstDayOfWeek = 1
            ..quietHoursStart = 1380
            ..quietHoursEnd = 420
            ..adsRemoved = false
            ..hasOnboarded = false
            ..notificationStyle = 0
            ..smartNudgesEnabled = true
            ..streakSaveReminderEnabled = true
            ..weeklyReviewEnabled = true
            ..monthlyReviewEnabled = true
            ..appLockEnabled = false
            ..appLockTimeout = 300
            ..screenshotBlocking = false
            ..personalizedAdsConsent = false
            ..installDate = DateTime.now()
            ..totalCompletions = 0
            ..appIconId = 'default'
            ..isListMode = false,
        );
      });
    }

    final profile = await isar.orbitProfileEntitys.get(0);
    if (profile == null) {
      await isar.writeTxn(() async {
        await isar.orbitProfileEntitys.put(
          OrbitProfileEntity()
            ..id = 0
            ..totalMass = 0
            ..currentOrbitTier = 0
            ..streakDays = 0
            ..longestStreak = 0
            ..gravitationalPull = 0
            ..collectedStardust = 0
            ..prestigeLevel = 0
            ..streakFreezes = 0
            ..lastCalculatedDate = DateTime.now(),
        );
      });
    }
  }
}
