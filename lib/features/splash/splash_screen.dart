import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/features/settings/settings_provider.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    // Allow at most 800ms for splash
    await Future<void>.delayed(const Duration(milliseconds: 600));
    if (!mounted) return;
    final settings = ref.read(settingsProvider);
    if (settings.hasOnboarded) {
      context.go('/today');
    } else {
      context.go('/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.isDark
          ? const Color(0xFF0A0B1E)
          : context.theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // App Logo
            SizedBox(
              width: 120,
              height: 120,
              child: Image.asset('assets/images/app_logo.png'),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(),
                )
                .shimmer(
                  duration: 2.seconds,
                  color: context.colors.primary.withValues(alpha: 0.5),
                ),
            const SizedBox(height: 24),
            Text(
              'Gravity Habit',
              style: context.textTheme.headlineMedium?.copyWith(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.w700,
                color: context.colors.onSurface,
              ),
            ).animate().fadeIn(duration: 400.ms),
          ],
        ),
      ),
    );
  }
}
