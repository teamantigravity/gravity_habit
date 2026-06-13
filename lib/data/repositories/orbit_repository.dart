import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/data/isar/database.dart';
import 'package:gravity_habit/data/isar/schemas/orbit_profile_schema.dart';
import 'package:gravity_habit/data/isar/schemas/stardust_ledger_schema.dart';
import 'package:gravity_habit/domain/entities/orbit_profile.dart';
import 'package:isar/isar.dart';

final orbitRepositoryProvider = Provider<OrbitRepository>((ref) {
  final db = ref.watch(gravityDatabaseProvider);
  return OrbitRepository(db);
});

class OrbitRepository {
  OrbitRepository(this._db);

  final GravityDatabase _db;

  Isar get _isar => _db.isar;

  Future<OrbitProfile> getProfile() async {
    final entity = await _isar.orbitProfileEntitys.get(0);
    if (entity == null) {
      return const OrbitProfile(
        totalMass: 0,
        currentOrbitTier: 0,
        streakDays: 0,
        longestStreak: 0,
        gravitationalPull: 0,
        collectedStardust: 0,
        prestigeLevel: 0,
        streakFreezes: 0,
      );
    }
    return _entityToProfile(entity);
  }

  Stream<OrbitProfile> watchProfile() {
    return _isar.orbitProfileEntitys
        .watchObject(0, fireImmediately: true)
        .map((entity) {
      if (entity == null) {
        return const OrbitProfile(
          totalMass: 0,
          currentOrbitTier: 0,
          streakDays: 0,
          longestStreak: 0,
          gravitationalPull: 0,
          collectedStardust: 0,
          prestigeLevel: 0,
          streakFreezes: 0,
        );
      }
      return _entityToProfile(entity);
    });
  }

  Future<void> updateProfile(OrbitProfile profile) async {
    final entity = _profileToEntity(profile);
    await _isar.writeTxn(() async {
      await _isar.orbitProfileEntitys.put(entity);
    });
  }

  Future<void> addStardust(int amount, String source,
      [String? referenceId]) async {
    await _isar.writeTxn(() async {
      // Update profile
      final profile =
          await _isar.orbitProfileEntitys.get(0) ?? OrbitProfileEntity()
            ..id = 0
            ..totalMass = 0
            ..currentOrbitTier = 0
            ..streakDays = 0
            ..longestStreak = 0
            ..gravitationalPull = 0
            ..collectedStardust = 0
            ..prestigeLevel = 0
            ..streakFreezes = 0
            ..lastCalculatedDate = DateTime.now();

      profile.collectedStardust += amount;
      await _isar.orbitProfileEntitys.put(profile);

      // Add ledger entry
      await _isar.stardustLedgerEntrys.put(
        StardustLedgerEntry()
          ..timestamp = DateTime.now()
          ..amount = amount
          ..source = source
          ..referenceId = referenceId,
      );
    });
  }

  Future<bool> spendStardust(int amount) async {
    final profile = await _isar.orbitProfileEntitys.get(0);
    if (profile == null || profile.collectedStardust < amount) return false;

    await _isar.writeTxn(() async {
      profile.collectedStardust -= amount;
      await _isar.orbitProfileEntitys.put(profile);

      await _isar.stardustLedgerEntrys.put(
        StardustLedgerEntry()
          ..timestamp = DateTime.now()
          ..amount = -amount
          ..source = 'purchase',
      );
    });
    return true;
  }

  Future<void> addMass(double mass) async {
    await _isar.writeTxn(() async {
      final profile =
          await _isar.orbitProfileEntitys.get(0) ?? OrbitProfileEntity()
            ..id = 0
            ..totalMass = 0
            ..currentOrbitTier = 0
            ..streakDays = 0
            ..longestStreak = 0
            ..gravitationalPull = 0
            ..collectedStardust = 0
            ..prestigeLevel = 0
            ..streakFreezes = 0
            ..lastCalculatedDate = DateTime.now();

      profile.totalMass += mass;
      await _isar.orbitProfileEntitys.put(profile);
    });
  }

  OrbitProfile _entityToProfile(OrbitProfileEntity e) {
    return OrbitProfile(
      totalMass: e.totalMass,
      currentOrbitTier: e.currentOrbitTier,
      streakDays: e.streakDays,
      longestStreak: e.longestStreak,
      gravitationalPull: e.gravitationalPull,
      unlockedConstellations: _jsonToStringList(e.unlockedConstellationsJson),
      unlockedAvatars: _jsonToStringList(e.unlockedAvatarsJson),
      unlockedThemes: _jsonToStringList(e.unlockedThemesJson),
      collectedStardust: e.collectedStardust,
      prestigeLevel: e.prestigeLevel,
      streakFreezes: e.streakFreezes,
    );
  }

  OrbitProfileEntity _profileToEntity(OrbitProfile p) {
    return OrbitProfileEntity()
      ..id = 0
      ..totalMass = p.totalMass
      ..currentOrbitTier = p.currentOrbitTier
      ..streakDays = p.streakDays
      ..longestStreak = p.longestStreak
      ..gravitationalPull = p.gravitationalPull
      ..unlockedConstellationsJson =
          p.unlockedConstellations.isNotEmpty
              ? jsonEncode(p.unlockedConstellations)
              : null
      ..unlockedAvatarsJson =
          p.unlockedAvatars.isNotEmpty ? jsonEncode(p.unlockedAvatars) : null
      ..unlockedThemesJson =
          p.unlockedThemes.isNotEmpty ? jsonEncode(p.unlockedThemes) : null
      ..collectedStardust = p.collectedStardust
      ..prestigeLevel = p.prestigeLevel
      ..streakFreezes = p.streakFreezes
      ..lastCalculatedDate = DateTime.now();
  }

  List<String> _jsonToStringList(String? json) {
    if (json == null) return [];
    return (jsonDecode(json) as List).cast<String>();
  }
}
