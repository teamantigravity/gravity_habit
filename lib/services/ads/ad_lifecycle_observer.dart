import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/services/ads/ad_manager.dart';

/// Observes app lifecycle to:
/// 1. Show interstitial on app resume (if eligible)
/// 2. Pause/resume ad loading on background/foreground
/// 3. Never show ads on cold start
///
/// Installed in the app's root widget.
class AdLifecycleObserver extends WidgetsBindingObserver {
  AdLifecycleObserver(this._ref);

  final WidgetRef _ref;
  bool _hasPausedOnce = false;
  DateTime? _lastPauseTime;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
      case AppLifecycleState.hidden:
        _hasPausedOnce = true;
        _lastPauseTime = DateTime.now();

      case AppLifecycleState.resumed:
        if (_hasPausedOnce && _lastPauseTime != null) {
          final adManager = _ref.read(adManagerProvider);
          // Only show interstitial if app was backgrounded for 30+ seconds
          // (prevents showing on quick app-switch)
          final elapsed = DateTime.now().difference(_lastPauseTime!);
          if (elapsed.inSeconds >= 30 && adManager.canShowInterstitial()) {
            adManager.showInterstitialIfEligible();
          }
        }

      case AppLifecycleState.inactive:
      case AppLifecycleState.detached:
        break;
    }
  }
}
