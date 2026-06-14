import 'package:json_annotation/json_annotation.dart';

part 'orbit_profile_schema.g.dart';

@JsonSerializable()
class OrbitProfileEntity {
  int id = 0; // Singleton

  late double totalMass;
  late int currentOrbitTier;
  late int streakDays;
  late int longestStreak;
  late double gravitationalPull;

  String? unlockedConstellationsJson;
  String? unlockedAvatarsJson;
  String? unlockedThemesJson;
  String? unlockedPlanetSkinsJson;
  String? unlockedSoundPacksJson;
  String? unlockedAppIconsJson;
  String? unlockedParticleEffectsJson;
  String? unlockedAmbientSoundscapesJson;
  String? unlockedConstellationThemesJson;

  late int collectedStardust;
  late int prestigeLevel;

  String? equippedAvatarId;
  String? equippedPlanetSkinId;
  String? equippedParticleEffectId;
  String? equippedConstellationThemeId;
  String? equippedAppIconId;

  late int streakFreezes;
  late DateTime lastCalculatedDate;

  OrbitProfileEntity();

  factory OrbitProfileEntity.fromJson(Map<String, dynamic> json) => _$OrbitProfileEntityFromJson(json);
  Map<String, dynamic> toJson() => _$OrbitProfileEntityToJson(this);
}
