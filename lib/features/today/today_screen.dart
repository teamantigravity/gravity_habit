import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/core/extensions/date_extensions.dart';
import 'package:gravity_habit/features/settings/settings_provider.dart';
import 'package:gravity_habit/features/today/providers/today_provider.dart';
import 'package:gravity_habit/features/today/widgets/completion_sheet.dart';
import 'package:gravity_habit/features/today/widgets/empty_cosmos.dart';
import 'package:gravity_habit/features/today/widgets/habit_list_card.dart';
import 'package:gravity_habit/features/today/widgets/orbit_canvas.dart';
import 'package:gravity_habit/features/today/widgets/pull_gauge.dart';
import 'package:gravity_habit/services/haptics/haptic_service.dart';
import 'package:gravity_habit/ui/widgets/glass_panel.dart';
import 'package:gravity_habit/ui/widgets/stardust_counter.dart';
import 'package:intl/intl.dart';

class TodayScreen extends ConsumerStatefulWidget {
  const TodayScreen({super.key});

  @override
  ConsumerState<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends ConsumerState<TodayScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final todayState = ref.watch(todayProvider);
    final settings = ref.watch(settingsProvider);
    final isListMode = settings.isListMode;

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: todayState.when(
          data: (state) {
            if (state.habits.isEmpty) {
              return const EmptyCosmos();
            }

            return isListMode ? _buildListMode(state) : _buildOrbitMode(state);
          },
          loading: () => const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
          error: (e, _) => Center(
            child: Text(
              'Something drifted. Pull to refresh.',
              style: context.textTheme.bodyLarge,
            ),
          ),
        ),
      ),
      floatingActionButton: _buildFAB(todayState),
    );
  }

  Widget _buildOrbitMode(TodayState state) {
    final now = DateTime.now();
    final greeting = _greeting(now);

    return Column(
      children: [
        // Top bar
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Spacing.md,
            vertical: Spacing.xs,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('EEEE, MMMM d').format(now),
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontFamily: 'SpaceGrotesk',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      greeting,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colors.onSurface.withValues(alpha: 0.6),
                      ),
                    ),
                  ],
                ),
              ),
              // Toggle view
              IconButton(
                icon: const Icon(Icons.list_rounded),
                onPressed: () {
                  ref.read(hapticServiceProvider).play(HapticType.tap);
                  ref.read(settingsProvider.notifier).update(
                        (s) => s.copyWith(isListMode: true),
                      );
                },
                tooltip: 'List view',
              ),
            ],
          ),
        ).animate().fadeIn(duration: 300.ms),

        // Stardust counter
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
          child: Row(
            children: [
              // Profile orb
              GestureDetector(
                onTap: () => context.go('/settings'),
                child: Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                      colors: [
                        context.colors.primary.withValues(alpha: 0.8),
                        context.colors.primary.withValues(alpha: 0.3),
                      ],
                    ),
                  ),
                  child: Icon(
                    Icons.person_outline,
                    size: 18,
                    color: context.colors.onPrimary,
                  ),
                ),
              ),
              const Spacer(),
              StardustCounter(count: state.stardust),
            ],
          ),
        ),

        // Orbit canvas
        Expanded(
          flex: 6,
          child: OrbitCanvas(
            habits: state.habits,
            entries: state.todayEntries,
            longestStreak: state.longestStreak,
            onHabitTap: (habit) => _showCompletionSheet(habit.id),
          ),
        ),

        // Bottom stats
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
          child: GlassPanel(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatChip(
                  label: 'Done',
                  value: '${state.completedCount}/${state.totalScheduled}',
                ),
                PullGauge(pull: state.dailyPull),
                _StatChip(
                  label: 'Streak',
                  value: '${state.metaStreak}d',
                ),
              ],
            ),
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 300.ms),

        const SizedBox(height: 100), // Bottom nav clearance
      ],
    );
  }

  Widget _buildListMode(TodayState state) {
    final now = DateTime.now();
    final greeting = _greeting(now);

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              Spacing.md,
              Spacing.xs,
              Spacing.md,
              Spacing.md,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('EEEE, MMMM d').format(now),
                        style: context.textTheme.headlineSmall?.copyWith(
                          fontFamily: 'SpaceGrotesk',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        greeting,
                        style: context.textTheme.bodyMedium?.copyWith(
                          color:
                              context.colors.onSurface.withValues(alpha: 0.6),
                        ),
                      ),
                    ],
                  ),
                ),
                StardustCounter(
                  count: state.stardust,
                  size: StardustSize.small,
                ),
                const SizedBox(width: Spacing.xs),
                IconButton(
                  icon: const Icon(Icons.blur_on_rounded),
                  onPressed: () {
                    ref.read(hapticServiceProvider).play(HapticType.tap);
                    ref.read(settingsProvider.notifier).update(
                          (s) => s.copyWith(isListMode: false),
                        );
                  },
                  tooltip: 'Orbit view',
                ),
              ],
            ),
          ),
        ),

        // Pull gauge header
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
            child: GlassPanel(
              padding: const EdgeInsets.symmetric(
                horizontal: Spacing.md,
                vertical: Spacing.sm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _StatChip(
                    label: 'Done',
                    value: '${state.completedCount}/${state.totalScheduled}',
                  ),
                  PullGauge(pull: state.dailyPull, size: 48),
                  _StatChip(
                    label: 'Streak',
                    value: '${state.metaStreak}d',
                  ),
                ],
              ),
            ),
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: Spacing.md)),

        // Habit cards
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
          sliver: SliverList.builder(
            itemCount: state.habits.length,
            itemBuilder: (context, index) {
              final habit = state.habits[index];
              final entry = state.todayEntries
                  .where((e) => e.habitId == habit.id)
                  .firstOrNull;

              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.sm),
                child: HabitListCard(
                  habit: habit,
                  entry: entry,
                  onTap: () => _showCompletionSheet(habit.id),
                  onComplete: () => _quickComplete(habit.id),
                  onSkip: (reason) => _skip(habit.id, reason),
                ),
              ).animate().fadeIn(
                    delay: Duration(milliseconds: 50 * index),
                    duration: 250.ms,
                  );
            },
          ),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: 120)),
      ],
    );
  }

  Widget? _buildFAB(AsyncValue<TodayState> todayState) {
    return FloatingActionButton.extended(
      onPressed: () => context.push('/habit-editor'),
      heroTag: 'today_fab',
      backgroundColor: context.colors.primary,
      foregroundColor: context.colors.onPrimary,
      elevation: 4,
      icon: const Icon(Icons.add_rounded),
      label: const Text(
        'New Habit',
        style: TextStyle(fontWeight: FontWeight.w700),
      ),
    ).animate().scaleXY(
          begin: 0,
          end: 1,
          delay: 400.ms,
          duration: 300.ms,
          curve: const Cubic(0.16, 1, 0.3, 1),
        );
  }

  void _showCompletionSheet(String habitId) {
    ref.read(hapticServiceProvider).play(HapticType.tap);
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CompletionSheet(habitId: habitId),
    );
  }

  Future<void> _quickComplete(String habitId) async {
    await ref.read(todayProvider.notifier).completeHabit(habitId);
  }

  Future<void> _skip(String habitId, String reason) async {
    await ref.read(todayProvider.notifier).skipHabit(habitId, reason);
  }

  String _greeting(DateTime now) {
    final key = now.greetingKey;
    return switch (key) {
      'morning' => 'Good morning',
      'afternoon' => 'Good afternoon',
      'evening' => 'Good evening',
      'night' => now.isLateNight
          ? "It's late. One small act is enough."
          : 'Good evening',
      _ => 'Welcome back',
    };
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: context.textTheme.titleLarge?.copyWith(
            fontFamily: 'JetBrainsMono',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
