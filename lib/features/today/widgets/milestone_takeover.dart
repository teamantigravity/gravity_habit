import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/domain/gravity_engine/streak_engine.dart';
import 'package:lottie/lottie.dart';

/// Full-screen milestone celebration (1.8s total, dismissible on tap).
/// Shown for streaks: 7, 21, 30, 100, 365
class MilestoneTakeover extends StatefulWidget {
  const MilestoneTakeover({
    required this.streakDays,
    required this.habitName,
    required this.color,
    required this.onDismiss,
    super.key,
  });

  final int streakDays;
  final String habitName;
  final Color color;
  final VoidCallback onDismiss;

  @override
  State<MilestoneTakeover> createState() => _MilestoneTakeoverState();
}

class _MilestoneTakeoverState extends State<MilestoneTakeover>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(
          const Duration(milliseconds: 500),
          widget.onDismiss,
        );
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String get _identityStatement {
    return switch (widget.streakDays) {
      7 => 'You are building something real.',
      21 => 'This is becoming who you are.',
      30 => 'Thirty days. This is who you are now.',
      100 => 'One hundred days. Unstoppable.',
      365 => 'A year of light. You became this.',
      _ => 'Your orbit holds.',
    };
  }

  @override
  Widget build(BuildContext context) {
    final milestone = StreakEngine.milestoneForStreak(widget.streakDays);

    return GestureDetector(
      onTap: widget.onDismiss,
      child: Material(
        color: Colors.black.withValues(alpha: 0.85),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Lottie Animation
              SizedBox(
                width: 250,
                height: 250,
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                    widget.color.withValues(alpha: 0.5),
                    BlendMode.srcATop,
                  ),
                  child: Lottie.asset(
                    'assets/lottie/success.json',
                    controller: _controller,
                    onLoaded: (composition) {
                      _controller.duration = composition.duration;
                    },
                  ),
                ),
              ),
              const SizedBox(height: Spacing.xl),

              // Milestone number
              Text(
                '${widget.streakDays}',
                style: TextStyle(
                  fontFamily: 'SpaceGrotesk',
                  fontSize: 96,
                  fontWeight: FontWeight.w700,
                  color: widget.color,
                ),
              )
                  .animate()
                  .fadeIn(delay: 400.ms, duration: 600.ms)
                  .scaleXY(begin: 0.5, end: 1),

              Text(
                milestone?.name ?? 'Milestone',
                style: context.textTheme.headlineSmall?.copyWith(
                  fontFamily: 'SpaceGrotesk',
                  color: Colors.white,
                ),
              ).animate().fadeIn(delay: 800.ms, duration: 400.ms),

              const SizedBox(height: Spacing.md),

              // Identity statement
              Text(
                _identityStatement,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: Colors.white.withValues(alpha: 0.8),
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ).animate().fadeIn(delay: 1200.ms, duration: 400.ms),

              const SizedBox(height: Spacing.xl),

              // Stardust reward
              if (milestone != null)
                Text(
                  '+${milestone.stardustReward} ✨',
                  style: context.textTheme.titleLarge?.copyWith(
                    color: widget.color,
                    fontFamily: 'JetBrainsMono',
                  ),
                ).animate().fadeIn(delay: 1400.ms, duration: 300.ms),
            ],
          ),
        ),
      ),
    );
  }
}
