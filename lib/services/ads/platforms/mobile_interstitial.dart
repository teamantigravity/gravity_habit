import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';

/// Mobile interstitial ad with preloading.
/// Only available on Android and iOS.
class MobileInterstitialService {
  InterstitialAd? _cachedAd;

  Future<void> preload() async {
    if (!AdConfig.isNativeMobile) return;
    final adUnitId = AdConfig.mobileInterstitialAdUnitId;
    if (adUnitId.isEmpty) return;

    try {
      await InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            _cachedAd = ad;
            ad.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                _cachedAd = null;
                preload(); // Preload next
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                debugPrint('Interstitial show failed: ${error.message}');
                ad.dispose();
                _cachedAd = null;
              },
            );
          },
          onAdFailedToLoad: (error) {
            debugPrint('Interstitial preload failed: ${error.message}');
            _cachedAd = null;
          },
        ),
      );
    } catch (e) {
      debugPrint('Interstitial preload exception: $e');
    }
  }

  Future<bool> show() async {
    if (_cachedAd == null) return false;
    try {
      await _cachedAd!.show();
      return true;
    } catch (e) {
      debugPrint('Interstitial show exception: $e');
      _cachedAd?.dispose();
      _cachedAd = null;
      return false;
    }
  }

  void dispose() {
    _cachedAd?.dispose();
    _cachedAd = null;
  }
}
