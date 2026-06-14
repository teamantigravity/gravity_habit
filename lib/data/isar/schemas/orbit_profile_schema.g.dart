// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orbit_profile_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrbitProfileEntity _$OrbitProfileEntityFromJson(Map<String, dynamic> json) =>
    OrbitProfileEntity()
      ..id = (json['id'] as num).toInt()
      ..totalMass = (json['totalMass'] as num).toDouble()
      ..currentOrbitTier = (json['currentOrbitTier'] as num).toInt()
      ..streakDays = (json['streakDays'] as num).toInt()
      ..longestStreak = (json['longestStreak'] as num).toInt()
      ..gravitationalPull = (json['gravitationalPull'] as num).toDouble()
      ..unlockedConstellationsJson =
          json['unlockedConstellationsJson'] as String?
      ..unlockedAvatarsJson = json['unlockedAvatarsJson'] as String?
      ..unlockedThemesJson = json['unlockedThemesJson'] as String?
      ..unlockedPlanetSkinsJson = json['unlockedPlanetSkinsJson'] as String?
      ..unlockedSoundPacksJson = json['unlockedSoundPacksJson'] as String?
      ..unlockedAppIconsJson = json['unlockedAppIconsJson'] as String?
      ..unlockedParticleEffectsJson =
          json['unlockedParticleEffectsJson'] as String?
      ..unlockedAmbientSoundscapesJson =
          json['unlockedAmbientSoundscapesJson'] as String?
      ..unlockedConstellationThemesJson =
          json['unlockedConstellationThemesJson'] as String?
      ..collectedStardust = (json['collectedStardust'] as num).toInt()
      ..prestigeLevel = (json['prestigeLevel'] as num).toInt()
      ..equippedAvatarId = json['equippedAvatarId'] as String?
      ..equippedPlanetSkinId = json['equippedPlanetSkinId'] as String?
      ..equippedParticleEffectId = json['equippedParticleEffectId'] as String?
      ..equippedConstellationThemeId =
          json['equippedConstellationThemeId'] as String?
      ..equippedAppIconId = json['equippedAppIconId'] as String?
      ..streakFreezes = (json['streakFreezes'] as num).toInt()
      ..lastCalculatedDate =
          DateTime.parse(json['lastCalculatedDate'] as String);

Map<String, dynamic> _$OrbitProfileEntityToJson(OrbitProfileEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'totalMass': instance.totalMass,
      'currentOrbitTier': instance.currentOrbitTier,
      'streakDays': instance.streakDays,
      'longestStreak': instance.longestStreak,
      'gravitationalPull': instance.gravitationalPull,
      'unlockedConstellationsJson': instance.unlockedConstellationsJson,
      'unlockedAvatarsJson': instance.unlockedAvatarsJson,
      'unlockedThemesJson': instance.unlockedThemesJson,
      'unlockedPlanetSkinsJson': instance.unlockedPlanetSkinsJson,
      'unlockedSoundPacksJson': instance.unlockedSoundPacksJson,
      'unlockedAppIconsJson': instance.unlockedAppIconsJson,
      'unlockedParticleEffectsJson': instance.unlockedParticleEffectsJson,
      'unlockedAmbientSoundscapesJson': instance.unlockedAmbientSoundscapesJson,
      'unlockedConstellationThemesJson':
          instance.unlockedConstellationThemesJson,
      'collectedStardust': instance.collectedStardust,
      'prestigeLevel': instance.prestigeLevel,
      'equippedAvatarId': instance.equippedAvatarId,
      'equippedPlanetSkinId': instance.equippedPlanetSkinId,
      'equippedParticleEffectId': instance.equippedParticleEffectId,
      'equippedConstellationThemeId': instance.equippedConstellationThemeId,
      'equippedAppIconId': instance.equippedAppIconId,
      'streakFreezes': instance.streakFreezes,
      'lastCalculatedDate': instance.lastCalculatedDate.toIso8601String(),
    };
