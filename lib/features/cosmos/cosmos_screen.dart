import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/repositories/orbit_repository.dart';
import 'package:gravity_habit/domain/entities/achievement.dart';
import 'package:gravity_habit/domain/entities/achievement_catalog.dart';
import 'package:gravity_habit/domain/entities/orbit_profile.dart';
import 'package:gravity_habit/domain/gravity_engine/tier_system.dart';
import 'package:gravity_habit/data/isar/schemas/achievement_schema.dart';
import 'package:gravity_habit/features/today/widgets/orbit_ring.dart';

class CosmosScreen extends ConsumerWidget {
  const CosmosScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orbitRepo = ref.watch(orbitRepositoryProvider);
    final dataFuture = Future.wait([
      orbitRepo.getProfile(),
      orbitRepo.getUnlockedAchievements(),
    ]);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: FutureBuilder(
          future: dataFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator(strokeWidth: 2));
            }
            final results = snapshot.data as List<dynamic>;
            final profile = results[0] as OrbitProfile;
            final unlockedList = results[1] as List<AchievementEntity>;
            final unlockedIds = unlockedList.map((e) => e.achievementId).toSet();
            final tier = TierSystem.tierFromMass(profile.totalMass);
            final tierName = TierSystem.tierName(tier);
            final era = TierSystem.eraForTier(tier);
            final progress = TierSystem.progressToNextTier(profile.totalMass);

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      Spacing.md, Spacing.sm, Spacing.md, 0,
                    ),
                    child: Text(
                      'Cosmos',
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontFamily: 'SpaceGrotesk',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),

                // Tier hero
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(Spacing.xl),
                    child: Center(
                      child: Column(
                        children: [
                          OrbitRing(
                            progress: progress,
                            color: context.colors.primary,
                            size: 120,
                            strokeWidth: 6,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '$tier',
                                  style: context.textTheme.displaySmall?.copyWith(
                                    fontFamily: 'SpaceGrotesk',
                                    fontWeight: FontWeight.w700,
                                    color: context.colors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ).animate().scaleXY(begin: 0.8, end: 1, duration: 400.ms),
                          const SizedBox(height: Spacing.sm),
                          Text(
                            tierName,
                            style: context.textTheme.titleLarge?.copyWith(
                              fontFamily: 'SpaceGrotesk',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            '${era.eraLabel} — ${era.displayName}',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: context.colors.onSurface.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Shop button
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
                    child: OutlinedButton.icon(
                      onPressed: () => context.push('/shop'),
                      icon: const Icon(Icons.storefront_outlined),
                      label: const Text('Cosmos Shop'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: Spacing.sm),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(CornerRadii.sm),
                        ),
                      ),
                    ),
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: Spacing.xxl)),

                // Achievements by group
                ...AchievementCatalog.groups.expand((group) => [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(
                        Spacing.md, Spacing.md, Spacing.md, Spacing.sm,
                      ),
                      child: Text(
                        group,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontFamily: 'SpaceGrotesk',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.85,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final achievements = AchievementCatalog.byGroup(group);
                          if (index >= achievements.length) return null;
                          final achievement = achievements[index];
                          final isUnlocked = unlockedIds.contains(achievement.id);
                          return _AchievementCard(
                            achievement: achievement,
                            isUnlocked: isUnlocked,
                          );
                        },
                        childCount: AchievementCatalog.byGroup(group).length,
                      ),
                    ),
                  ),
                ]),

                const SliverToBoxAdapter(child: SizedBox(height: 120)),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AchievementCard extends StatelessWidget {
  const _AchievementCard({
    required this.achievement,
    required this.isUnlocked,
  });

  final AchievementDef achievement;
  final bool isUnlocked;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label:
          '${achievement.name}: ${achievement.description}. ${isUnlocked ? "Unlocked" : "Locked"}',
      child: Container(
        padding: const EdgeInsets.all(Spacing.xs),
        decoration: BoxDecoration(
          color: isUnlocked
              ? context.colors.primaryContainer.withOpacity(0.2)
              : context.colors.surface,
          borderRadius: BorderRadius.circular(CornerRadii.sm),
          border: Border.all(
            color: isUnlocked
                ? context.colors.primary.withOpacity(0.3)
                : context.colors.outlineVariant.withOpacity(0.15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              achievement.rarity.icon,
              style: TextStyle(
                fontSize: 24,
                color: isUnlocked ? null : Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              achievement.name,
              style: context.textTheme.labelSmall?.copyWith(
                fontFamily: 'Inter',
                fontWeight: isUnlocked ? FontWeight.w600 : FontWeight.w400,
                color: isUnlocked
                    ? context.colors.onSurface
                    : context.colors.onSurface.withOpacity(0.4),
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 2),
            Text(
              '${achievement.stardustReward} ✨',
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'JetBrainsMono',
                color: context.colors.onSurface.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
