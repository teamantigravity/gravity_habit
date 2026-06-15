import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';

class GlassPanel extends StatelessWidget {
  const GlassPanel({
    required this.child,
    this.padding = const EdgeInsets.all(Spacing.md),
    this.borderRadius = CornerRadii.md,
    this.blur = 28,
    this.opacity = 0.12,
    super.key,
  });

  final Widget child;
  final EdgeInsets padding;
  final double borderRadius;
  final double blur;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: context.colors.surface.withValues(alpha: opacity),
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color: context.colors.outlineVariant.withValues(alpha: 0.15),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
