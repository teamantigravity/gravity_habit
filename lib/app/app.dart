// lib/app/app.dart
// COMPLETE CORRECTED FILE — with error boundaries

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/app/router.dart';
import 'package:gravity_habit/app/theme/cosmos_theme.dart';
import 'package:gravity_habit/core/constants/supported_locales.dart';
import 'package:gravity_habit/features/settings/settings_provider.dart';

class GravityHabitApp extends ConsumerWidget {
  const GravityHabitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final router = ref.watch(routerProvider);
    final cosmosTheme = ref.watch(cosmosThemeProvider);

    // Global error handler — never show red screen to user
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      debugPrint('Flutter framework error: ${details.exception}');
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      debugPrint('Uncaught async error: $error\n$stack');
      return true; // Handled — do not crash
    };

    // Replace the default error widget (red screen) with invisible widget
    ErrorWidget.builder = (FlutterErrorDetails details) {
      debugPrint('ErrorWidget shown for: ${details.exception}');
      return const SizedBox.shrink();
    };

    return MaterialApp.router(
      title: 'Gravity Habit',
      debugShowCheckedModeBanner: false,
      theme: cosmosTheme.lightTheme,
      darkTheme: cosmosTheme.darkTheme,
      themeMode: settings.themeMode,
      routerConfig: router,
      locale: settings.locale,
      supportedLocales: supportedLocales,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      builder: (context, child) {
        final mediaQuery = MediaQuery.of(context);
        final textScaleFactor = settings.fontScale.clamp(0.9, 1.5).toDouble();
        
        final scaledChild = MediaQuery(
          data: mediaQuery.copyWith(
            textScaler: TextScaler.linear(textScaleFactor),
          ),
          child: child ?? const SizedBox.shrink(),
        );

        if (mediaQuery.size.width > 600) {
          // No longer constrained. Allow it to fill the screen but remain styled if needed.
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            body: scaledChild,
          );
        }
        
        return scaledChild;
      },
    );
  }
}
