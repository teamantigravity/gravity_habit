import 'package:json_annotation/json_annotation.dart';

part 'settings_schema.g.dart';

@JsonSerializable()
class SettingsEntity {
  int id = 0; // Singleton

  late int themeMode; // 0=system, 1=light, 2=dark
  late String paletteId;
  late int accentColor;
  late int hapticIntensity; // 0=off, 1=subtle, 2=standard, 3=strong
  late bool soundEnabled;
  late double soundVolume;
  late String soundPackId;
  late bool ambientEnabled;
  late bool reduceMotion;
  late bool highContrast;
  late bool colorBlindMode;
  late int colorBlindType; // 0=none, 1=deut, 2=prot, 3=trit, 4=achrom
  late double fontScale;
  late bool dyslexiaFont;
  late String languageCode;
  late int firstDayOfWeek; // 1=Monday, 7=Sunday
  late int quietHoursStart; // minutes from midnight
  late int quietHoursEnd;
  late bool adsRemoved;
  late bool hasOnboarded;
  late int notificationStyle; // 0=all, 1=reminders only, 2=none
  late bool smartNudgesEnabled;
  late bool streakSaveReminderEnabled;
  late bool weeklyReviewEnabled;
  late bool monthlyReviewEnabled;
  late bool appLockEnabled;
  late int appLockTimeout; // seconds
  late bool screenshotBlocking;
  late bool personalizedAdsConsent;
  late DateTime installDate;
  late int totalCompletions;
  late String appIconId;
  late bool isListMode;
  String? userBirthDateJson; // for under-13 check, stored locally
  late bool isUnder13;

  SettingsEntity();

  factory SettingsEntity.fromJson(Map<String, dynamic> json) => _$SettingsEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsEntityToJson(this);
}
