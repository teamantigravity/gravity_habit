// lib/ui/widgets/cosmic_button.dart
// COMPLETE CORRECTED FILE

import 'package:flutter/material.dart';
import 'package:gravity_habit/core/constants/gravity_curves.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';

class CosmicButton extends StatefulWidget {
  const CosmicButton({
    required this.label,
    required this.onPressed,
    this.icon,
    this.isPrimary = true,
    this.isExpanded = false,
    super.key,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool isPrimary;
  final bool isExpanded;

  @override
  State<CosmicButton> createState() => _CosmicButtonState();
}

class _CosmicButtonState extends State<CosmicButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: GravityDurations.micro,
    );
    _scale = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: GravityCurves.gravityIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.isPrimary
        ? context.colors.primary
        : context.colors.surface;
    final fgColor = widget.isPrimary
        ? context.colors.onPrimary
        : context.colors.onSurface;

    return AnimatedBuilder(
      animation: _scale,
      builder: (context, child) {
        return Transform.scale(
          scale: _scale.value,
          child: child,
        );
      },
      child: GestureDetector(
        onTapDown: (_) => _controller.forward(),
        onTapUp: (_) {
          _controller.reverse();
          widget.onPressed?.call();
        },
        onTapCancel: () => _controller.reverse(),
        child: Semantics(
          button: true,
          label: widget.label,
          child: Container(
            width: widget.isExpanded ? double.infinity : null,
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.xl,
              vertical: Spacing.md,
            ),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(CornerRadii.xl),
              boxShadow: widget.isPrimary
                  ? [
                      BoxShadow(
                        color: context.colors.primary.withOpacity(0.24),
                        blurRadius: 24,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
              border: widget.isPrimary
                  ? null
                  : Border.all(
                      color: context.colors.outlineVariant,
                    ),
            ),
            child: Row(
              mainAxisSize:
                  widget.isExpanded ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.icon != null) ...[
                  Icon(widget.icon, color: fgColor, size: 20),
                  const SizedBox(width: Spacing.xs),
                ],
                Text(
                  widget.label,
                  style: context.textTheme.labelLarge?.copyWith(
                    color: fgColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
