// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsEntity _$SettingsEntityFromJson(Map<String, dynamic> json) =>
    SettingsEntity()
      ..id = (json['id'] as num).toInt()
      ..themeMode = (json['themeMode'] as num).toInt()
      ..paletteId = json['paletteId'] as String
      ..accentColor = (json['accentColor'] as num).toInt()
      ..hapticIntensity = (json['hapticIntensity'] as num).toInt()
      ..soundEnabled = json['soundEnabled'] as bool
      ..soundVolume = (json['soundVolume'] as num).toDouble()
      ..soundPackId = json['soundPackId'] as String
      ..ambientEnabled = json['ambientEnabled'] as bool
      ..reduceMotion = json['reduceMotion'] as bool
      ..highContrast = json['highContrast'] as bool
      ..colorBlindMode = json['colorBlindMode'] as bool
      ..colorBlindType = (json['colorBlindType'] as num).toInt()
      ..fontScale = (json['fontScale'] as num).toDouble()
      ..dyslexiaFont = json['dyslexiaFont'] as bool
      ..languageCode = json['languageCode'] as String
      ..firstDayOfWeek = (json['firstDayOfWeek'] as num).toInt()
      ..quietHoursStart = (json['quietHoursStart'] as num).toInt()
      ..quietHoursEnd = (json['quietHoursEnd'] as num).toInt()
      ..adsRemoved = json['adsRemoved'] as bool
      ..hasOnboarded = json['hasOnboarded'] as bool
      ..notificationStyle = (json['notificationStyle'] as num).toInt()
      ..smartNudgesEnabled = json['smartNudgesEnabled'] as bool
      ..streakSaveReminderEnabled = json['streakSaveReminderEnabled'] as bool
      ..weeklyReviewEnabled = json['weeklyReviewEnabled'] as bool
      ..monthlyReviewEnabled = json['monthlyReviewEnabled'] as bool
      ..appLockEnabled = json['appLockEnabled'] as bool
      ..appLockTimeout = (json['appLockTimeout'] as num).toInt()
      ..screenshotBlocking = json['screenshotBlocking'] as bool
      ..personalizedAdsConsent = json['personalizedAdsConsent'] as bool
      ..installDate = DateTime.parse(json['installDate'] as String)
      ..totalCompletions = (json['totalCompletions'] as num).toInt()
      ..appIconId = json['appIconId'] as String
      ..isListMode = json['isListMode'] as bool
      ..userBirthDateJson = json['userBirthDateJson'] as String?
      ..isUnder13 = json['isUnder13'] as bool;

Map<String, dynamic> _$SettingsEntityToJson(SettingsEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'themeMode': instance.themeMode,
      'paletteId': instance.paletteId,
      'accentColor': instance.accentColor,
      'hapticIntensity': instance.hapticIntensity,
      'soundEnabled': instance.soundEnabled,
      'soundVolume': instance.soundVolume,
      'soundPackId': instance.soundPackId,
      'ambientEnabled': instance.ambientEnabled,
      'reduceMotion': instance.reduceMotion,
      'highContrast': instance.highContrast,
      'colorBlindMode': instance.colorBlindMode,
      'colorBlindType': instance.colorBlindType,
      'fontScale': instance.fontScale,
      'dyslexiaFont': instance.dyslexiaFont,
      'languageCode': instance.languageCode,
      'firstDayOfWeek': instance.firstDayOfWeek,
      'quietHoursStart': instance.quietHoursStart,
      'quietHoursEnd': instance.quietHoursEnd,
      'adsRemoved': instance.adsRemoved,
      'hasOnboarded': instance.hasOnboarded,
      'notificationStyle': instance.notificationStyle,
      'smartNudgesEnabled': instance.smartNudgesEnabled,
      'streakSaveReminderEnabled': instance.streakSaveReminderEnabled,
      'weeklyReviewEnabled': instance.weeklyReviewEnabled,
      'monthlyReviewEnabled': instance.monthlyReviewEnabled,
      'appLockEnabled': instance.appLockEnabled,
      'appLockTimeout': instance.appLockTimeout,
      'screenshotBlocking': instance.screenshotBlocking,
      'personalizedAdsConsent': instance.personalizedAdsConsent,
      'installDate': instance.installDate.toIso8601String(),
      'totalCompletions': instance.totalCompletions,
      'appIconId': instance.appIconId,
      'isListMode': instance.isListMode,
      'userBirthDateJson': instance.userBirthDateJson,
      'isUnder13': instance.isUnder13,
    };
