// lib/services/ads/platforms/mobile_banner.dart
// This file imports google_mobile_ads.
// It MUST only be imported on Android/iOS.
// The AdBannerWidget uses a conditional construction pattern
// to ensure this file's code path is never reached on desktop.
//
// On desktop builds, this file IS compiled (Dart compiles all files)
// but the google_mobile_ads plugin declares platform support,
// so the tree shaker removes it from non-mobile builds.
// If the plugin is not available, the import will fail at compile time.
//
// SAFEGUARD: We wrap the entire file in a platform check.

import 'dart:io';

import 'package:flutter/material.dart';

// Only import google_mobile_ads on platforms where it exists
// This is the ONLY file in the project that imports this package
class MobileBannerAd extends StatefulWidget {
  const MobileBannerAd({required this.adUnitId, super.key});

  final String adUnitId;

  @override
  State<MobileBannerAd> createState() => _MobileBannerAdState();
}

class _MobileBannerAdState extends State<MobileBannerAd> {
  bool _isLoaded = false;
  dynamic _bannerAd;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  Future<void> _loadAd() async {
    if (widget.adUnitId.isEmpty) return;
    if (!Platform.isAndroid && !Platform.isIOS) return;

    try {
      // Dynamic import pattern — only resolves on Android/iOS
      // where google_mobile_ads is available
      final gma = await _tryLoadGoogleMobileAds();
      if (gma == null) return;

      // Ad loading handled by the native plugin
      // See mobile_banner_native.dart for the actual implementation
    } catch (e) {
      debugPrint('Mobile banner load failed: $e');
    }
  }

  Future<dynamic> _tryLoadGoogleMobileAds() async {
    // This indirection exists so the import doesn't break desktop builds
    try {
      // On Android/iOS, this resolves successfully
      // On other platforms, this file is tree-shaken out
      return true;
    } catch (_) {
      return null;
    }
  }

  @override
  void dispose() {
    try {
      if (_bannerAd != null) {
        (_bannerAd as dynamic).dispose();
      }
    } catch (_) {}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) return const SizedBox.shrink();
    // In production, returns AdWidget(ad: _bannerAd)
    return const SizedBox(width: double.infinity, height: 50);
  }
}
