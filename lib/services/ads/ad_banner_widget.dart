// lib/services/ads/ad_banner_widget.dart
// COMPLETE CORRECTED FILE — safe for ALL platforms

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';
import 'package:gravity_habit/services/ads/ad_manager.dart';
import 'package:gravity_habit/services/ads/platforms/desktop_webview_banner.dart';
import 'package:gravity_habit/services/ads/platforms/web_adsense_banner.dart';

// DO NOT import mobile_banner.dart here — it contains google_mobile_ads
// Instead, construct it conditionally using a factory
import 'package:gravity_habit/services/ads/platforms/mobile_banner_factory.dart';

class AdBannerWidget extends ConsumerWidget {
  const AdBannerWidget({this.currentRoute = '/stats', super.key});

  final String currentRoute;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final adManager = ref.watch(adManagerProvider);

    if (!adManager.canShowBanner(currentRoute)) {
      return const SizedBox.shrink();
    }

    return switch (AdConfig.currentTier) {
      AdPlatformTier.nativeMobile => MobileBannerFactory.create(
          adUnitId: AdConfig.mobileBannerAdUnitId,
        ),
      AdPlatformTier.desktopWebView => const DesktopWebViewBanner(),
      AdPlatformTier.webAdsense => const WebAdsenseBanner(),
      AdPlatformTier.noAdsWatch => const SizedBox.shrink(),
      AdPlatformTier.spatialStub => const SizedBox.shrink(),
    };
  }
}
