import 'package:flutter/physics.dart';
import 'package:flutter/widgets.dart';

/// Custom animation curves for the Cosmos design system.
class GravityCurves {
  GravityCurves._();

  /// For elements entering the view — fast start, gentle settle.
  static const gravityIn = Cubic(0.16, 1, 0.3, 1);

  /// For elements exiting — slow start, fast exit.
  static const gravityOut = Cubic(0.7, 0, 0.84, 0);

  /// For orbital/looping motions — ease in and out symmetrically.
  static const orbital = Cubic(0.45, 0, 0.55, 1);

  /// Light bounce for UI feedback.
  static const bounceLight = _SpringCurve(
    mass: 1,
    stiffness: 180,
    damping: 14,
  );

  /// Celebratory bounce for milestones.
  static const bounceCelebrate = _SpringCurve(
    mass: 1,
    stiffness: 260,
    damping: 11,
  );
}

class _SpringCurve extends Curve {
  const _SpringCurve({
    required this.mass,
    required this.stiffness,
    required this.damping,
  });

  final double mass;
  final double stiffness;
  final double damping;

  @override
  double transformInternal(double t) {
    final simulation = SpringSimulation(
      SpringDescription(
        mass: mass,
        stiffness: stiffness,
        damping: damping,
      ),
      0,
      1,
      0,
    );
    return simulation.x(t);
  }
}

/// Standard durations from the spec.
class GravityDurations {
  GravityDurations._();

  static const micro = Duration(milliseconds: 120);
  static const standard = Duration(milliseconds: 240);
  static const emphasized = Duration(milliseconds: 380);
  static const celebratory = Duration(milliseconds: 700);
  static const ambient = Duration(seconds: 12);
}
