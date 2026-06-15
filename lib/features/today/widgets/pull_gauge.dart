import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';

class PullGauge extends StatelessWidget {
  const PullGauge({
    required this.pull,
    this.size = 56,
    super.key,
  });

  final double pull;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: "Today's pull: ${pull.round()} percent",
      child: SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _PullGaugePainter(
            pull: pull,
            accentColor: context.colors.primary,
            trackColor: context.colors.outlineVariant.withValues(alpha: 0.2),
            textColor: context.colors.onSurface,
          ),
        ),
      ),
    );
  }
}

class _PullGaugePainter extends CustomPainter {
  _PullGaugePainter({
    required this.pull,
    required this.accentColor,
    required this.trackColor,
    required this.textColor,
  });

  final double pull;
  final Color accentColor;
  final Color trackColor;
  final Color textColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 4;
    const startAngle = pi * 0.75; // 135°
    const sweepTotal = pi * 1.5; // 270°

    // Track
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepTotal,
      false,
      trackPaint,
    );

    // Fill
    final fraction = (pull / 100.0).clamp(0.0, 1.0);
    final fillPaint = Paint()
      ..color = accentColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepTotal * fraction,
      false,
      fillPaint,
    );

    // Text
    final text = TextPainter(
      text: TextSpan(
        text: '${pull.round()}',
        style: TextStyle(
          fontFamily: 'JetBrainsMono',
          fontSize: size.width * 0.28,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    text.paint(
      canvas,
      Offset(
        center.dx - text.width / 2,
        center.dy - text.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(_PullGaugePainter oldDelegate) => oldDelegate.pull != pull;
}
