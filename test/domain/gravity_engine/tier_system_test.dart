// test/domain/gravity_engine/tier_system_test.dart
// COMPLETE CORRECTED FILE

import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_habit/domain/gravity_engine/tier_system.dart';

void main() {
  group('TierSystem', () {
    test('massForTier returns 0 for tier 0', () {
      expect(TierSystem.massForTier(0), 0);
    });

    test('massForTier returns 50 for tier 1', () {
      expect(TierSystem.massForTier(1), 50);
    });

    test('massForTier matches formula floor(50 * N^1.6)', () {
      for (var tier = 1; tier <= 10; tier++) {
        final expected = (50 * math.pow(tier.toDouble(), 1.6)).floor();
        expect(TierSystem.massForTier(tier), expected);
      }
    });

    test('tierFromMass returns 0 for zero mass', () {
      expect(TierSystem.tierFromMass(0), 0);
    });

    test('tierFromMass returns 1 for mass 50', () {
      expect(TierSystem.tierFromMass(50), 1);
    });

    test('tierFromMass returns 100 for very large mass', () {
      expect(TierSystem.tierFromMass(999999), 100);
    });

    test('progressToNextTier returns value between 0 and 1', () {
      for (var mass = 0.0; mass < 1000; mass += 50) {
        final progress = TierSystem.progressToNextTier(mass);
        expect(progress, greaterThanOrEqualTo(0.0));
        expect(progress, lessThanOrEqualTo(1.0));
      }
    });

    test('eraForTier returns correct eras at boundaries', () {
      expect(TierSystem.eraForTier(1), TierEra.dust);
      expect(TierSystem.eraForTier(9), TierEra.dust);
      expect(TierSystem.eraForTier(10), TierEra.asteroid);
      expect(TierSystem.eraForTier(24), TierEra.asteroid);
      expect(TierSystem.eraForTier(25), TierEra.moon);
      expect(TierSystem.eraForTier(44), TierEra.moon);
      expect(TierSystem.eraForTier(45), TierEra.planet);
      expect(TierSystem.eraForTier(64), TierEra.planet);
      expect(TierSystem.eraForTier(65), TierEra.star);
      expect(TierSystem.eraForTier(84), TierEra.star);
      expect(TierSystem.eraForTier(85), TierEra.quasar);
      expect(TierSystem.eraForTier(100), TierEra.quasar);
    });

    test('all 100 tier names exist and are non-empty', () {
      for (var i = 1; i <= 100; i++) {
        final name = TierSystem.tierName(i);
        expect(name, isNotEmpty, reason: 'Tier $i has empty name');
        expect(name, isNot('Unranked'), reason: 'Tier $i is Unranked');
      }
    });

    test('tier 1 is First Spark, tier 100 is Gravity Itself', () {
      expect(TierSystem.tierName(1), 'First Spark');
      expect(TierSystem.tierName(100), 'Gravity Itself');
    });

    test('out of range tiers return Unranked', () {
      expect(TierSystem.tierName(0), 'Unranked');
      expect(TierSystem.tierName(101), 'Unranked');
      expect(TierSystem.tierName(-1), 'Unranked');
    });
  });
}
