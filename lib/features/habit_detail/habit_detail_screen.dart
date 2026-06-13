import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/repositories/habit_repository.dart';
import 'package:gravity_habit/domain/entities/habit.dart';
import 'package:gravity_habit/domain/gravity_engine/streak_engine.dart';
import 'package:gravity_habit/features/today/providers/today_provider.dart';
import 'package:gravity_habit/features/today/widgets/orbit_ring.dart';
import 'package:gravity_habit/services/haptics/haptic_service.dart';

class HabitDetailScreen extends ConsumerStatefulWidget {
  const HabitDetailScreen({required this.habitId, super.key});

  final String habitId;

  @override
  ConsumerState<HabitDetailScreen> createState() =>
      _HabitDetailScreenState();
}

class _HabitDetailScreenState extends ConsumerState<HabitDetailScreen> {
  Habit? _habit;
  List<HabitEntry> _entries = [];
  int _currentStreak = 0;
  int _longestStreak = 0;
  int _totalCompletions = 0;
  double _consistency = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final repo = ref.read(habitRepositoryProvider);
    final habit = await repo.getHabit(widget.habitId);
    if (habit == null) return;

    final entries = await repo.getEntriesForHabit(widget.habitId);
    final completions = entries.where((e) => e.isComplete).length;

    final daysSinceCreation =
        DateTime.now().difference(habit.createdAt).inDays + 1;
    final scheduledDates = List.generate(
      daysSinceCreation,
      (i) => habit.createdAt.add(Duration(days: i)),
    );
    final streakResult = StreakEngine.calculateStreak(
      entries: entries,
      scheduledDates: scheduledDates,
    );

    final consistency = daysSinceCreation > 0
        ? completions / daysSinceCreation
        : 0.0;

    setState(() {
      _habit = habit;
      _entries = entries;
      _currentStreak = streakResult.current;
      _longestStreak = streakResult.longest;
      _totalCompletions = completions;
      _consistency = consistency;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_habit == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final habit = _habit!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined),
            onPressed: () =>
                context.push('/habit-editor?id=${habit.id}'),
          ),
          PopupMenuButton<String>(
            onSelected: (v) async {
              if (v == 'archive') await _archive();
              if (v == 'delete') await _confirmDelete();
            },
            itemBuilder: (ctx) => [
              const PopupMenuItem(
                value: 'archive',
                child: Text('Archive'),
              ),
              const PopupMenuItem(
                value: 'delete',
                child: Text('Delete'),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Hero planet
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Color(habit.color).withOpacity(0.8),
                    Color(habit.color).withOpacity(0.3),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(habit.color).withOpacity(0.25),
                    blurRadius: 32,
                  ),
                ],
              ),
              child: Center(
                child: Text(
                  habit.emoji,
                  style: const TextStyle(fontSize: 48),
                ),
              ),
            )
                .animate()
                .scaleXY(begin: 0.8, end: 1, duration: 400.ms)
                .fadeIn(),

            const SizedBox(height: Spacing.md),
            Text(
              habit.name,
              style: context.textTheme.headlineMedium?.copyWith(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.w700,
              ),
            ),

            // Streak
            if (_currentStreak > 0) ...[
              const SizedBox(height: Spacing.xs),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.local_fire_department,
                      size: 18, color: Color(habit.color)),
                  const SizedBox(width: 4),
                  Text(
                    '$_currentStreak day streak',
                    style: TextStyle(
                      color: Color(habit.color),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: Spacing.xxl),

            // Stats strip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _DetailStat(
                  label: 'Total',
                  value: '$_totalCompletions',
                ),
                _DetailStat(
                  label: 'Best Streak',
                  value: '${_longestStreak}d',
                ),
                _DetailStat(
                  label: 'Consistency',
                  value: '${(_consistency * 100).round()}%',
                ),
              ],
            ),

            const SizedBox(height: Spacing.xxl),

            // 90-day heatmap
            _SectionTitle(title: 'Last 90 Days'),
            const SizedBox(height: Spacing.sm),
            _HeatmapGrid(
              entries: _entries,
              color: Color(habit.color),
              days: 90,
            ),

            // Why card
            if (habit.whyText != null && habit.whyText!.isNotEmpty) ...[
              const SizedBox(height: Spacing.xxl),
              _SectionTitle(title: 'Why'),
              const SizedBox(height: Spacing.sm),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(Spacing.md),
                decoration: BoxDecoration(
                  color: Color(habit.color).withOpacity(0.08),
                  borderRadius: BorderRadius.circular(CornerRadii.md),
                  border: Border.all(
                    color: Color(habit.color).withOpacity(0.15),
                  ),
                ),
                child: Text(
                  habit.whyText!,
                  style: context.textTheme.bodyLarge?.copyWith(
                    fontStyle: FontStyle.italic,
                    color: context.colors.onSurface.withOpacity(0.7),
                  ),
                ),
              ),
            ],

            // Recent entries
            const SizedBox(height: Spacing.xxl),
            _SectionTitle(title: 'Recent'),
            const SizedBox(height: Spacing.sm),
            ..._entries.take(15).map((entry) {
              return Padding(
                padding: const EdgeInsets.only(bottom: Spacing.xs),
                child: Row(
                  children: [
                    Icon(
                      entry.isComplete
                          ? Icons.check_circle
                          : entry.skipReason != null
                              ? Icons.skip_next
                              : Icons.circle_outlined,
                      size: 18,
                      color: entry.isComplete
                          ? Color(habit.color)
                          : context.colors.onSurface.withOpacity(0.3),
                    ),
                    const SizedBox(width: Spacing.sm),
                    Text(
                      '${entry.date.month}/${entry.date.day}',
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontFamily: 'JetBrainsMono',
                      ),
                    ),
                    if (entry.note != null) ...[
                      const SizedBox(width: Spacing.sm),
                      Expanded(
                        child: Text(
                          entry.note!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color:
                                context.colors.onSurface.withOpacity(0.5),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ] else
                      const Spacer(),
                    if (entry.mood != null)
                      Text(
                        ['😔', '😐', '🙂', '😊', '🤩'][entry.mood! - 1],
                        style: const TextStyle(fontSize: 14),
                      ),
                  ],
                ),
              );
            }),

            const SizedBox(height: Spacing.colossal),
          ],
        ),
      ),
    );
  }

  Future<void> _archive() async {
    await ref.read(habitRepositoryProvider).archiveHabit(widget.habitId);
    ref.read(todayProvider.notifier).refresh();
    if (mounted) context.pop();
  }

  Future<void> _confirmDelete() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete habit'),
        content: const Text(
          'This will permanently delete this habit and all its history. This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              'Delete',
              style: TextStyle(color: context.colors.error),
            ),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(habitRepositoryProvider).deleteHabit(widget.habitId);
      ref.read(todayProvider.notifier).refresh();
      if (mounted) context.pop();
    }
  }
}

class _DetailStat extends StatelessWidget {
  const _DetailStat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: context.textTheme.headlineSmall?.copyWith(
            fontFamily: 'JetBrainsMono',
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          label,
          style: context.textTheme.bodySmall?.copyWith(
            color: context.colors.onSurface.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: context.textTheme.titleMedium?.copyWith(
          fontFamily: 'SpaceGrotesk',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _HeatmapGrid extends StatelessWidget {
  const _HeatmapGrid({
    required this.entries,
    required this.color,
    required this.days,
  });

  final List<HabitEntry> entries;
  final Color color;
  final int days;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final completionDates = <String>{};
    for (final entry in entries) {
      if (entry.isComplete) {
        completionDates.add(
          '${entry.date.year}-${entry.date.month}-${entry.date.day}',
        );
      }
    }

    return Wrap(
      spacing: 3,
      runSpacing: 3,
      children: List.generate(days, (i) {
        final date = today.subtract(Duration(days: days - 1 - i));
        final key = '${date.year}-${date.month}-${date.day}';
        final isComplete = completionDates.contains(key);
        final isFuture = date.isAfter(today);

        return Semantics(
          label:
              '${date.month}/${date.day}: ${isComplete ? "completed" : "not completed"}',
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: isFuture
                  ? Colors.transparent
                  : isComplete
                      ? color
                      : color.withOpacity(0.08),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }
}
