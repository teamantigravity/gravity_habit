import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/features/cosmos/cosmos_screen.dart';
import 'package:gravity_habit/features/cosmos/shop/shop_screen.dart';
import 'package:gravity_habit/features/habit_detail/habit_detail_screen.dart';
import 'package:gravity_habit/features/habit_editor/habit_editor_screen.dart';
import 'package:gravity_habit/features/onboarding/onboarding_screen.dart';
import 'package:gravity_habit/features/remove_ads/remove_ads_screen.dart';
import 'package:gravity_habit/features/settings/settings_provider.dart';
import 'package:gravity_habit/features/settings/settings_screen.dart';
import 'package:gravity_habit/features/splash/splash_screen.dart';
import 'package:gravity_habit/features/stats/stats_screen.dart';
import 'package:gravity_habit/features/today/today_screen.dart';
import 'package:gravity_habit/ui/widgets/shell_scaffold.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  final settings = ref.watch(settingsProvider);
  final hasOnboarded = settings.hasOnboarded;

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => '/splash',
      ),
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => ShellScaffold(child: child),
        routes: [
          GoRoute(
            path: '/today',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const TodayScreen(),
              transitionsBuilder: _fadeTransition,
            ),
          ),
          GoRoute(
            path: '/stats',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const StatsScreen(),
              transitionsBuilder: _fadeTransition,
            ),
          ),
          GoRoute(
            path: '/cosmos',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const CosmosScreen(),
              transitionsBuilder: _fadeTransition,
            ),
          ),
          GoRoute(
            path: '/settings',
            pageBuilder: (context, state) => CustomTransitionPage(
              key: state.pageKey,
              child: const SettingsScreen(),
              transitionsBuilder: _fadeTransition,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/habit/:id',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => HabitDetailScreen(
          habitId: state.pathParameters['id']!,
        ),
      ),
      GoRoute(
        path: '/habit-editor',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final habitId = state.uri.queryParameters['id'];
          return HabitEditorScreen(habitId: habitId);
        },
      ),
      GoRoute(
        path: '/shop',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const ShopScreen(),
      ),
      GoRoute(
        path: '/remove-ads',
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) => const RemoveAdsScreen(),
      ),
    ],
    redirect: (context, state) {
      final isSplash = state.matchedLocation == '/splash';
      if (!isSplash) return null;
      return null; // Splash handles its own redirect
    },
  );
});

Widget _fadeTransition(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
) {
  return FadeTransition(
    opacity: CurveTween(curve: Curves.easeInOut).animate(animation),
    child: ScaleTransition(
      scale: Tween<double>(begin: 0.98, end: 1)
          .chain(CurveTween(curve: Curves.easeOut))
          .animate(animation),
      child: child,
    ),
  );
}
