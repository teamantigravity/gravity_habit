import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/data/isar/database.dart';
import 'package:gravity_habit/data/isar/schemas/settings_schema.dart';
import 'package:sembast/sembast.dart';

final settingsProvider =
    StateNotifierProvider<SettingsNotifier, AppSettings>((ref) {
  final db = ref.watch(gravityDatabaseProvider);
  return SettingsNotifier(db);
});

class AppSettings {
  const AppSettings({
    this.themeMode = ThemeMode.system,
    this.paletteId = 'midnight',
    this.accentColor = 0xFF6EE7FF,
    this.hapticIntensity = 2,
    this.soundEnabled = false,
    this.soundVolume = 0.7,
    this.soundPackId = 'cosmos',
    this.ambientEnabled = false,
    this.reduceMotion = false,
    this.highContrast = false,
    this.colorBlindMode = false,
    this.colorBlindType = 0,
    this.fontScale = 1.0,
    this.dyslexiaFont = false,
    this.languageCode = 'en',
    this.firstDayOfWeek = 1,
    this.quietHoursStart = 1380,
    this.quietHoursEnd = 420,
    this.adsRemoved = false,
    this.hasOnboarded = false,
    this.notificationStyle = 0,
    this.smartNudgesEnabled = true,
    this.streakSaveReminderEnabled = true,
    this.weeklyReviewEnabled = true,
    this.monthlyReviewEnabled = true,
    this.appLockEnabled = false,
    this.appLockTimeout = 300,
    this.screenshotBlocking = false,
    this.personalizedAdsConsent = false,
    this.installDate,
    this.totalCompletions = 0,
    this.appIconId = 'default',
    this.isListMode = false,
    this.isUnder13 = false,
  });

  final ThemeMode themeMode;
  final String paletteId;
  final int accentColor;
  final int hapticIntensity;
  final bool soundEnabled;
  final double soundVolume;
  final String soundPackId;
  final bool ambientEnabled;
  final bool reduceMotion;
  final bool highContrast;
  final bool colorBlindMode;
  final int colorBlindType;
  final double fontScale;
  final bool dyslexiaFont;
  final String languageCode;
  final int firstDayOfWeek;
  final int quietHoursStart;
  final int quietHoursEnd;
  final bool adsRemoved;
  final bool hasOnboarded;
  final int notificationStyle;
  final bool smartNudgesEnabled;
  final bool streakSaveReminderEnabled;
  final bool weeklyReviewEnabled;
  final bool monthlyReviewEnabled;
  final bool appLockEnabled;
  final int appLockTimeout;
  final bool screenshotBlocking;
  final bool personalizedAdsConsent;
  final DateTime? installDate;
  final int totalCompletions;
  final String appIconId;
  final bool isListMode;
  final bool isUnder13;

  Locale get locale => Locale(languageCode);

  AppSettings copyWith({
    ThemeMode? themeMode,
    String? paletteId,
    int? accentColor,
    int? hapticIntensity,
    bool? soundEnabled,
    double? soundVolume,
    String? soundPackId,
    bool? ambientEnabled,
    bool? reduceMotion,
    bool? highContrast,
    bool? colorBlindMode,
    int? colorBlindType,
    double? fontScale,
    bool? dyslexiaFont,
    String? languageCode,
    int? firstDayOfWeek,
    int? quietHoursStart,
    int? quietHoursEnd,
    bool? adsRemoved,
    bool? hasOnboarded,
    int? notificationStyle,
    bool? smartNudgesEnabled,
    bool? streakSaveReminderEnabled,
    bool? weeklyReviewEnabled,
    bool? monthlyReviewEnabled,
    bool? appLockEnabled,
    int? appLockTimeout,
    bool? screenshotBlocking,
    bool? personalizedAdsConsent,
    DateTime? installDate,
    int? totalCompletions,
    String? appIconId,
    bool? isListMode,
    bool? isUnder13,
  }) {
    return AppSettings(
      themeMode: themeMode ?? this.themeMode,
      paletteId: paletteId ?? this.paletteId,
      accentColor: accentColor ?? this.accentColor,
      hapticIntensity: hapticIntensity ?? this.hapticIntensity,
      soundEnabled: soundEnabled ?? this.soundEnabled,
      soundVolume: soundVolume ?? this.soundVolume,
      soundPackId: soundPackId ?? this.soundPackId,
      ambientEnabled: ambientEnabled ?? this.ambientEnabled,
      reduceMotion: reduceMotion ?? this.reduceMotion,
      highContrast: highContrast ?? this.highContrast,
      colorBlindMode: colorBlindMode ?? this.colorBlindMode,
      colorBlindType: colorBlindType ?? this.colorBlindType,
      fontScale: fontScale ?? this.fontScale,
      dyslexiaFont: dyslexiaFont ?? this.dyslexiaFont,
      languageCode: languageCode ?? this.languageCode,
      firstDayOfWeek: firstDayOfWeek ?? this.firstDayOfWeek,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
      adsRemoved: adsRemoved ?? this.adsRemoved,
      hasOnboarded: hasOnboarded ?? this.hasOnboarded,
      notificationStyle: notificationStyle ?? this.notificationStyle,
      smartNudgesEnabled: smartNudgesEnabled ?? this.smartNudgesEnabled,
      streakSaveReminderEnabled:
          streakSaveReminderEnabled ?? this.streakSaveReminderEnabled,
      weeklyReviewEnabled: weeklyReviewEnabled ?? this.weeklyReviewEnabled,
      monthlyReviewEnabled: monthlyReviewEnabled ?? this.monthlyReviewEnabled,
      appLockEnabled: appLockEnabled ?? this.appLockEnabled,
      appLockTimeout: appLockTimeout ?? this.appLockTimeout,
      screenshotBlocking: screenshotBlocking ?? this.screenshotBlocking,
      personalizedAdsConsent:
          personalizedAdsConsent ?? this.personalizedAdsConsent,
      installDate: installDate ?? this.installDate,
      totalCompletions: totalCompletions ?? this.totalCompletions,
      appIconId: appIconId ?? this.appIconId,
      isListMode: isListMode ?? this.isListMode,
      isUnder13: isUnder13 ?? this.isUnder13,
    );
  }
}

class SettingsNotifier extends StateNotifier<AppSettings> {
  SettingsNotifier(this._db) : super(const AppSettings()) {
    _load();
  }

  final GravityDatabase _db;

  Future<void> _load() async {
    final map = await _db.settingsStore.record(0).get(_db.db);
    if (map != null) {
      final entity = SettingsEntity.fromJson(map);
      state = AppSettings(
        themeMode: ThemeMode.values[entity.themeMode],
        paletteId: entity.paletteId,
        accentColor: entity.accentColor,
        hapticIntensity: entity.hapticIntensity,
        soundEnabled: entity.soundEnabled,
        soundVolume: entity.soundVolume,
        soundPackId: entity.soundPackId,
        ambientEnabled: entity.ambientEnabled,
        reduceMotion: entity.reduceMotion,
        highContrast: entity.highContrast,
        colorBlindMode: entity.colorBlindMode,
        colorBlindType: entity.colorBlindType,
        fontScale: entity.fontScale,
        dyslexiaFont: entity.dyslexiaFont,
        languageCode: entity.languageCode,
        firstDayOfWeek: entity.firstDayOfWeek,
        quietHoursStart: entity.quietHoursStart,
        quietHoursEnd: entity.quietHoursEnd,
        adsRemoved: entity.adsRemoved,
        hasOnboarded: entity.hasOnboarded,
        notificationStyle: entity.notificationStyle,
        smartNudgesEnabled: entity.smartNudgesEnabled,
        streakSaveReminderEnabled: entity.streakSaveReminderEnabled,
        weeklyReviewEnabled: entity.weeklyReviewEnabled,
        monthlyReviewEnabled: entity.monthlyReviewEnabled,
        appLockEnabled: entity.appLockEnabled,
        appLockTimeout: entity.appLockTimeout,
        screenshotBlocking: entity.screenshotBlocking,
        personalizedAdsConsent: entity.personalizedAdsConsent,
        installDate: entity.installDate,
        totalCompletions: entity.totalCompletions,
        appIconId: entity.appIconId,
        isListMode: entity.isListMode,
        isUnder13: entity.isUnder13,
      );
    }
  }

  Future<void> update(AppSettings Function(AppSettings) updater) async {
    state = updater(state);
    await _persist();
  }

  Future<void> _persist() async {
    final entity = SettingsEntity()
      ..id = 0
      ..themeMode = state.themeMode.index
      ..paletteId = state.paletteId
      ..accentColor = state.accentColor
      ..hapticIntensity = state.hapticIntensity
      ..soundEnabled = state.soundEnabled
      ..soundVolume = state.soundVolume
      ..soundPackId = state.soundPackId
      ..ambientEnabled = state.ambientEnabled
      ..reduceMotion = state.reduceMotion
      ..highContrast = state.highContrast
      ..colorBlindMode = state.colorBlindMode
      ..colorBlindType = state.colorBlindType
      ..fontScale = state.fontScale
      ..dyslexiaFont = state.dyslexiaFont
      ..languageCode = state.languageCode
      ..firstDayOfWeek = state.firstDayOfWeek
      ..quietHoursStart = state.quietHoursStart
      ..quietHoursEnd = state.quietHoursEnd
      ..adsRemoved = state.adsRemoved
      ..hasOnboarded = state.hasOnboarded
      ..notificationStyle = state.notificationStyle
      ..smartNudgesEnabled = state.smartNudgesEnabled
      ..streakSaveReminderEnabled = state.streakSaveReminderEnabled
      ..weeklyReviewEnabled = state.weeklyReviewEnabled
      ..monthlyReviewEnabled = state.monthlyReviewEnabled
      ..appLockEnabled = state.appLockEnabled
      ..appLockTimeout = state.appLockTimeout
      ..screenshotBlocking = state.screenshotBlocking
      ..personalizedAdsConsent = state.personalizedAdsConsent
      ..installDate = state.installDate ?? DateTime.now()
      ..totalCompletions = state.totalCompletions
      ..appIconId = state.appIconId
      ..isListMode = state.isListMode
      ..isUnder13 = state.isUnder13;

    await _db.settingsStore.record(0).put(_db.db, entity.toJson());
  }
}
