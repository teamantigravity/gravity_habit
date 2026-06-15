// lib/services/ads/ad_platform_dispatcher.dart
// COMPLETE NEW FILE — replaces all conditional import patterns

import 'package:gravity_habit/services/ads/ad_config.dart';

/// This file provides platform-safe ad operations.
/// It checks the platform tier at RUNTIME rather than using
/// conditional imports (which can't distinguish mobile from desktop
/// since both use dart:io).
///
/// On web, google_mobile_ads is never imported.
/// On desktop, google_mobile_ads is never called.
/// On mobile, full mediation is used.

/// Initialize ads for the current platform.
Future<void> initializeAdsForPlatform({
  required bool personalizedAds,
}) async {
  if (!AdConfig.canServeAds) return;

  switch (AdConfig.currentTier) {
    case AdPlatformTier.nativeMobile:
      // google_mobile_ads initialization happens in MobileBannerAd widget
      // and MobileInterstitialService — they import the package directly
      // and are ONLY constructed when isNativeMobile is true
      break;
    case AdPlatformTier.desktopWebView:
      // WebView setup happens in DesktopWebViewBanner widget
      break;
    case AdPlatformTier.webAdsense:
      // AdSense script is in index.html, loaded by browser
      break;
    case AdPlatformTier.noAdsWatch:
    case AdPlatformTier.spatialStub:
      // No initialization needed
      break;
  }
}
