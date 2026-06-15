import 'dart:io';

import 'package:flutter/foundation.dart';

/// Platform tier classification for ad serving.
enum AdPlatformTier {
  /// Android, iOS — native google_mobile_ads SDK
  nativeMobile,

  /// macOS, Windows, Linux — WebView-based ads
  desktopWebView,

  /// Web/PWA — direct AdSense JavaScript injection
  webAdsense,

  /// watchOS, Wear OS — no ads possible (screen too small, no SDK)
  noAdsWatch,

  /// visionOS, Android XR — future-ready, no ads yet
  spatialStub,
}

class AdConfig {
  AdConfig._();

  /// Determine which ad tier the current platform belongs to.
  static AdPlatformTier get currentTier {
    if (kIsWeb) return AdPlatformTier.webAdsense;

    try {
      if (Platform.isAndroid) {
        // Check if this is Android XR by checking for XR features
        // In production, use device_info_plus to check system features
        return AdPlatformTier.nativeMobile;
      }
      if (Platform.isIOS) return AdPlatformTier.nativeMobile;
      if (Platform.isMacOS) return AdPlatformTier.desktopWebView;
      if (Platform.isWindows) return AdPlatformTier.desktopWebView;
      if (Platform.isLinux) return AdPlatformTier.desktopWebView;
    } catch (_) {}

    return AdPlatformTier.spatialStub;
  }

  /// Whether ANY form of ads can be served on this platform.
  static bool get canServeAds {
    final tier = currentTier;
    return tier == AdPlatformTier.nativeMobile ||
        tier == AdPlatformTier.desktopWebView ||
        tier == AdPlatformTier.webAdsense;
  }

  /// Whether the native google_mobile_ads SDK is available.
  static bool get isNativeMobile => currentTier == AdPlatformTier.nativeMobile;

  /// Whether we should use WebView-based ads.
  static bool get isDesktopWebView =>
      currentTier == AdPlatformTier.desktopWebView;

  /// Whether we should use web/AdSense ads.
  static bool get isWebAdsense => currentTier == AdPlatformTier.webAdsense;

  // ---- ADMOB AD UNIT IDs (Mobile only) ----

  static String get mobileBannerAdUnitId {
    if (!isNativeMobile) return '';
    try {
      if (Platform.isAndroid) {
        return kDebugMode
            ? 'ca-app-pub-3940256099942544/6300978111'
            : 'ca-app-pub-XXXX/YYYY';
      }
      if (Platform.isIOS) {
        return kDebugMode
            ? 'ca-app-pub-3940256099942544/2934735716'
            : 'ca-app-pub-XXXX/ZZZZ';
      }
    } catch (_) {}
    return '';
  }

  static String get mobileInterstitialAdUnitId {
    if (!isNativeMobile) return '';
    try {
      if (Platform.isAndroid) {
        return kDebugMode
            ? 'ca-app-pub-3940256099942544/1033173712'
            : 'ca-app-pub-XXXX/AAAA';
      }
      if (Platform.isIOS) {
        return kDebugMode
            ? 'ca-app-pub-3940256099942544/4411468910'
            : 'ca-app-pub-XXXX/BBBB';
      }
    } catch (_) {}
    return '';
  }

  // ---- ADSENSE CONFIG (Desktop WebView + Web) ----

  /// Your AdSense publisher ID (ca-pub-XXXXXXXXXXXXXXXX)
  static const adsensePublisherId = 'ca-pub-XXXXXXXXXXXXXXXX';

  /// AdSense ad slot IDs
  static const adsenseBannerSlotId = '1234567890';
  static const adsenseInterstitialSlotId = '0987654321';

  /// The HTML page served inside desktop WebViews for ad rendering.
  /// This is a local HTML file bundled with the app.
  static const desktopAdHtmlAssetPath = 'assets/ads/desktop_ad.html';

  // ---- POLICY CONSTANTS (same across all platforms) ----

  static const interstitialCooldownHours = 24;
  static const postCompletionCooldownSeconds = 60;
  static const adFreeWindowAfterTapMs = 60000;

  static const adFreeRoutes = [
    '/onboarding',
    '/splash',
    '/remove-ads',
    '/habit-editor',
  ];

  static const bannerAllowedRoutes = [
    '/stats',
    '/settings',
  ];
}
