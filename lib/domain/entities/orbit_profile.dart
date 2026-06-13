import 'package:freezed_annotation/freezed_annotation.dart';

part 'orbit_profile.freezed.dart';

@freezed
class OrbitProfile with _$OrbitProfile {
  const factory OrbitProfile({
    required double totalMass,
    required int currentOrbitTier,
    required int streakDays,
    required int longestStreak,
    required double gravitationalPull,
    @Default([]) List<String> unlockedConstellations,
    @Default([]) List<String> unlockedAvatars,
    @Default([]) List<String> unlockedThemes,
    required int collectedStardust,
    required int prestigeLevel,
    required int streakFreezes,
  }) = _OrbitProfile;
}
