import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/repositories/habit_repository.dart';
import 'package:gravity_habit/data/repositories/orbit_repository.dart';
import 'package:gravity_habit/domain/entities/habit.dart';
import 'package:gravity_habit/domain/gravity_engine/tier_system.dart';
import 'package:gravity_habit/features/settings/settings_provider.dart';
import 'package:gravity_habit/features/stats/widgets/consistency_rings.dart';
import 'package:gravity_habit/features/stats/widgets/heatmap_year.dart';
import 'package:gravity_habit/features/stats/widgets/insight_card.dart';
import 'package:gravity_habit/services/ads/ad_service.dart';
import 'package:gravity_habit/ui/widgets/glass_panel.dart';
import 'package:gravity_habit/ui/widgets/rolling_number.dart';

final statsProvider = FutureProvider<StatsData>((ref) async {
  final habitRepo = ref.watch(habitRepositoryProvider);
  final orbitRepo = ref.watch(orbitRepositoryProvider);
  final habits = await habitRepo.getAllHabits();
  final profile = await orbitRepo.getProfile();
  final now = DateTime.now();

  // Gather all entries
  final allEntries = <HabitEntry>[];
  final habitStreaks = <String, int>{};
  for (final habit in habits) {
    final entries = await habitRepo.getEntriesForHabit(habit.id);
    allEntries.addAll(entries);
    // Simple streak calc
    var streak = 0;
    for (var d = 0; d < 1000; d++) {
      final date = now.subtract(Duration(days: d));
      final key = '${date.year}-${date.month}-${date.day}';
      final found = entries.any(
        (e) =>
            e.isComplete &&
            e.date.year == date.year &&
            e.date.month == date.month &&
            e.date.day == date.day,
      );
      if (found) {
        streak++;
      } else {
        break;
      }
    }
    habitStreaks[habit.id] = streak;
  }

  // Today / week / month consistency
  final todayEntries = allEntries.where((e) => _isToday(e.date)).toList();
  final todayComplete =
      todayEntries.where((e) => e.isComplete).length;
  final todayRatio =
      habits.isEmpty ? 0.0 : todayComplete / habits.length;

  final weekStart = now.subtract(Duration(days: now.weekday - 1));
  var weekDays = 0;
  var weekCompleteDays = 0;
  for (var d = 0; d < 7; d++) {
    final date = weekStart.add(Duration(days: d));
    if (date.isAfter(now)) break;
    weekDays++;
    final dayEntries = allEntries.where(
      (e) =>
          e.date.year == date.year &&
          e.date.month == date.month &&
          e.date.day == date.day &&
          e.isComplete,
    );
    if (dayEntries.isNotEmpty) weekCompleteDays++;
  }
  final weekRatio = weekDays == 0 ? 0.0 : weekCompleteDays / weekDays;

  var monthDays = 0;
  var monthCompleteDays = 0;
  for (var d = 0; d < 30; d++) {
    final date = now.subtract(Duration(days: d));
    monthDays++;
    final dayEntries = allEntries.where(
      (e) =>
          e.date.year == date.year &&
          e.date.month == date.month &&
          e.date.day == date.day &&
          e.isComplete,
    );
    if (dayEntries.isNotEmpty) monthCompleteDays++;
  }
  final monthRatio =
      monthDays == 0 ? 0.0 : monthCompleteDays / monthDays;

  // Best streaks leaderboard
  final sortedStreaks = habitStreaks.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  // Time-of-day distribution
  final hourCounts = List.filled(24, 0);
  for (final e in allEntries.where((e) => e.isComplete && e.completedAt != null)) {
    hourCounts[e.completedAt!.hour]++;
  }

  // Day-of-week strength
  final dowCounts = List.filled(7, 0);
  for (final e in allEntries.where((e) => e.isComplete)) {
    dowCounts[e.date.weekday - 1]++;
  }

  // Mood average
  final moodEntries =
      allEntries.where((e) => e.mood != null).toList();
  final avgMood = moodEntries.isEmpty
      ? 0.0
      : moodEntries.map((e) => e.mood!).reduce((a, b) => a + b) /
          moodEntries.length;

  // Insights
  final insights = <String>[];
  if (todayRatio >= 1.0) {
    insights.add('Perfect day so far. Every orbit complete.');
  }
  if (weekRatio > 0.8) {
    insights.add('Strong week. Your consistency is above 80%.');
  }
  final bestHour = hourCounts.indexOf(hourCounts.reduce(max));
  if (hourCounts[bestHour] > 5) {
    insights.add(
      'You are most active around ${bestHour.toString().padLeft(2, "0")}:00.',
    );
  }
  if (avgMood > 3.5) {
    insights.add(
      'Your average mood on completion days is ${avgMood.toStringAsFixed(1)}/5.',
    );
  }

  return StatsData(
    habits: habits,
    allEntries: allEntries,
    totalMass: profile.totalMass,
    currentTier: profile.currentOrbitTier,
    gravitationalPull: profile.gravitationalPull,
    todayConsistency: todayRatio,
    weekConsistency: weekRatio,
    monthConsistency: monthRatio,
    bestStreaks: sortedStreaks.take(5).toList(),
    hourDistribution: hourCounts,
    dowDistribution: dowCounts,
    avgMood: avgMood,
    insights: insights,
  );
});

bool _isToday(DateTime d) {
  final now = DateTime.now();
  return d.year == now.year && d.month == now.month && d.day == now.day;
}

class StatsData {
  const StatsData({
    required this.habits,
    required this.allEntries,
    required this.totalMass,
    required this.currentTier,
    required this.gravitationalPull,
    required this.todayConsistency,
    required this.weekConsistency,
    required this.monthConsistency,
    required this.bestStreaks,
    required this.hourDistribution,
    required this.dowDistribution,
    required this.avgMood,
    required this.insights,
  });

  final List<Habit> habits;
  final List<HabitEntry> allEntries;
  final double totalMass;
  final int currentTier;
  final double gravitationalPull;
  final double todayConsistency;
  final double weekConsistency;
  final double monthConsistency;
  final List<MapEntry<String, int>> bestStreaks;
  final List<int> hourDistribution;
  final List<int> dowDistribution;
  final double avgMood;
  final List<String> insights;
}

class StatsScreen extends ConsumerWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(statsProvider);
    final settings = ref.watch(settingsProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: statsAsync.when(
          data: (data) => _StatsContent(data: data, adsRemoved: settings.adsRemoved),
          loading: () => const Center(child: CircularProgressIndicator(strokeWidth: 2)),
          error: (e, _) => Center(child: Text('Unable to load stats')),
        ),
      ),
    );
  }
}

class _StatsContent extends StatelessWidget {
  const _StatsContent({required this.data, required this.adsRemoved});

  final StatsData data;
  final bool adsRemoved;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              Spacing.md, Spacing.sm, Spacing.md, 0,
            ),
            child: Text(
              'Stats & Insights',
              style: context.textTheme.headlineSmall?.copyWith(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.w700,
              ),
            ),
          ).animate().fadeIn(duration: 300.ms),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: Spacing.xl)),

        // Consistency rings
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
            child: ConsistencyRings(
              today: data.todayConsistency,
              week: data.weekConsistency,
              month: data.monthConsistency,
            ),
          ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: Spacing.xxl)),

        // Total mass + Tier
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
            child: GlassPanel(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      RollingNumber(
                        value: data.totalMass.round(),
                        style: context.textTheme.headlineMedium?.copyWith(
                          fontFamily: 'JetBrainsMono',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        'Total Mass',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colors.onSurface.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        TierSystem.tierName(data.currentTier),
                        style: context.textTheme.titleMedium?.copyWith(
                          color: context.colors.primary,
                          fontFamily: 'SpaceGrotesk',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Tier ${data.currentTier}',
                        style: context.textTheme.bodySmall?.copyWith(
                          color: context.colors.onSurface.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: Spacing.xxl)),

        // Best Streaks
        if (data.bestStreaks.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Best Streaks',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontFamily: 'SpaceGrotesk',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: Spacing.sm),
                  ...data.bestStreaks.map((entry) {
                    final habit = data.habits.firstWhere(
                      (h) => h.id == entry.key,
                      orElse: () => data.habits.first,
                    );
                    return Padding(
                      padding: const EdgeInsets.only(bottom: Spacing.xs),
                      child: Row(
                        children: [
                          Text(habit.emoji, style: const TextStyle(fontSize: 20)),
                          const SizedBox(width: Spacing.sm),
                          Expanded(
                            child: Text(
                              habit.name,
                              style: context.textTheme.bodyMedium,
                            ),
                          ),
                          Text(
                            '${entry.value}d',
                            style: context.textTheme.titleMedium?.copyWith(
                              fontFamily: 'JetBrainsMono',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ).animate().fadeIn(delay: 300.ms, duration: 400.ms),
          ),

        const SliverToBoxAdapter(child: SizedBox(height: Spacing.xxl)),

        // Time-of-day heatmap
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Time of Day',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: Spacing.sm),
                SizedBox(
                  height: 120,
                  child: _TimeOfDayChart(
                    data: data.hourDistribution,
                    accentColor: context.colors.primary,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: Spacing.xxl)),

        // Day of week strength
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Day of Week',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: Spacing.sm),
                _DayOfWeekBar(
                  data: data.dowDistribution,
                  accentColor: context.colors.primary,
                ),
              ],
            ),
          ).animate().fadeIn(delay: 500.ms, duration: 400.ms),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: Spacing.xxl)),

        // Year in pixels
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Year in Pixels',
                  style: context.textTheme.titleMedium?.copyWith(
                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: Spacing.sm),
                HeatmapYear(
                  entries: data.allEntries,
                  accentColor: context.colors.primary,
                ),
              ],
            ),
          ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
        ),

        const SliverToBoxAdapter(child: SizedBox(height: Spacing.xxl)),

        // Insights
        if (data.insights.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Insights',
                    style: context.textTheme.titleMedium?.copyWith(
                      fontFamily: 'SpaceGrotesk',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: Spacing.sm),
                  ...data.insights.map(
                    (insight) => Padding(
                      padding: const EdgeInsets.only(bottom: Spacing.xs),
                      child: InsightCard(text: insight),
                    ),
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 700.ms, duration: 400.ms),
          ),

        // Ad banner slot
        if (!adsRemoved)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(Spacing.md),
              child: const AdBannerWidget(),
            ),
          ),

        const SliverToBoxAdapter(child: SizedBox(height: 120)),
      ],
    );
  }
}

class _TimeOfDayChart extends StatelessWidget {
  const _TimeOfDayChart({required this.data, required this.accentColor});

  final List<int> data;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final maxVal = data.reduce(max).toDouble();
    if (maxVal == 0) {
      return Center(
        child: Text(
          'Complete habits to see patterns',
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withOpacity(0.4),
          ),
        ),
      );
    }

    return BarChart(
      BarChartData(
        barGroups: List.generate(24, (i) {
          return BarChartGroupData(
            x: i,
            barRods: [
              BarChartRodData(
                toY: data[i].toDouble(),
                color: accentColor.withOpacity(
                  0.3 + (data[i] / maxVal) * 0.7,
                ),
                width: 8,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
              ),
            ],
          );
        }),
        titlesData: FlTitlesData(
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() % 6 != 0) return const SizedBox.shrink();
                return Text(
                  '${value.toInt()}',
                  style: TextStyle(
                    fontSize: 10,
                    color: context.colors.onSurface.withOpacity(0.4),
                    fontFamily: 'JetBrainsMono',
                  ),
                );
              },
            ),
          ),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barTouchData: BarTouchData(enabled: false),
      ),
    );
  }
}

class _DayOfWeekBar extends StatelessWidget {
  const _DayOfWeekBar({required this.data, required this.accentColor});

  final List<int> data;
  final Color accentColor;

  @override
  Widget build(BuildContext context) {
    final maxVal = data.reduce(max).toDouble();
    final labels = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

    if (maxVal == 0) return const SizedBox(height: 60);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(7, (i) {
        final ratio = maxVal > 0 ? data[i] / maxVal : 0.0;
        return Column(
          children: [
            SizedBox(
              height: 60,
              width: 24,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  height: 8 + ratio * 52,
                  width: 24,
                  decoration: BoxDecoration(
                    color: accentColor.withOpacity(0.3 + ratio * 0.7),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(6),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              labels[i],
              style: TextStyle(
                fontSize: 10,
                color: context.colors.onSurface.withOpacity(0.5),
              ),
            ),
          ],
        );
      }),
    );
  }
}
