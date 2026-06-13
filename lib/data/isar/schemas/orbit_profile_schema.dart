import 'package:isar/isar.dart';

part 'orbit_profile_schema.g.dart';

@collection
class OrbitProfileEntity {
  Id id = 0; // Singleton

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
}
