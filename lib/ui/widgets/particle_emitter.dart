// lib/ui/widgets/particle_emitter.dart
// COMPLETE CORRECTED FILE

import 'dart:math';

import 'package:flutter/material.dart';

class ParticleEmitter extends StatefulWidget {
  const ParticleEmitter({
    required this.color,
    this.particleCount = 16,
    this.duration = const Duration(milliseconds: 700),
    this.maxRadius = 120,
    this.emitting = false,
    super.key,
  });

  final Color color;
  final int particleCount;
  final Duration duration;
  final double maxRadius;
  final bool emitting;

  @override
  State<ParticleEmitter> createState() => _ParticleEmitterState();
}

class _ParticleEmitterState extends State<ParticleEmitter>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late List<_Particle> _particles;
  final _random = Random();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _generateParticles();
    if (widget.emitting) _controller.forward();
  }

  void _generateParticles() {
    _particles = List.generate(widget.particleCount, (_) {
      final angle = _random.nextDouble() * 2 * pi;
      final speed = 0.5 + _random.nextDouble() * 0.5;
      final size = 2.0 + _random.nextDouble() * 3.0;
      return _Particle(angle: angle, speed: speed, size: size);
    });
  }

  @override
  void didUpdateWidget(ParticleEmitter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.emitting && !oldWidget.emitting) {
      _generateParticles();
      _controller.forward(from: 0);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _ParticlePainter(
            particles: _particles,
            progress: _controller.value,
            color: widget.color,
            maxRadius: widget.maxRadius,
          ),
          size: Size(widget.maxRadius * 2, widget.maxRadius * 2),
        );
      },
    );
  }
}

class _Particle {
  _Particle({
    required this.angle,
    required this.speed,
    required this.size,
  });

  final double angle;
  final double speed;
  final double size;
}

class _ParticlePainter extends CustomPainter {
  _ParticlePainter({
    required this.particles,
    required this.progress,
    required this.color,
    required this.maxRadius,
  });

  final List<_Particle> particles;
  final double progress;
  final Color color;
  final double maxRadius;

  @override
  void paint(Canvas canvas, Size size) {
    if (progress <= 0 || progress >= 1) return;

    final center = Offset(size.width / 2, size.height / 2);
    final opacity = (1.0 - progress).clamp(0.0, 1.0);

    for (final particle in particles) {
      final distance = maxRadius * progress * particle.speed;
      final gravityOffset = sin(progress * pi) * 10;
      final actualDistance = distance - gravityOffset * 0.3;

      final x = center.dx + cos(particle.angle) * actualDistance;
      final y = center.dy + sin(particle.angle) * actualDistance;

      final paint = Paint()
        ..color = color.withOpacity(opacity * 0.8)
        ..maskFilter = MaskFilter.blur(
          BlurStyle.normal,
          particle.size * 0.5,
        );

      canvas.drawCircle(
        Offset(x, y),
        particle.size * (1.0 - progress * 0.5),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_ParticlePainter oldDelegate) =>
      oldDelegate.progress != progress;
}
