import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

/// Generates share cards 100% on-device.
/// Formats: 1080×1920 (stories) and 1080×1080 (square).
/// Never auto-shared. Never adds tracking links.
class ShareCardGenerator {
  ShareCardGenerator._();

  static Future<Uint8List> generateStreakCard({
    required String habitName,
    required String emoji,
    required int streakDays,
    required String milestoneName,
    required Color accentColor,
    required Color backgroundColor,
    bool isSquare = false,
  }) async {
    const width = 1080.0;
    final height = isSquare ? 1080.0 : 1920.0;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, width, height));

    // Background
    final bgPaint = Paint()..color = backgroundColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), bgPaint);

    // Gradient overlay
    final gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          accentColor.withValues(alpha: 0.1),
          accentColor.withValues(alpha: 0.02),
        ],
      ).createShader(Rect.fromLTWH(0, 0, width, height));
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), gradientPaint);

    // Orbit rings (decorative)
    final center = Offset(width / 2, height * 0.35);
    for (var i = 1; i <= 3; i++) {
      canvas.drawCircle(
        center,
        80.0 + i * 60.0,
        Paint()
          ..color = accentColor.withValues(alpha: 0.08 + i * 0.02)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5,
      );
    }

    // Core glow
    canvas.drawCircle(
      center,
      40,
      Paint()
        ..shader = RadialGradient(
          colors: [
            accentColor.withValues(alpha: 0.5),
            accentColor.withValues(alpha: 0.1),
            Colors.transparent,
          ],
        ).createShader(Rect.fromCircle(center: center, radius: 80)),
    );

    // Emoji
    _drawText(canvas, emoji, center.translate(-30, -30), 60, Colors.white);

    // Streak number
    _drawText(
      canvas,
      '$streakDays',
      Offset(width / 2 - 80, height * 0.52),
      120,
      accentColor,
      fontWeight: FontWeight.w700,
      fontFamily: 'SpaceGrotesk',
    );

    // "days" label
    _drawText(
      canvas,
      'days',
      Offset(width / 2 - 30, height * 0.58),
      32,
      Colors.white.withValues(alpha: 0.6),
    );

    // Milestone name
    _drawText(
      canvas,
      milestoneName,
      Offset(width / 2 - 100, height * 0.64),
      28,
      Colors.white.withValues(alpha: 0.8),
      fontWeight: FontWeight.w600,
    );

    // Habit name
    _drawText(
      canvas,
      habitName,
      Offset(width / 2 - 100, height * 0.70),
      24,
      Colors.white.withValues(alpha: 0.5),
    );

    // Watermark
    _drawText(
      canvas,
      'Gravity Habit',
      Offset(width - 200, height - 60),
      16,
      Colors.white.withValues(alpha: 0.2),
    );

    // Stars (decorative particles)
    final random = Random(42);
    for (var i = 0; i < 40; i++) {
      final x = random.nextDouble() * width;
      final y = random.nextDouble() * height;
      final size = 1.0 + random.nextDouble() * 2;
      canvas.drawCircle(
        Offset(x, y),
        size,
        Paint()
          ..color =
              Colors.white.withValues(alpha: 0.1 + random.nextDouble() * 0.2),
      );
    }

    final picture = recorder.endRecording();
    final image = await picture.toImage(width.toInt(), height.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  static Future<Uint8List> generateTierCard({
    required int tier,
    required String tierName,
    required String eraName,
    required Color accentColor,
    required Color backgroundColor,
    bool isSquare = false,
  }) async {
    const width = 1080.0;
    final height = isSquare ? 1080.0 : 1920.0;

    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder, Rect.fromLTWH(0, 0, width, height));

    final bgPaint = Paint()..color = backgroundColor;
    canvas.drawRect(Rect.fromLTWH(0, 0, width, height), bgPaint);



    // Tier number
    _drawText(
      canvas,
      'TIER',
      Offset(width / 2 - 40, height * 0.28),
      20,
      accentColor.withValues(alpha: 0.6),
      fontWeight: FontWeight.w600,
    );

    _drawText(
      canvas,
      '$tier',
      Offset(width / 2 - 60, height * 0.32),
      96,
      accentColor,
      fontWeight: FontWeight.w700,
      fontFamily: 'SpaceGrotesk',
    );

    _drawText(
      canvas,
      tierName,
      Offset(width / 2 - 120, height * 0.50),
      36,
      Colors.white,
      fontWeight: FontWeight.w600,
    );

    _drawText(
      canvas,
      eraName,
      Offset(width / 2 - 60, height * 0.56),
      20,
      Colors.white.withValues(alpha: 0.5),
    );

    _drawText(
      canvas,
      'Gravity Habit',
      Offset(width - 200, height - 60),
      16,
      Colors.white.withValues(alpha: 0.2),
    );

    final picture = recorder.endRecording();
    final image = await picture.toImage(width.toInt(), height.toInt());
    final byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }

  static void _drawText(
    Canvas canvas,
    String text,
    Offset position,
    double fontSize,
    Color color, {
    FontWeight fontWeight = FontWeight.w400,
    String fontFamily = 'Inter',
  }) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontFamily: fontFamily,
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, position);
  }
}
