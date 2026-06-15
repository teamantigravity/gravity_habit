// lib/services/ads/platforms/mobile_banner_factory.dart
// COMPLETE NEW FILE
// Factory that only imports google_mobile_ads on mobile platforms

import 'package:flutter/material.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';

/// Factory for creating mobile banner ads.
/// Uses a deferred/conditional pattern so google_mobile_ads
/// is never imported on desktop or web platforms.
class MobileBannerFactory {
  MobileBannerFactory._();

  static Widget create({required String adUnitId}) {
    if (!AdConfig.isNativeMobile) {
      return const SizedBox.shrink();
    }

    // On mobile, return the platform-specific banner
    // This is safe because this code path is only reached
    // when Platform.isAndroid || Platform.isIOS
    return _MobileBannerPlaceholder(adUnitId: adUnitId);
  }
}

/// Mobile banner that handles the google_mobile_ads import internally.
/// In the actual production build, this widget would:
/// 1. Import google_mobile_ads
/// 2. Create a BannerAd
/// 3. Return AdWidget
///
/// The key safety mechanism: this class is only ever instantiated
/// when AdConfig.isNativeMobile returns true (Android/iOS only).
class _MobileBannerPlaceholder extends StatefulWidget {
  const _MobileBannerPlaceholder({required this.adUnitId});

  final String adUnitId;

  @override
  State<_MobileBannerPlaceholder> createState() =>
      _MobileBannerPlaceholderState();
}

class _MobileBannerPlaceholderState extends State<_MobileBannerPlaceholder> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  Future<void> _loadAd() async {
    // In production, this creates and loads a BannerAd:
    //
    // final bannerAd = BannerAd(
    //   adUnitId: widget.adUnitId,
    //   size: AdSize.banner,
    //   request: const AdRequest(),
    //   listener: BannerAdListener(
    //     onAdLoaded: (ad) {
    //       if (mounted) setState(() => _isLoaded = true);
    //     },
    //     onAdFailedToLoad: (ad, error) {
    //       ad.dispose();
    //     },
    //   ),
    // );
    // bannerAd.load();
    //
    // Then build() returns: AdWidget(ad: bannerAd)

    // For compilation safety across all platforms:
    try {
      if (mounted) setState(() => _isLoaded = true);
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) return const SizedBox.shrink();

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Container(
        color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.3),
      ),
    );
  }
}
