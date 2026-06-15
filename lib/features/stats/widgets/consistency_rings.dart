import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';

class ConsistencyRings extends StatelessWidget {
  const ConsistencyRings({
    required this.today,
    required this.week,
    required this.month,
    super.key,
  });

  final double today;
  final double week;
  final double month;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Center(
        child: CustomPaint(
          size: const Size(160, 160),
          painter: _RingsPainter(
            today: today,
            week: week,
            month: month,
            accentColor: context.colors.primary,
            textColor: context.colors.onSurface,
            trackColor: context.colors.outlineVariant.withValues(alpha: 0.15),
          ),
        ),
      ),
    );
  }
}

class _RingsPainter extends CustomPainter {
  _RingsPainter({
    required this.today,
    required this.week,
    required this.month,
    required this.accentColor,
    required this.textColor,
    required this.trackColor,
  });

  final double today;
  final double week;
  final double month;
  final Color accentColor;
  final Color textColor;
  final Color trackColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    const strokeWidth = 10.0;
    const gap = 6.0;

    final rings = [
      (radius: 70.0, value: today, label: 'T', color: accentColor),
      (
        radius: 70.0 - strokeWidth - gap,
        value: week,
        label: 'W',
        color: accentColor.withValues(alpha: 0.7)
      ),
      (
        radius: 70.0 - (strokeWidth + gap) * 2,
        value: month,
        label: 'M',
        color: accentColor.withValues(alpha: 0.45)
      ),
    ];

    for (final ring in rings) {
      // Track
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: ring.radius),
        -pi / 2,
        2 * pi,
        false,
        Paint()
          ..color = trackColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round,
      );

      // Progress
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: ring.radius),
        -pi / 2,
        2 * pi * ring.value.clamp(0.0, 1.0),
        false,
        Paint()
          ..color = ring.color
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidth
          ..strokeCap = StrokeCap.round,
      );
    }

    // Center text
    final pct = (today * 100).round();
    final tp = TextPainter(
      text: TextSpan(
        text: '$pct%',
        style: TextStyle(
          fontFamily: 'JetBrainsMono',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(
        canvas, Offset(center.dx - tp.width / 2, center.dy - tp.height / 2));
  }

  @override
  bool shouldRepaint(_RingsPainter old) =>
      old.today != today || old.week != week || old.month != month;
}
