import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/app/app.dart';
import 'package:gravity_habit/data/isar/database.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';
import 'package:gravity_habit/services/ads/consent_manager.dart';
import 'package:gravity_habit/services/audio/audio_service.dart';
import 'package:gravity_habit/services/haptics/haptic_service.dart';
import 'package:gravity_habit/services/notifications/notification_service.dart';
import 'package:timezone/data/latest_all.dart' as tz;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // ---- INITIALIZE CORE SERVICES ----
  final database = await GravityDatabase.initialize();
  final notificationService = NotificationService();
  await notificationService.initialize();
  final audioService = AudioService();
  await audioService.initialize();
  final hapticService = HapticService();

  // ---- INITIALIZE ADS (only on supported platforms) ----
  // 1. Consent must be gathered BEFORE ad initialization
  // 2. This is a no-op on web/desktop/watch/XR
  if (AdConfig.canServeAds) {
    await ConsentManager.initialize();
    // Ad SDK initialization happens in AdManager.initialize()
    // which is called lazily when first ad is needed,
    // AFTER consent is gathered.
    // This ensures mediation adapters participate from the first request.
  }

  runApp(
    ProviderScope(
      overrides: [
        gravityDatabaseProvider.overrideWithValue(database),
        notificationServiceProvider.overrideWithValue(notificationService),
        audioServiceProvider.overrideWithValue(audioService),
        hapticServiceProvider.overrideWithValue(hapticService),
      ],
      child: const GravityHabitApp(),
    ),
  );
}
