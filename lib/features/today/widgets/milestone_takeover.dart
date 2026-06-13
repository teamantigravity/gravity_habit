import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/domain/gravity_engine/streak_engine.dart';

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
        color: Colors.black.withOpacity(0.85),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Constellation draws
              SizedBox(
                width: 200,
                height: 200,
                child: CustomPaint(
                  painter: _ConstellationPainter(
                    progress: _controller.value,
                    color: widget.color,
                  ),
                ),
              ),
              const SizedBox(height: Spacing.xxl),

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
                  .scaleXY(begin: 0.5, end: 1.0),

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
                  color: Colors.white.withOpacity(0.8),
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

class _ConstellationPainter extends CustomPainter {
  _ConstellationPainter({
    required this.progress,
    required this.color,
  });

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final random = Random(13);

    // Generate 7 constellation nodes
    final nodes = <Offset>[];
    for (var i = 0; i < 7; i++) {
      final angle = (2 * pi * i / 7) + random.nextDouble() * 0.3;
      final radius = 40.0 + random.nextDouble() * 50.0;
      nodes.add(Offset(
        center.dx + cos(angle) * radius,
        center.dy + sin(angle) * radius,
      ));
    }

    // Draw lines between nodes (progressively)
    final linesToDraw = (progress * 6).floor();
    for (var i = 0; i < linesToDraw && i < nodes.length - 1; i++) {
      final lineProgress =
          ((progress * 6) - i).clamp(0.0, 1.0);
      final from = nodes[i];
      final to = nodes[i + 1];
      final currentEnd = Offset.lerp(from, to, lineProgress)!;

      canvas.drawLine(
        from,
        currentEnd,
        Paint()
          ..color = color.withOpacity(0.5)
          ..strokeWidth = 1.5
          ..strokeCap = StrokeCap.round,
      );
    }

    // Draw star nodes
    final nodesToDraw = (progress * 7).ceil();
    for (var i = 0; i < nodesToDraw && i < nodes.length; i++) {
      final nodeProgress =
          ((progress * 7) - i).clamp(0.0, 1.0);

      // Glow
      canvas.drawCircle(
        nodes[i],
        6 * nodeProgress,
        Paint()
          ..color = color.withOpacity(0.2 * nodeProgress)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8),
      );

      // Star
      canvas.drawCircle(
        nodes[i],
        3 * nodeProgress,
        Paint()..color = color.withOpacity(nodeProgress),
      );
    }
  }

  @override
  bool shouldRepaint(_ConstellationPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
