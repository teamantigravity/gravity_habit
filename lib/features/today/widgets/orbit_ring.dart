import 'dart:math';

import 'package:flutter/material.dart';

/// Reusable orbit ring widget used for habit progress display.
class OrbitRing extends StatelessWidget {
  const OrbitRing({
    required this.progress,
    required this.color,
    this.size = 48,
    this.strokeWidth = 3,
    this.child,
    super.key,
  });

  final double progress; // 0.0 to 1.0
  final Color color;
  final double size;
  final double strokeWidth;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CustomPaint(
        painter: _OrbitRingPainter(
          progress: progress,
          color: color,
          strokeWidth: strokeWidth,
        ),
        child: child != null
            ? Center(child: child)
            : null,
      ),
    );
  }
}

class _OrbitRingPainter extends CustomPainter {
  _OrbitRingPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  final double progress;
  final Color color;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - strokeWidth;

    // Track
    final trackPaint = Paint()
      ..color = color.withOpacity(0.12)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, trackPaint);

    // Progress arc
    if (progress > 0) {
      final progressPaint = Paint()
        ..color = color
        ..style = PaintingStyle.stroke
        ..strokeWidth = strokeWidth
        ..strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        2 * pi * progress.clamp(0.0, 1.0),
        false,
        progressPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_OrbitRingPainter oldDelegate) =>
      oldDelegate.progress != progress || oldDelegate.color != color;
}
