import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_habit/services/ads/ad_error_handler.dart';

void main() {
  group('AdErrorHandler', () {
    test('No Fill returns silentRetryLater', () {
      final action = AdErrorHandler.handleLoadError(
        errorCode: 3,
        message: 'No fill',
        domain: 'com.google.ads',
      );
      expect(action, AdErrorAction.silentRetryLater);
    });

    test('Network error returns silentRetryOnConnectivity', () {
      final action = AdErrorHandler.handleLoadError(
        errorCode: 2,
        message: 'Network error',
        domain: 'com.google.ads',
      );
      expect(action, AdErrorAction.silentRetryOnConnectivity);
    });

    test('Invalid request returns doNotRetry', () {
      final action = AdErrorHandler.handleLoadError(
        errorCode: 1,
        message: 'Invalid ad request',
        domain: 'com.google.ads',
      );
      expect(action, AdErrorAction.doNotRetry);
    });

    test('Unity Ads no fill handled correctly', () {
      final action = AdErrorHandler.handleLoadError(
        errorCode: 1,
        message: 'Unity no fill',
        domain: null,
        adapterClassName: 'com.google.ads.mediation.unity.UnityAdsAdapter',
      );
      expect(action, AdErrorAction.silentRetryLater);
    });

    test('Meta no fill handled correctly', () {
      final action = AdErrorHandler.handleLoadError(
        errorCode: 0,
        message: 'No ad available',
        domain: null,
        adapterClassName: 'com.google.ads.mediation.facebook.MetaAdapter',
      );
      expect(action, AdErrorAction.silentRetryLater);
    });

    test('unknown error returns silentRetryLater', () {
      final action = AdErrorHandler.handleLoadError(
        errorCode: 999,
        message: 'Something weird happened',
        domain: 'unknown',
      );
      expect(action, AdErrorAction.silentRetryLater);
    });
  });
}
