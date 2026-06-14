import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/services/haptics/haptic_service.dart';

class ShellScaffold extends ConsumerStatefulWidget {
  const ShellScaffold({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<ShellScaffold> createState() => _ShellScaffoldState();
}

class _ShellScaffoldState extends ConsumerState<ShellScaffold> {
  int _currentIndex = 0;

  static const _routes = ['/today', '/stats', '/cosmos', '/settings'];

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    _currentIndex = _routes.indexOf(location).clamp(0, 3);

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/cosmic_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          widget.child,
        ],
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 28, sigmaY: 28),
          child: Container(
            decoration: BoxDecoration(
              color: context.colors.surface.withOpacity(0.85),
              border: Border(
                top: BorderSide(
                  color: context.colors.outlineVariant.withOpacity(0.2),
                ),
              ),
            ),
            child: SafeArea(
              top: false,
              child: SizedBox(
                height: 64,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _NavItem(
                      icon: Icons.explore_outlined,
                      activeIcon: Icons.explore,
                      label: 'Today',
                      isActive: _currentIndex == 0,
                      onTap: () => _navigate(0),
                    ),
                    _NavItem(
                      icon: Icons.insights_outlined,
                      activeIcon: Icons.insights,
                      label: 'Stats',
                      isActive: _currentIndex == 1,
                      onTap: () => _navigate(1),
                    ),
                    _NavItem(
                      icon: Icons.auto_awesome_outlined,
                      activeIcon: Icons.auto_awesome,
                      label: 'Cosmos',
                      isActive: _currentIndex == 2,
                      onTap: () => _navigate(2),
                    ),
                    _NavItem(
                      icon: Icons.tune_outlined,
                      activeIcon: Icons.tune,
                      label: 'Settings',
                      isActive: _currentIndex == 3,
                      onTap: () => _navigate(3),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigate(int index) {
    if (index == _currentIndex) return;
    ref.read(hapticServiceProvider).play(HapticType.tap);
    context.go(_routes[index]);
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.activeIcon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isActive
        ? context.colors.primary
        : context.colors.onSurface.withOpacity(0.5);

    return Semantics(
      label: label,
      button: true,
      selected: isActive,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(Spacing.sm),
        child: SizedBox(
          width: 64,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  isActive ? activeIcon : icon,
                  key: ValueKey(isActive),
                  color: color,
                  size: 24,
                  semanticLabel: label,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
