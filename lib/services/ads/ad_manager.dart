import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/features/settings/settings_provider.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';
import 'package:gravity_habit/services/ads/universal_interstitial.dart';

final adManagerProvider = Provider<AdManager>((ref) {
  final settings = ref.watch(settingsProvider);
  return AdManager(
    adsRemoved: settings.adsRemoved,
    isUnder13: settings.isUnder13,
    personalizedAdsConsent: settings.personalizedAdsConsent,
  );
});

/// Central ad manager that works across ALL platforms.
/// Delegates to the correct ad serving strategy per platform tier.
class AdManager {
  AdManager({
    required this.adsRemoved,
    required this.isUnder13,
    required this.personalizedAdsConsent,
  });

  final bool adsRemoved;
  final bool isUnder13;
  final bool personalizedAdsConsent;

  DateTime? _lastInterstitialTime;
  DateTime? _lastCompletionTime;
  DateTime? _lastTapTime;
  bool _initialized = false;

  /// Whether ads should be shown at all on this device.
  bool get shouldShowAds {
    if (adsRemoved) return false;
    if (isUnder13) return false;
    if (!AdConfig.canServeAds) return false;
    return true;
  }

  /// Initialize the appropriate ad system for this platform.
  Future<void> initialize() async {
    if (!shouldShowAds) return;
    if (_initialized) return;

    try {
      // Initialization is handled by each platform-specific widget
      // Mobile: google_mobile_ads SDK init
      // Desktop: WebView setup
      // Web: AdSense script injection
      _initialized = true;
    } catch (e) {
      debugPrint('Ad init failed (non-critical): $e');
    }
  }

  void recordCompletion() {
    _lastCompletionTime = DateTime.now();
  }

  void recordTap() {
    _lastTapTime = DateTime.now();
  }

  bool canShowBanner(String currentRoute) {
    if (!shouldShowAds) return false;
    if (!AdConfig.bannerAllowedRoutes.contains(currentRoute)) return false;
    if (_isInPostCompletionCooldown()) return false;
    return true;
  }

  bool canShowInterstitial() {
    if (!shouldShowAds) return false;
    if (_isInPostCompletionCooldown()) return false;
    if (_isInPostTapCooldown()) return false;
    if (_lastInterstitialTime != null) {
      final elapsed = DateTime.now().difference(_lastInterstitialTime!);
      if (elapsed.inHours < AdConfig.interstitialCooldownHours) return false;
    }
    return true;
  }

  Future<void> showInterstitialIfEligible([BuildContext? context]) async {
    final interstitial = UniversalInterstitial();
    await interstitial.showIfEligible(context, this);
  }

  void markInterstitialShown() {
    _lastInterstitialTime = DateTime.now();
  }

  bool _isInPostCompletionCooldown() {
    if (_lastCompletionTime == null) return false;
    return DateTime.now().difference(_lastCompletionTime!).inSeconds <
        AdConfig.postCompletionCooldownSeconds;
  }

  bool _isInPostTapCooldown() {
    if (_lastTapTime == null) return false;
    return DateTime.now().difference(_lastTapTime!).inMilliseconds <
        AdConfig.adFreeWindowAfterTapMs;
  }
}
