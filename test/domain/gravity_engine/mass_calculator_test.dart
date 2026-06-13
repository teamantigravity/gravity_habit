import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';
import 'package:gravity_habit/domain/gravity_engine/mass_calculator.dart';

void main() {
  group('MassCalculator', () {
    test('baseMass returns correct values per gravity class', () {
      expect(MassCalculator.baseMass(GravityClass.feather), 1);
      expect(MassCalculator.baseMass(GravityClass.pebble), 3);
      expect(MassCalculator.baseMass(GravityClass.stone), 7);
      expect(MassCalculator.baseMass(GravityClass.boulder), 15);
      expect(MassCalculator.baseMass(GravityClass.planet), 30);
    });

    test('streakMultiplier returns correct values', () {
      expect(MassCalculator.streakMultiplier(0), 1.0);
      expect(MassCalculator.streakMultiplier(6), 1.0);
      expect(MassCalculator.streakMultiplier(7), 1.2);
      expect(MassCalculator.streakMultiplier(20), 1.2);
      expect(MassCalculator.streakMultiplier(21), 1.4);
      expect(MassCalculator.streakMultiplier(59), 1.4);
      expect(MassCalculator.streakMultiplier(60), 1.6);
      expect(MassCalculator.streakMultiplier(99), 1.6);
      expect(MassCalculator.streakMultiplier(100), 1.8);
      expect(MassCalculator.streakMultiplier(364), 1.8);
      expect(MassCalculator.streakMultiplier(365), 2.0);
      expect(MassCalculator.streakMultiplier(1000), 2.0);
    });

    test('resonanceBonus returns correct values', () {
      expect(MassCalculator.resonanceBonus(0), 0.0);
      expect(MassCalculator.resonanceBonus(1), 0.0);
      expect(MassCalculator.resonanceBonus(2), 0.10);
      expect(MassCalculator.resonanceBonus(3), 0.25);
      expect(MassCalculator.resonanceBonus(4), 0.40);
      expect(MassCalculator.resonanceBonus(5), 0.40);
    });

    test('calculateMass combines base, streak, and resonance', () {
      final mass = MassCalculator.calculateMass(
        gravityClass: GravityClass.stone,
        currentStreak: 30,
        chainLength: 3,
      );
      // base=7, streak=1.4, resonance=0.25
      // 7 * 1.4 * 1.25 = 12.25
      expect(mass, closeTo(12.25, 0.01));
    });

    test('stardustForCompletion returns base 1 with no bonuses', () {
      final stardust = MassCalculator.stardustForCompletion(
        currentStreak: 0,
      );
      expect(stardust, 1);
    });

    test('stardustForCompletion includes streak bonus capped at 10', () {
      final stardust = MassCalculator.stardustForCompletion(
        currentStreak: 77,
      );
      // base=1, streakBonus = 77~/7 = 11, capped to 10
      expect(stardust, 11);
    });

    test('stardustForCompletion includes resonance bonus', () {
      final stardust = MassCalculator.stardustForCompletion(
        currentStreak: 7,
        chainLength: 3,
      );
      // base=1, streak=1, resonance=15
      expect(stardust, 17);
    });
  });
}
