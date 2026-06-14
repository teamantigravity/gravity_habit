import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';
import 'package:path/path.dart' as p;

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
  GravityDatabase._(this.db);

  final Database db;

  // Stores
  final settingsStore = intMapStoreFactory.store('settings');
  final orbitProfileStore = intMapStoreFactory.store('orbitProfile');
  final habitStore = intMapStoreFactory.store('habits');
  final habitEntryStore = intMapStoreFactory.store('habitEntries');
  final categoryStore = intMapStoreFactory.store('categories');
  final achievementStore = intMapStoreFactory.store('achievements');
  final dailyQuestStore = intMapStoreFactory.store('dailyQuests');
  final stardustLedgerStore = intMapStoreFactory.store('stardustLedger');

  static Future<GravityDatabase> initialize() async {
    Database db;
    if (kIsWeb) {
      final factory = databaseFactoryWeb;
      db = await factory.openDatabase('gravity_habit.db');
    } else {
      final dir = await getApplicationDocumentsDirectory();
      await dir.create(recursive: true);
      final dbPath = p.join(dir.path, 'gravity_habit.db');
      final factory = databaseFactoryIo;
      db = await factory.openDatabase(dbPath);
    }

    final database = GravityDatabase._(db);
    await database._ensureDefaults();
    return database;
  }

  Future<void> _ensureDefaults() async {
    final existingSettings = await settingsStore.record(0).get(db);
    if (existingSettings == null) {
      final settings = SettingsEntity()
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
        ..isListMode = false
        ..isUnder13 = false;
        
      await settingsStore.record(0).put(db, settings.toJson());
    }

    final profile = await orbitProfileStore.record(0).get(db);
    if (profile == null) {
      final newProfile = OrbitProfileEntity()
        ..id = 0
        ..totalMass = 0.0
        ..currentOrbitTier = 0
        ..streakDays = 0
        ..longestStreak = 0
        ..gravitationalPull = 0.0
        ..collectedStardust = 0
        ..prestigeLevel = 0
        ..streakFreezes = 0
        ..lastCalculatedDate = DateTime.now();

      await orbitProfileStore.record(0).put(db, newProfile.toJson());
    }
  }
}
