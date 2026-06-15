// lib/features/today/widgets/orbit_canvas.dart
// COMPLETE CORRECTED FILE

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';
import 'package:gravity_habit/domain/entities/habit.dart';

class OrbitCanvas extends StatefulWidget {
  const OrbitCanvas({
    required this.habits,
    required this.entries,
    required this.longestStreak,
    required this.onHabitTap,
    super.key,
  });

  final List<Habit> habits;
  final List<HabitEntry> entries;
  final int longestStreak;
  final ValueChanged<Habit> onHabitTap;

  @override
  State<OrbitCanvas> createState() => _OrbitCanvasState();
}

class _OrbitCanvasState extends State<OrbitCanvas>
    with SingleTickerProviderStateMixin {
  late final AnimationController _orbitController;

  @override
  void initState() {
    super.initState();
    _orbitController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 24),
    )..repeat();
  }

  @override
  void dispose() {
    _orbitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.habits.isEmpty) {
      return const SizedBox.shrink();
    }

    return Semantics(
      label:
          'Orbit view showing ${widget.habits.length} habits as orbiting planets',
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GestureDetector(
            onTapDown: (details) => _handleTap(details, constraints.biggest),
            child: AnimatedBuilder(
              animation: _orbitController,
              builder: (context, child) {
                return CustomPaint(
                  size: constraints.biggest,
                  painter: _OrbitPainter(
                    habits: widget.habits,
                    entries: widget.entries,
                    longestStreak: widget.longestStreak,
                    animationValue: _orbitController.value,
                    accentColor: context.colors.primary,
                    surfaceColor: context.colors.onSurface,
                    isDark: context.isDark,
                    reduceMotion: context.isReduceMotion,
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  void _handleTap(TapDownDetails details, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final tapPos = details.localPosition;
    final maxRadius = min(size.width, size.height) * 0.42;

    for (var i = 0; i < widget.habits.length; i++) {
      final habit = widget.habits[i];
      final orbitRadius = _orbitRadiusForIndex(
        i,
        widget.habits.length,
        maxRadius,
      );

      final baseAngle = 2 * pi * i / widget.habits.length;
      final speedMultiplier = 1.0 + (1.0 - (orbitRadius / maxRadius)) * 2.0;
      final angle =
          baseAngle + _orbitController.value * 2 * pi * speedMultiplier;

      final planetX = center.dx + cos(angle) * orbitRadius;
      final planetY = center.dy + sin(angle) * orbitRadius;
      final planetPos = Offset(planetX, planetY);

      final distance = (tapPos - planetPos).distance;
      final planetRadius = _planetRadiusForGravity(habit.gravityClass);

      if (distance <= planetRadius + 20) {
        widget.onHabitTap(habit);
        return;
      }
    }
  }

  static double _orbitRadiusForIndex(int index, int total, double maxRadius) {
    if (total == 1) return maxRadius * 0.5;
    final fraction = (index + 1) / (total + 1);
    return maxRadius * 0.25 + fraction * maxRadius * 0.55;
  }

  static double _planetRadiusForGravity(GravityClass gravityClass) {
    return switch (gravityClass) {
      GravityClass.feather => 8.0,
      GravityClass.pebble => 12.0,
      GravityClass.stone => 16.0,
      GravityClass.boulder => 22.0,
      GravityClass.planet => 28.0,
    };
  }
}

class _OrbitPainter extends CustomPainter {
  _OrbitPainter({
    required this.habits,
    required this.entries,
    required this.longestStreak,
    required this.animationValue,
    required this.accentColor,
    required this.surfaceColor,
    required this.isDark,
    required this.reduceMotion,
  });

  final List<Habit> habits;
  final List<HabitEntry> entries;
  final int longestStreak;
  final double animationValue;
  final Color accentColor;
  final Color surfaceColor;
  final bool isDark;
  final bool reduceMotion;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = min(size.width, size.height) * 0.42;

    _drawCore(canvas, center);

    for (var i = 0; i < habits.length; i++) {
      final habit = habits[i];
      final isComplete = entries.any(
        (e) => e.habitId == habit.id && e.isComplete,
      );

      final orbitRadius =
          _OrbitCanvasState._orbitRadiusForIndex(i, habits.length, maxRadius);

      // Orbit ring
      final ringPaint = Paint()
        ..color = (isComplete ? accentColor : surfaceColor).withValues(
          alpha: isComplete ? 0.2 : 0.08,
        )
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;
      canvas.drawCircle(center, orbitRadius, ringPaint);

      // Planet position
      final baseAngle = 2 * pi * i / habits.length;
      final speedMultiplier = 1.0 + (1.0 - (orbitRadius / maxRadius)) * 2.0;
      final angle = reduceMotion
          ? baseAngle
          : baseAngle + animationValue * 2 * pi * speedMultiplier;

      final planetX = center.dx + cos(angle) * orbitRadius;
      final planetY = center.dy + sin(angle) * orbitRadius;
      final planetCenter = Offset(planetX, planetY);
      final planetRadius =
          _OrbitCanvasState._planetRadiusForGravity(habit.gravityClass);

      // Glow if complete
      if (isComplete) {
        final glowPaint = Paint()
          ..color = Color(habit.color).withValues(alpha: 0.25)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 16);
        canvas.drawCircle(planetCenter, planetRadius + 8, glowPaint);
      }

      // Planet body
      final planetPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            Color(habit.color).withValues(alpha: isComplete ? 1.0 : 0.5),
            Color(habit.color).withValues(alpha: isComplete ? 0.7 : 0.3),
          ],
        ).createShader(
          Rect.fromCircle(center: planetCenter, radius: planetRadius),
        );
      canvas.drawCircle(planetCenter, planetRadius, planetPaint);

      // Emoji
      final textPainter = TextPainter(
        text: TextSpan(
          text: habit.emoji,
          style: TextStyle(fontSize: planetRadius * 1.0),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(
          planetCenter.dx - textPainter.width / 2,
          planetCenter.dy - textPainter.height / 2,
        ),
      );
    }
  }

  void _drawCore(Canvas canvas, Offset center) {
    final coreRadius = 12.0 + (longestStreak.clamp(0, 365) / 365.0) * 20.0;

    final glowPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          accentColor.withValues(alpha: 0.4),
          accentColor.withValues(alpha: 0.1),
          accentColor.withValues(alpha: 0),
        ],
        stops: const [0.0, 0.5, 1.0],
      ).createShader(
        Rect.fromCircle(center: center, radius: coreRadius * 3),
      );
    canvas.drawCircle(center, coreRadius * 3, glowPaint);

    final pulseScale = 1.0 + sin(animationValue * 2 * pi * 0.5) * 0.05;
    final corePaint = Paint()
      ..shader = RadialGradient(
        colors: [
          accentColor.withValues(alpha: 0.9),
          accentColor.withValues(alpha: 0.5),
        ],
      ).createShader(
        Rect.fromCircle(
          center: center,
          radius: coreRadius * (reduceMotion ? 1.0 : pulseScale),
        ),
      );
    canvas.drawCircle(
      center,
      coreRadius * (reduceMotion ? 1.0 : pulseScale),
      corePaint,
    );
  }

  @override
  bool shouldRepaint(_OrbitPainter oldDelegate) => true;
}
