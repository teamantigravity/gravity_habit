import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Global keyboard shortcuts for desktop platforms.
class GravityKeyboardShortcuts extends StatelessWidget {
  const GravityKeyboardShortcuts({
    required this.child,
    this.onNewHabit,
    this.onToggleView,
    this.onNavigateToday,
    this.onNavigateStats,
    this.onNavigateCosmos,
    this.onNavigateSettings,
    super.key,
  });

  final Widget child;
  final VoidCallback? onNewHabit;
  final VoidCallback? onToggleView;
  final VoidCallback? onNavigateToday;
  final VoidCallback? onNavigateStats;
  final VoidCallback? onNavigateCosmos;
  final VoidCallback? onNavigateSettings;

  @override
  Widget build(BuildContext context) {
    return Shortcuts(
      shortcuts: {
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyN):
            const _NewHabitIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.keyL):
            const _ToggleViewIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit1):
            const _NavTodayIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit2):
            const _NavStatsIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit3):
            const _NavCosmosIntent(),
        LogicalKeySet(LogicalKeyboardKey.control, LogicalKeyboardKey.digit4):
            const _NavSettingsIntent(),
      },
      child: Actions(
        actions: {
          _NewHabitIntent: CallbackAction<_NewHabitIntent>(
            onInvoke: (_) => onNewHabit?.call(),
          ),
          _ToggleViewIntent: CallbackAction<_ToggleViewIntent>(
            onInvoke: (_) => onToggleView?.call(),
          ),
          _NavTodayIntent: CallbackAction<_NavTodayIntent>(
            onInvoke: (_) => onNavigateToday?.call(),
          ),
          _NavStatsIntent: CallbackAction<_NavStatsIntent>(
            onInvoke: (_) => onNavigateStats?.call(),
          ),
          _NavCosmosIntent: CallbackAction<_NavCosmosIntent>(
            onInvoke: (_) => onNavigateCosmos?.call(),
          ),
          _NavSettingsIntent: CallbackAction<_NavSettingsIntent>(
            onInvoke: (_) => onNavigateSettings?.call(),
          ),
        },
        child: Focus(
          autofocus: true,
          child: child,
        ),
      ),
    );
  }
}

class _NewHabitIntent extends Intent {
  const _NewHabitIntent();
}

class _ToggleViewIntent extends Intent {
  const _ToggleViewIntent();
}

class _NavTodayIntent extends Intent {
  const _NavTodayIntent();
}

class _NavStatsIntent extends Intent {
  const _NavStatsIntent();
}

class _NavCosmosIntent extends Intent {
  const _NavCosmosIntent();
}

class _NavSettingsIntent extends Intent {
  const _NavSettingsIntent();
}
