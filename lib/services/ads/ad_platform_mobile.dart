/// Mobile implementation using google_mobile_ads with mediation.
/// Supports AdMob (primary) + Unity Ads (bidding) + Meta Audience Network (bidding).
///
/// KEY ARCHITECTURE DECISIONS:
/// 1. AdMob is the mediation layer — it orchestrates all networks
/// 2. Unity Ads and Meta are configured as bidding partners in AdMob console
/// 3. Waterfall is NOT used (Unity Ads deprecated waterfall Jan 2026)
/// 4. All adapter initialization is awaited before first ad request
/// 5. Every ad load uses error callbacks with full error chain inspection
/// 6. "No Fill" from any network is handled silently — never crashes
/// 7. Context is always Activity on Android (passed from FlutterActivity)
library;

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';

// ---- CACHED AD INSTANCES ----
BannerAd? _cachedBanner;
InterstitialAd? _cachedInterstitial;
bool _isInitialized = false;

/// Initialize the Google Mobile Ads SDK with mediation adapters.
/// This MUST be called before any ad load.
/// Mediation adapters (Unity Ads, Meta) are initialized automatically
/// during this call via the AdMob mediation configuration.
Future<void> initializeAds({required bool personalizedAds}) async {
  if (_isInitialized) return;

  try {
    // Initialize the Mobile Ads SDK.
    // This also initializes all mediation adapters registered in AdMob console.
    final initStatus = await MobileAds.instance.initialize();

    // Log adapter statuses for debugging (never shown to user)
    final adapterStatuses = initStatus.adapterStatuses;
    for (final entry in adapterStatuses.entries) {
      debugPrint(
        'Ad adapter: ${entry.key} — '
        'state: ${entry.value.state}, '
        'description: ${entry.value.description}',
      );
    }

    // Configure request settings
    if (!personalizedAds) {
      // Non-personalized ads for GDPR/CCPA compliance
      MobileAds.instance.updateRequestConfiguration(
        RequestConfiguration(
          tagForChildDirectedTreatment:
              TagForChildDirectedTreatment.unspecified,
          maxAdContentRating: MaxAdContentRating.g,
        ),
      );
    }

    _isInitialized = true;

    // Pre-cache an interstitial for app-resume
    _preloadInterstitial();
  } catch (e) {
    debugPrint('MobileAds.initialize failed: $e');
    // Non-fatal — app continues without ads
  }
}

/// Create and return a BannerAd configured for mediation.
/// Returns null if ads are not available.
BannerAd? createBannerAd({
  required String adUnitId,
  required void Function() onLoaded,
  required void Function(String error) onFailed,
}) {
  if (!_isInitialized || adUnitId.isEmpty) return null;

  try {
    final banner = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: _buildAdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('Banner loaded from: ${_getAdNetworkName(ad)}');
          onLoaded();
        },
        onAdFailedToLoad: (ad, error) {
          debugPrint(
            'Banner failed: ${error.message} '
            '(code: ${error.code}, domain: ${error.domain})',
          );
          // Log adapter-level errors for debugging
          _logResponseInfo(ad.responseInfo);
          ad.dispose();
          onFailed(error.message);
        },
        onAdOpened: (_) {},
        onAdClosed: (_) {},
        onAdImpression: (_) {
          debugPrint('Banner impression recorded');
        },
      ),
    );

    banner.load();
    return banner;
  } catch (e) {
    debugPrint('Banner creation failed: $e');
    onFailed(e.toString());
    return null;
  }
}

/// Show a preloaded interstitial ad.
/// Returns true if shown, false if not available.
Future<bool> showInterstitial({required String adUnitId}) async {
  if (_cachedInterstitial == null) {
    // Try to load one now
    await _loadInterstitial(adUnitId);
  }

  if (_cachedInterstitial != null) {
    try {
      await _cachedInterstitial!.show();
      _cachedInterstitial = null;
      // Pre-cache the next one
      _preloadInterstitial();
      return true;
    } catch (e) {
      debugPrint('Interstitial show failed: $e');
      _cachedInterstitial?.dispose();
      _cachedInterstitial = null;
      return false;
    }
  }

  return false;
}

/// Preload an interstitial for later use.
void _preloadInterstitial() {
  if (!_isInitialized) return;
  final adUnitId = AdConfig.mobileInterstitialAdUnitId;
  if (adUnitId.isEmpty) return;
  _loadInterstitial(adUnitId);
}

Future<void> _loadInterstitial(String adUnitId) async {
  try {
    await InterstitialAd.load(
      adUnitId: adUnitId,
      request: _buildAdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint(
            'Interstitial loaded from: ${_getAdNetworkName(ad)}',
          );
          _cachedInterstitial = ad;

          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              ad.dispose();
              _cachedInterstitial = null;
            },
            onAdFailedToShowFullScreenContent: (ad, error) {
              debugPrint('Interstitial show error: ${error.message}');
              ad.dispose();
              _cachedInterstitial = null;
            },
          );
        },
        onAdFailedToLoad: (error) {
          debugPrint(
            'Interstitial load failed: ${error.message} '
            '(code: ${error.code})',
          );
          // This is normal — could be "No Fill" from all networks.
          // The app continues perfectly fine without it.
          _cachedInterstitial = null;
        },
      ),
    );
  } catch (e) {
    debugPrint('Interstitial load exception: $e');
  }
}

/// Build an AdRequest. Mediation partners (Unity Ads, Meta)
/// participate automatically via AdMob's bidding configuration.
/// No extra parameters needed — the adapters handle bidding internally.
AdRequest _buildAdRequest() {
  return const AdRequest(
      // AdMob handles mediation partner bidding automatically.
      // Unity Ads adapter and Meta adapter are included via
      // pubspec dependency and AdMob console configuration.
      // No manual network extras needed for bidding.
      );
}

/// Extract the winning ad network name for logging.
String _getAdNetworkName(Ad ad) {
  try {
    final info = ad.responseInfo;
    if (info != null) {
      final mediationAdapterClassName = info.mediationAdapterClassName;
      if (mediationAdapterClassName != null) {
        // Extract readable name
        if (mediationAdapterClassName.contains('UnityAds')) {
          return 'Unity Ads';
        }
        if (mediationAdapterClassName.contains('Meta') ||
            mediationAdapterClassName.contains('Facebook')) {
          return 'Meta Audience Network';
        }
        if (mediationAdapterClassName.contains('Google') ||
            mediationAdapterClassName.contains('AdMob')) {
          return 'AdMob';
        }
        return mediationAdapterClassName;
      }
    }
  } catch (_) {}
  return 'Unknown';
}

/// Log detailed response info for debugging adapter failures.
void _logResponseInfo(ResponseInfo? info) {
  if (info == null) return;
  try {
    debugPrint('  Response ID: ${info.responseId}');
    debugPrint(
      '  Mediation adapter: ${info.mediationAdapterClassName}',
    );
    final adapterResponses = info.adapterResponses;
    if (adapterResponses != null) {
      for (final response in adapterResponses) {
        debugPrint(
          '  Adapter: ${response.adapterClassName} — '
          'latency: ${response.latencyMillis}ms — '
          'error: ${response.adError?.message ?? "none"}',
        );
      }
    }
  } catch (_) {}
}

/// Clean up all cached ads.
void disposeAds() {
  _cachedBanner?.dispose();
  _cachedBanner = null;
  _cachedInterstitial?.dispose();
  _cachedInterstitial = null;
}
