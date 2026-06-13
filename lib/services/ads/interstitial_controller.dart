import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/services/ads/ad_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Controls interstitial ad display on app resume from background.
///
/// Rules (from spec):
/// - Max 1 per 24 hours
/// - ONLY on app-resume from background
/// - NEVER during habit logging
/// - NEVER on streak/celebration
/// - NEVER on cold start
/// - NEVER blocking reminder action
/// - Ads pause 60 seconds after any habit completion
mixin InterstitialControllerMixin<T extends StatefulWidget> on State<T> {
  bool _wasInBackground = false;
  bool _isColdStart = true;

  @override
  void initState() {
    super.initState();
    // After first frame, mark cold start as over
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) _isColdStart = false;
      });
    });
  }

  /// Call this from didChangeAppLifecycleState
  Future<void> handleAppLifecycleForAds(
    AppLifecycleState state,
    WidgetRef ref,
  ) async {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.hidden) {
      _wasInBackground = true;
    }

    if (state == AppLifecycleState.resumed && _wasInBackground) {
      _wasInBackground = false;

      // Never on cold start
      if (_isColdStart) return;

      // Check last interstitial time from persistent storage
      final prefs = await SharedPreferences.getInstance();
      final lastShown = prefs.getInt('last_interstitial_timestamp') ?? 0;
      final now = DateTime.now().millisecondsSinceEpoch;
      final hoursSince = (now - lastShown) / (1000 * 60 * 60);

      if (hoursSince < 24) return;

      final adManager = ref.read(adManagerProvider);
      if (adManager.canShowInterstitial()) {
        await adManager.showInterstitialIfEligible();
        await prefs.setInt('last_interstitial_timestamp', now);
      }
    }
  }
}
