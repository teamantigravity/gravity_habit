import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/ui/widgets/rolling_number.dart';

class StardustCounter extends StatelessWidget {
  const StardustCounter({
    required this.count,
    this.showAura = true,
    this.size = StardustSize.normal,
    super.key,
  });

  final int count;
  final bool showAura;
  final StardustSize size;

  @override
  Widget build(BuildContext context) {
    final iconSize = switch (size) {
      StardustSize.small => 14.0,
      StardustSize.normal => 18.0,
      StardustSize.large => 24.0,
    };

    final fontSize = switch (size) {
      StardustSize.small => 12.0,
      StardustSize.normal => 16.0,
      StardustSize.large => 22.0,
    };

    return Semantics(
      label: '$count Stardust',
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: iconSize,
            height: iconSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  context.colors.primary.withValues(alpha: 0.9),
                  context.colors.primary.withValues(alpha: 0.3),
                ],
              ),
              boxShadow: showAura
                  ? [
                      BoxShadow(
                        color: context.colors.primary.withValues(alpha: 0.4),
                        blurRadius: 12,
                      ),
                    ]
                  : null,
            ),
          )
              .animate(
                onPlay: (c) => c.repeat(reverse: true),
              )
              .scaleXY(
                begin: 0.85,
                end: 1,
                duration: 2.seconds,
                curve: Curves.easeInOut,
              ),
          SizedBox(width: iconSize * 0.4),
          RollingNumber(
            value: count,
            style: TextStyle(
              fontFamily: 'JetBrainsMono',
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: context.colors.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

enum StardustSize { small, normal, large }
