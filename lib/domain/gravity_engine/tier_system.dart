// lib/domain/gravity_engine/tier_system.dart
// COMPLETE CORRECTED FILE

import 'dart:math' as math;

class TierSystem {
  TierSystem._();

  /// Mass required to reach tier N: floor(50 × N^1.6)
  static int massForTier(int tier) {
    if (tier <= 0) return 0;
    return (50 * math.pow(tier.toDouble(), 1.6)).floor();
  }

  /// Calculate current tier from total mass.
  static int tierFromMass(double totalMass) {
    for (var tier = 100; tier >= 0; tier--) {
      if (totalMass >= massForTier(tier)) return tier;
    }
    return 0;
  }

  /// Progress to next tier (0.0 to 1.0).
  static double progressToNextTier(double totalMass) {
    final currentTier = tierFromMass(totalMass);
    if (currentTier >= 100) return 1.0;
    final currentReq = massForTier(currentTier).toDouble();
    final nextReq = massForTier(currentTier + 1).toDouble();
    final range = nextReq - currentReq;
    if (range <= 0) return 1.0;
    return ((totalMass - currentReq) / range).clamp(0.0, 1.0);
  }

  /// Era for a given tier.
  static TierEra eraForTier(int tier) {
    if (tier < 10) return TierEra.dust;
    if (tier < 25) return TierEra.asteroid;
    if (tier < 45) return TierEra.moon;
    if (tier < 65) return TierEra.planet;
    if (tier < 85) return TierEra.star;
    return TierEra.quasar;
  }

  static String tierName(int tier) {
    if (tier < 1 || tier > 100) return 'Unranked';
    return _tierNames[tier - 1];
  }

  static const _tierNames = [
    'First Spark', 'Drifting Mote', 'Wandering Particle', 'Gathering Dust',
    'Cosmic Whisper', 'Forming Cloud', 'Stellar Seed', 'Dense Pocket',
    'Threshold',
    'Asteroid Born', 'Tumbling Rock', 'Iron Heart', 'Belt Wanderer',
    'Silent Mass', 'Carved Surface', 'Steady Spin', 'Mineral Core',
    'Gravity Whisper', 'Bound Path', 'Resonant Stone', 'Crystalline Edge',
    'Magnetic Pull', 'Awakening Mass', 'Edge of Moon',
    'Lunar Birth', 'Quiet Orbit', 'Tidal Whisper', 'Crescent Mind',
    'Silver Shore', 'Half-Light', 'Reflective Pool', 'Gibbous Strength',
    'Full Bloom', 'Waning Wisdom', 'Dark Side Known', 'Phase Master',
    'Eclipse Walker', "Selene's Companion", 'Tidal Architect',
    'Lunar Cartographer', 'Mare Builder', 'Crater Keeper',
    'Sea of Tranquility', 'Edge of Planet',
    'Planetary Birth', 'First Atmosphere', 'Continent Drift',
    'Ocean Forming', 'Storm Weaver', 'Living World', 'Tectonic Heart',
    'Magnetic Field', 'Cloud Architect', 'Biosphere', 'Seasonal Mind',
    'Tilted Axis', 'Ringed Wonder', 'Atmospheric Master', 'Geode Soul',
    'Gravity Well', 'Tidal Lord', 'Volcanic Will', 'Verdant Crown',
    'Edge of Star',
    'Ignition', 'First Light', 'Solar Wind', 'Corona', 'Sunspot Mind',
    'Flare Born', 'Helios', 'Stellar Heart', 'Photon Stream',
    'Solar Architect', 'Binary Forming', 'Plasma Dance', 'Heliosphere',
    'Stellar Cartographer', 'Nova Whisper', 'Sungazer', 'Solar Mythos',
    'Crowned Star', 'Eternal Flame', 'Edge of Quasar',
    'Quasar Awakening', 'Light Beam', 'Galactic Engine', 'Bright Whisper',
    'Cosmic Beacon', 'Reality Bender', "Time's Witness", 'Universal Heart',
    'Infinite Recursion', 'Light Years Beyond', 'Architect of Days',
    'Mythic Pull', 'Eternal Voyager', 'The Final Orbit', 'Beyond Naming',
    'Gravity Itself',
  ];
}

enum TierEra {
  dust('Dust', 'Era I'),
  asteroid('Asteroid', 'Era II'),
  moon('Moon', 'Era III'),
  planet('Planet', 'Era IV'),
  star('Star', 'Era V'),
  quasar('Quasar', 'Era VI');

  const TierEra(this.displayName, this.eraLabel);
  final String displayName;
  final String eraLabel;
}
