import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/ui/widgets/cosmic_button.dart';
import 'package:rive/rive.dart';

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
            // Rive animation astronaut/rocket
            const SizedBox(
              width: 160,
              height: 160,
              child: RiveAnimation.asset(
                'assets/rive/rocket.riv',
                fit: BoxFit.contain,
              ),
            ).animate(onPlay: (c) => c.repeat(reverse: true)).moveY(
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
                color: context.colors.onSurface.withValues(alpha: 0.5),
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
