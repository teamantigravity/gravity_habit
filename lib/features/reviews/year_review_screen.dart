// lib/features/reviews/year_review_screen.dart
// COMPLETE CORRECTED FILE — removed duplicate AnimatedBuilder

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/repositories/habit_repository.dart';
import 'package:gravity_habit/data/repositories/orbit_repository.dart';
import 'package:gravity_habit/ui/widgets/cosmic_button.dart';

class YearReviewScreen extends ConsumerStatefulWidget {
  const YearReviewScreen({required this.yearNumber, super.key});

  final int yearNumber;

  @override
  ConsumerState<YearReviewScreen> createState() => _YearReviewScreenState();
}

class _YearReviewScreenState extends ConsumerState<YearReviewScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  int _totalCompletions = 0;
  int _totalDaysActive = 0;
  int _longestStreak = 0;
  double _totalMass = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..forward();
    _load();
  }

  Future<void> _load() async {
    final habitRepo = ref.read(habitRepositoryProvider);
    final orbitRepo = ref.read(orbitRepositoryProvider);
    final profile = await orbitRepo.getProfile();
    final habits = await habitRepo.getAllHabits(includeArchived: true);

    var completions = 0;
    final activeDays = <String>{};

    for (final habit in habits) {
      final entries = await habitRepo.getEntriesForHabit(habit.id);
      for (final e in entries.where((e) => e.isComplete)) {
        completions++;
        activeDays.add('${e.date.year}-${e.date.month}-${e.date.day}');
      }
    }

    await orbitRepo.addStardust(
        1000, 'year_review', 'year_${widget.yearNumber}');

    if (mounted) {
      setState(() {
        _totalCompletions = completions;
        _totalDaysActive = activeDays.length;
        _longestStreak = profile.longestStreak;
        _totalMass = profile.totalMass;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0B1E),
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final progress = _controller.value;
            return Stack(
              children: [
                if (progress < 0.2)
                  Center(
                    child: Opacity(
                      opacity: (progress / 0.15).clamp(0.0, 1.0),
                      child: Text(
                        'Year ${widget.yearNumber}',
                        style: const TextStyle(
                          fontFamily: 'SpaceGrotesk',
                          fontSize: 64,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                if (progress >= 0.15 && progress < 0.75)
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _AnimatedStat(
                          value: '$_totalCompletions',
                          label: 'Total Completions',
                          visible: progress > 0.2,
                        ),
                        const SizedBox(height: Spacing.xl),
                        _AnimatedStat(
                          value: '$_totalDaysActive',
                          label: 'Days Active',
                          visible: progress > 0.3,
                        ),
                        const SizedBox(height: Spacing.xl),
                        _AnimatedStat(
                          value: '${_longestStreak}d',
                          label: 'Longest Streak',
                          visible: progress > 0.4,
                        ),
                        const SizedBox(height: Spacing.xl),
                        _AnimatedStat(
                          value: '${_totalMass.round()}',
                          label: 'Total Mass',
                          visible: progress > 0.5,
                        ),
                      ],
                    ),
                  ),
                if (progress >= 0.7)
                  Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Year ${widget.yearNumber} Voyager',
                          style: TextStyle(
                            fontFamily: 'SpaceGrotesk',
                            fontSize: 36,
                            fontWeight: FontWeight.w700,
                            color: context.colors.primary,
                          ),
                        ),
                        const SizedBox(height: Spacing.md),
                        Text(
                          '+1000 \u2728',
                          style: TextStyle(
                            fontFamily: 'JetBrainsMono',
                            fontSize: 28,
                            color: context.colors.primary.withOpacity(0.8),
                          ),
                        ),
                        const SizedBox(height: Spacing.xxl),
                        if (progress > 0.85)
                          CosmicButton(
                            label: 'Continue your journey',
                            onPressed: () => Navigator.pop(context),
                          ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _AnimatedStat extends StatelessWidget {
  const _AnimatedStat({
    required this.value,
    required this.label,
    required this.visible,
  });

  final String value;
  final String label;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 600),
      child: AnimatedSlide(
        offset: visible ? Offset.zero : const Offset(0, 0.2),
        duration: const Duration(milliseconds: 600),
        curve: const Cubic(0.16, 1, 0.3, 1),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontFamily: 'JetBrainsMono',
                fontSize: 48,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
