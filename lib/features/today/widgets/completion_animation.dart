// lib/features/today/widgets/completion_animation.dart
// COMPLETE CORRECTED FILE

import 'dart:math';

import 'package:flutter/material.dart';

class CompletionAnimation extends StatefulWidget {
  const CompletionAnimation({
    required this.color,
    required this.onComplete,
    super.key,
  });

  final Color color;
  final VoidCallback onComplete;

  @override
  State<CompletionAnimation> createState() => _CompletionAnimationState();
}

class _CompletionAnimationState extends State<CompletionAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(
          const Duration(milliseconds: 200),
          widget.onComplete,
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_controller.value > 0.25) {
          widget.onComplete();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return CustomPaint(
            painter: _CompletionPainter(
              progress: _controller.value,
              color: widget.color,
            ),
            size: MediaQuery.of(context).size,
          );
        },
      ),
    );
  }
}

class _CompletionPainter extends CustomPainter {
  _CompletionPainter({
    required this.progress,
    required this.color,
  });

  final double progress;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final random = Random(42);

    if (progress < 0.1) {
      final scale = 1.0 - (progress / 0.1) * 0.06;
      _drawRing(canvas, center, 60 * scale, 0, color.withValues(alpha: 0.3));
      return;
    }

    if (progress < 0.25) {
      final fillProgress = (progress - 0.1) / 0.15;
      _drawRing(canvas, center, 60 * 0.94, fillProgress, color);
      return;
    }

    final snapProgress = progress < 0.35 ? (progress - 0.25) / 0.1 : 1.0;
    final ringScale = progress < 0.35
        ? 0.94 + snapProgress * 0.12
        : 1.06 - (progress - 0.35) * 0.1;

    _drawRing(
      canvas,
      center,
      60 * ringScale.clamp(0.95, 1.06),
      1,
      color,
    );

    if (progress > 0.25) {
      final particleProgress = ((progress - 0.25) / 0.5).clamp(0.0, 1.0);
      const particleCount = 18;

      for (var i = 0; i < particleCount; i++) {
        final angle = (2 * pi * i / particleCount) + random.nextDouble() * 0.3;
        final speed = 0.6 + random.nextDouble() * 0.4;
        final distance = 100 * particleProgress * speed;
        final gravityY = particleProgress * particleProgress * 20;

        final px = center.dx + cos(angle) * distance;
        final py = center.dy + sin(angle) * distance + gravityY;

        final opacity = (1.0 - particleProgress).clamp(0.0, 1.0);
        final particleSize =
            (3.0 + random.nextDouble() * 2) * (1.0 - particleProgress * 0.5);

        final paint = Paint()
          ..color = color.withValues(alpha: opacity * 0.8)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, particleSize * 0.5);

        canvas.drawCircle(Offset(px, py), particleSize, paint);
      }
    }

    if (progress > 0.35 && progress < 0.7) {
      final glowProgress = ((progress - 0.35) / 0.3).clamp(0.0, 1.0);
      final glowRadius = 80 + glowProgress * 40;
      final glowOpacity = 0.2 * (1.0 - glowProgress);

      final glowPaint = Paint()
        ..color = color.withValues(alpha: glowOpacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 32);
      canvas.drawCircle(center, glowRadius, glowPaint);
    }

    if (progress > 0.625 && progress < 0.95) {
      final textProgress = ((progress - 0.625) / 0.25).clamp(0.0, 1.0);
      final textOpacity = (1.0 - textProgress).clamp(0.0, 1.0);
      final textY = center.dy - 80 - textProgress * 60;

      final textPainter = TextPainter(
        text: TextSpan(
          text: '+\u2728',
          style: TextStyle(
            fontSize: 20,
            color: color.withValues(alpha: textOpacity),
            fontWeight: FontWeight.w600,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();

      textPainter.paint(
        canvas,
        Offset(center.dx - textPainter.width / 2, textY),
      );
    }
  }

  void _drawRing(
    Canvas canvas,
    Offset center,
    double radius,
    double fillProgress,
    Color ringColor,
  ) {
    final trackPaint = Paint()
      ..color = ringColor.withValues(alpha: 0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeCap = StrokeCap.round;
    canvas.drawCircle(center, radius, trackPaint);

    if (fillProgress > 0) {
      final fillPaint = Paint()
        ..color = ringColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..strokeCap = StrokeCap.round;
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        -pi / 2,
        2 * pi * fillProgress,
        false,
        fillPaint,
      );
    }
  }

  @override
  bool shouldRepaint(_CompletionPainter oldDelegate) =>
      oldDelegate.progress != progress;
}
