import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';

class MassCalculator {
  MassCalculator._();

  static double baseMass(GravityClass gravityClass) {
    return switch (gravityClass) {
      GravityClass.feather => 1,
      GravityClass.pebble => 3,
      GravityClass.stone => 7,
      GravityClass.boulder => 15,
      GravityClass.planet => 30,
    };
  }

  static double streakMultiplier(int streakDays) {
    if (streakDays >= 365) return 2;
    if (streakDays >= 100) return 1.8;
    if (streakDays >= 60) return 1.6;
    if (streakDays >= 21) return 1.4;
    if (streakDays >= 7) return 1.2;
    return 1;
  }

  static double resonanceBonus(int chainLength) {
    if (chainLength >= 4) return 0.40;
    if (chainLength >= 3) return 0.25;
    if (chainLength >= 2) return 0.10;
    return 0;
  }

  static double calculateMass({
    required GravityClass gravityClass,
    required int currentStreak,
    int chainLength = 1,
  }) {
    final base = baseMass(gravityClass);
    final streakMult = streakMultiplier(currentStreak);
    final resonance = resonanceBonus(chainLength);
    return base * streakMult * (1.0 + resonance);
  }

  static int stardustForCompletion({
    required int currentStreak,
    int chainLength = 1,
    bool isStardustShower = false,
  }) {
    var stardust = 1;

    // Streak bonus: +1 per 7 days, capped at +10
    final streakBonus = (currentStreak ~/ 7).clamp(0, 10);
    stardust += streakBonus;

    // Resonance chain bonus
    if (chainLength >= 4) {
      stardust += 30;
    } else if (chainLength >= 3) {
      stardust += 15;
    } else if (chainLength >= 2) {
      stardust += 5;
    }

    // Stardust shower (~1 in 30)
    if (isStardustShower) {
      stardust += 5 + (DateTime.now().millisecond % 16); // 5-20
    }

    return stardust;
  }
}
