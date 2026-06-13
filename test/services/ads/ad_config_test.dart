import 'package:flutter_test/flutter_test.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';

void main() {
  group('AdConfig', () {
    test('banner is only allowed on stats and settings', () {
      expect(AdConfig.bannerAllowedRoutes, contains('/stats'));
      expect(AdConfig.bannerAllowedRoutes, contains('/settings'));
      expect(AdConfig.bannerAllowedRoutes.length, 2);
    });

    test('ad-free routes include onboarding and splash', () {
      expect(AdConfig.adFreeRoutes, contains('/onboarding'));
      expect(AdConfig.adFreeRoutes, contains('/splash'));
      expect(AdConfig.adFreeRoutes, contains('/remove-ads'));
    });

    test('interstitial cooldown is 24 hours', () {
      expect(AdConfig.interstitialCooldownHours, 24);
    });

    test('post-completion cooldown is 60 seconds', () {
      expect(AdConfig.postCompletionCooldownSeconds, 60);
    });
  });
}
