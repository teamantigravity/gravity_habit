import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/ui/widgets/cosmic_button.dart';

class EmptyCosmos extends StatelessWidget {
  const EmptyCosmos({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Lone astronaut (particle scene)
            SizedBox(
              width: 160,
              height: 160,
              child: CustomPaint(
                painter: _AstronautPainter(
                  accentColor: context.colors.primary,
                ),
              ),
            )
                .animate(onPlay: (c) => c.repeat(reverse: true))
                .moveY(
                  begin: -4,
                  end: 4,
                  duration: 4.seconds,
                  curve: Curves.easeInOut,
                ),
            const SizedBox(height: Spacing.xxl),
            Text(
              'Your cosmos is waiting',
              style: context.textTheme.headlineSmall?.copyWith(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
            const SizedBox(height: Spacing.sm),
            Text(
              'Add a single small thing.',
              style: context.textTheme.bodyLarge?.copyWith(
                color: context.colors.onSurface.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
            const SizedBox(height: Spacing.xxl),
            CosmicButton(
              label: 'Add your first habit',
              icon: Icons.add_rounded,
              onPressed: () => context.push('/habit-editor'),
            ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
          ],
        ),
      ),
    );
  }
}

class _AstronautPainter extends CustomPainter {
  _AstronautPainter({required this.accentColor});

  final Color accentColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final random = Random(7);

    // Background stars
    for (var i = 0; i < 30; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final starSize = 1.0 + random.nextDouble() * 1.5;
      final opacity = 0.2 + random.nextDouble() * 0.4;

      canvas.drawCircle(
        Offset(x, y),
        starSize,
        Paint()..color = Colors.white.withOpacity(opacity),
      );
    }

    // Astronaut helmet (circle)
    final helmetPaint = Paint()
      ..color = accentColor.withOpacity(0.15)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, 24, helmetPaint);

    final helmetOutline = Paint()
      ..color = accentColor.withOpacity(0.4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;
    canvas.drawCircle(center, 24, helmetOutline);

    // Visor
    final visorPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          accentColor.withOpacity(0.5),
          accentColor.withOpacity(0.2),
        ],
      ).createShader(
        Rect.fromCircle(center: center, radius: 16),
      );
    canvas.drawCircle(center, 16, visorPaint);

    // Body
    final bodyPath = Path()
      ..moveTo(center.dx - 20, center.dy + 24)
      ..lineTo(center.dx - 14, center.dy + 50)
      ..lineTo(center.dx + 14, center.dy + 50)
      ..lineTo(center.dx + 20, center.dy + 24)
      ..close();

    canvas.drawPath(
      bodyPath,
      Paint()..color = accentColor.withOpacity(0.1),
    );
    canvas.drawPath(
      bodyPath,
      Paint()
        ..color = accentColor.withOpacity(0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
