import 'package:flutter/material.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';
import 'package:gravity_habit/services/ads/ad_manager.dart';
import 'package:gravity_habit/services/ads/platforms/desktop_interstitial.dart';
import 'package:gravity_habit/services/ads/platforms/mobile_interstitial.dart';
import 'package:gravity_habit/services/ads/platforms/web_interstitial.dart';

/// Universal interstitial controller that works on all ad-supported platforms.
class UniversalInterstitial {
  final _mobileService = MobileInterstitialService();
  final _desktopService = DesktopInterstitialService();
  final _webService = WebInterstitialService();

  Future<void> preload() async {
    if (AdConfig.isNativeMobile) {
      await _mobileService.preload();
    }
    // Desktop and Web interstitials are loaded on demand
  }

  Future<bool> showIfEligible(
    BuildContext? context,
    AdManager adManager,
  ) async {
    if (!adManager.canShowInterstitial()) return false;

    bool shown;

    switch (AdConfig.currentTier) {
      case AdPlatformTier.nativeMobile:
        shown = await _mobileService.show();
      case AdPlatformTier.desktopWebView:
        if (context != null) {
          shown = await _desktopService.show(context);
        } else {
          shown = false;
        }
      case AdPlatformTier.webAdsense:
        shown = await _webService.show();
      case AdPlatformTier.noAdsWatch:
      case AdPlatformTier.spatialStub:
        shown = false;
    }

    if (shown) {
      adManager.markInterstitialShown();
    }

    return shown;
  }

  void dispose() {
    _mobileService.dispose();
  }
}
