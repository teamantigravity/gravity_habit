import 'package:flutter/foundation.dart';

/// Comprehensive ad error handler that categorizes and handles
/// every known failure mode across AdMob, Unity Ads, and Meta.
///
/// PRINCIPLE: Ad failures are NEVER user-visible errors.
/// The app must function identically whether ads load or not.
class AdErrorHandler {
  AdErrorHandler._();

  /// Categorize an ad load error and determine the response.
  static AdErrorAction handleLoadError({
    required int errorCode,
    required String message,
    required String? domain,
    String? adapterClassName,
  }) {
    // ---- ADMOB ERROR CODES ----
    // 0: Internal error
    // 1: Invalid request
    // 2: Network error
    // 3: No fill (no ads available)

    if (errorCode == 3 || message.toLowerCase().contains('no fill')) {
      // "No Fill" — completely normal, especially for Meta
      // This means no ad network had an ad to serve.
      // Action: silently retry later
      return AdErrorAction.silentRetryLater;
    }

    if (errorCode == 2 || message.toLowerCase().contains('network')) {
      // Network error — device might be offline
      // Action: silently retry when connectivity returns
      return AdErrorAction.silentRetryOnConnectivity;
    }

    if (errorCode == 1 || message.toLowerCase().contains('invalid')) {
      // Invalid request — likely misconfigured ad unit
      // Action: log for developer, don't retry
      debugPrint(
        'AD CONFIG ERROR: $message (code: $errorCode, '
        'domain: $domain, adapter: $adapterClassName)',
      );
      return AdErrorAction.doNotRetry;
    }

    // ---- ADAPTER-SPECIFIC ERRORS ----

    if (adapterClassName?.contains('UnityAds') == true) {
      return _handleUnityAdsError(errorCode, message);
    }

    if (adapterClassName?.contains('Meta') == true ||
        adapterClassName?.contains('Facebook') == true) {
      return _handleMetaError(errorCode, message);
    }

    // Unknown error — log and silently move on
    debugPrint('Unknown ad error: $message (code: $errorCode)');
    return AdErrorAction.silentRetryLater;
  }

  static AdErrorAction _handleUnityAdsError(int code, String message) {
    // Unity Ads adapter error codes:
    // 0: ERROR_CODE_INTERNAL_ERROR
    // 1: ERROR_CODE_NO_FILL
    // 2: ERROR_CODE_NETWORK_ERROR
    // 3: ERROR_CODE_INVALID_REQUEST
    // 4: ERROR_CODE_AD_NOT_READY

    if (code == 1) return AdErrorAction.silentRetryLater;
    if (code == 4) return AdErrorAction.silentRetryLater;
    if (code == 2) return AdErrorAction.silentRetryOnConnectivity;

    debugPrint('Unity Ads error: $message (code: $code)');
    return AdErrorAction.silentRetryLater;
  }

  static AdErrorAction _handleMetaError(int code, String message) {
    // Meta Audience Network known issues:
    // - "No Fill" is VERY common, especially for new apps
    // - "Waiting for bid request" status in Meta Business doesn't mean
    //   ads will fill — it often doesn't until significant volume
    // - The mediation adapter may not pass test mode/device ID correctly
    //   causing "No Fill" even in test mode
    //
    // Resolution: Accept "No Fill" from Meta as normal.
    // AdMob and Unity Ads will fill the gap.

    if (message.toLowerCase().contains('no fill') ||
        message.toLowerCase().contains('no ad')) {
      return AdErrorAction.silentRetryLater;
    }

    debugPrint('Meta Audience Network error: $message (code: $code)');
    return AdErrorAction.silentRetryLater;
  }
}

enum AdErrorAction {
  /// Don't show anything, try again after a delay.
  silentRetryLater,

  /// Don't show anything, try again when network is available.
  silentRetryOnConnectivity,

  /// Configuration error — don't retry, log for developer.
  doNotRetry,
}
