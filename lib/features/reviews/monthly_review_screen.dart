import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/repositories/habit_repository.dart';
import 'package:gravity_habit/data/repositories/orbit_repository.dart';
import 'package:gravity_habit/ui/widgets/cosmic_button.dart';

class MonthlyReviewScreen extends ConsumerStatefulWidget {
  const MonthlyReviewScreen({super.key});

  @override
  ConsumerState<MonthlyReviewScreen> createState() =>
      _MonthlyReviewScreenState();
}

class _MonthlyReviewScreenState extends ConsumerState<MonthlyReviewScreen> {
  int _totalCompletions = 0;
  int _daysActive = 0;
  double _consistency = 0;
  int _tiersGained = 0;
  int _newAchievements = 0;
  int _stardustEarned = 0;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final habitRepo = ref.read(habitRepositoryProvider);
    final orbitRepo = ref.read(orbitRepositoryProvider);
    final habits = await habitRepo.getAllHabits();
    final now = DateTime.now();
    final monthStart = DateTime(now.year, now.month - 1, now.day);

    var completions = 0;
    final activeDays = <int>{};

    for (final habit in habits) {
      final entries = await habitRepo.getEntriesForHabit(
        habit.id,
        from: monthStart,
        to: now,
      );
      for (final e in entries.where((e) => e.isComplete)) {
        completions++;
        activeDays.add(e.date.day);
      }
    }

    final totalDays = now.difference(monthStart).inDays;
    final consistency = totalDays > 0 ? activeDays.length / totalDays : 0.0;

    final earned = consistency > 0.7 ? 200 : 0;
    if (earned > 0) {
      await orbitRepo.addStardust(earned, 'monthly_review');
    }

    setState(() {
      _totalCompletions = completions;
      _daysActive = activeDays.length;
      _consistency = consistency;
      _stardustEarned = earned;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.xxl),
          child: Column(
            children: [
              const Spacer(),

              Text(
                'Your Month',
                style: context.textTheme.displaySmall?.copyWith(
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.w700,
                ),
              ).animate().fadeIn(duration: 400.ms),

              const SizedBox(height: Spacing.xxl),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _MonthStat(value: '$_totalCompletions', label: 'Completions'),
                  _MonthStat(value: '$_daysActive', label: 'Days Active'),
                  _MonthStat(
                    value: '${(_consistency * 100).round()}%',
                    label: 'Consistency',
                  ),
                ],
              ).animate().fadeIn(delay: 300.ms, duration: 400.ms),

              const SizedBox(height: Spacing.xxl),

              if (_stardustEarned > 0)
                Text(
                  '+$_stardustEarned ✨',
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: context.colors.primary,
                    fontFamily: 'JetBrainsMono',
                  ),
                ).animate().fadeIn(delay: 600.ms, duration: 400.ms),

              if (_consistency > 0.7)
                Padding(
                  padding: const EdgeInsets.only(top: Spacing.sm),
                  child: Text(
                    'Above 70% consistency \u2014 Stardust earned.',
                    style: context.textTheme.bodyMedium?.copyWith(
                      color: context.colors.onSurface.withOpacity(0.5),
                    ),
                  ),
                ),

              const Spacer(flex: 2),

              CosmicButton(
                label: 'Continue',
                isExpanded: true,
                onPressed: () => Navigator.pop(context),
              ),

              const SizedBox(height: Spacing.xl),
            ],
          ),
        ),
      ),
    );
  }
}

class _MonthStat extends StatelessWidget {
  const _MonthStat({required this.value, required this.label});
  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: context.textTheme.headlineMedium?.copyWith(
            fontFamily: 'JetBrainsMono',
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(label, style: context.textTheme.bodySmall?.copyWith(
          color: context.colors.onSurface.withOpacity(0.5),
        )),
      ],
    );
  }
}
