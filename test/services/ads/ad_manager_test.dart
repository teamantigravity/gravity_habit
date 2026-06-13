import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_habit/services/ads/ad_manager.dart';

void main() {
  group('AdManager', () {
    test('shouldShowAds returns false when adsRemoved', () {
      final manager = AdManager(
        adsRemoved: true,
        isUnder13: false,
        personalizedAdsConsent: true,
      );
      expect(manager.shouldShowAds, false);
    });

    test('shouldShowAds returns false for under-13', () {
      final manager = AdManager(
        adsRemoved: false,
        isUnder13: true,
        personalizedAdsConsent: false,
      );
      expect(manager.shouldShowAds, false);
    });

    test('canShowBanner returns false for non-allowed routes', () {
      final manager = AdManager(
        adsRemoved: false,
        isUnder13: false,
        personalizedAdsConsent: false,
      );
      expect(manager.canShowBanner('/today'), false);
      expect(manager.canShowBanner('/onboarding'), false);
      expect(manager.canShowBanner('/cosmos'), false);
      expect(manager.canShowBanner('/habit-editor'), false);
    });

    test('canShowInterstitial respects post-completion cooldown', () {
      final manager = AdManager(
        adsRemoved: false,
        isUnder13: false,
        personalizedAdsConsent: false,
      );
      manager.recordCompletion();
      // Immediately after completion — should not show
      expect(manager.canShowInterstitial(), false);
    });

    test('recordCompletion starts 60-second ad-free window', () {
      final manager = AdManager(
        adsRemoved: false,
        isUnder13: false,
        personalizedAdsConsent: false,
      );
      manager.recordCompletion();
      expect(manager.canShowBanner('/stats'), false);
    });
  });
}
