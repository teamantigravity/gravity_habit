/// Stub implementation for platforms where google_mobile_ads is unavailable.
/// Web, Desktop (macOS/Windows/Linux), Watch, XR.
/// All calls are silent no-ops — the app NEVER crashes due to ads.

import 'dart:async';

Future<void> initializeAds({required bool personalizedAds}) async {
  // No-op on unsupported platforms
}

Object? createBannerAd({
  required String adUnitId,
  required void Function() onLoaded,
  required void Function(String error) onFailed,
}) {
  // No ads on this platform — return null
  return null;
}

Future<bool> showInterstitial({required String adUnitId}) async {
  // No interstitials on this platform
  return false;
}

void disposeAds() {
  // Nothing to dispose
}
