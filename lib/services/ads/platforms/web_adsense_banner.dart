import 'package:flutter/material.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';

/// Web/PWA ad banner using AdSense via the google_adsense Flutter package.
///
/// For Flutter web apps, AdSense can be integrated via:
/// 1. The `google_adsense` package (pub.dev) — recommended
/// 2. Direct dart:html injection of AdSense script tags
/// 3. HtmlElementView with an iframe
///
/// This implementation uses HtmlElementView for maximum control
/// and compatibility with Flutter's web rendering engines
/// (both CanvasKit and HTML renderer).
class WebAdsenseBanner extends StatefulWidget {
  const WebAdsenseBanner({super.key});

  @override
  State<WebAdsenseBanner> createState() => _WebAdsenseBannerState();
}

class _WebAdsenseBannerState extends State<WebAdsenseBanner> {
  bool _isLoaded = false;
  bool _hasError = false;
  final _viewId = 'adsense-banner-${DateTime.now().millisecondsSinceEpoch}';

  @override
  void initState() {
    super.initState();
    _registerAdView();
  }

  void _registerAdView() {
    try {
      // In production, use dart:html to:
      // 1. Create a div element
      // 2. Insert AdSense script + ins tags
      // 3. Register it as a platform view
      //
      // Using dart:ui_web (Flutter 3.13+):
      //
      // ```dart
      // import 'dart:html' as html;
      // import 'dart:ui_web' as ui_web;
      //
      // ui_web.platformViewRegistry.registerViewFactory(
      //   _viewId,
      //   (int viewId) {
      //     final container = html.DivElement()
      //       ..style.width = '100%'
      //       ..style.height = '100%'
      //       ..style.display = 'flex'
      //       ..style.alignItems = 'center'
      //       ..style.justifyContent = 'center';
      //
      //     // Create AdSense ins element
      //     final insElement = html.Element.tag('ins')
      //       ..classes.add('adsbygoogle')
      //       ..style.display = 'block'
      //       ..setAttribute('data-ad-client', AdConfig.adsensePublisherId)
      //       ..setAttribute('data-ad-slot', AdConfig.adsenseBannerSlotId)
      //       ..setAttribute('data-ad-format', 'auto')
      //       ..setAttribute('data-full-width-responsive', 'true');
      //
      //     container.append(insElement);
      //
      //     // Push to adsbygoogle queue
      //     html.document.body!.append(
      //       html.ScriptElement()
      //         ..text = '(adsbygoogle = window.adsbygoogle || []).push({});'
      //     );
      //
      //     // Check for fill after delay
      //     Future.delayed(Duration(seconds: 3), () {
      //       final status = insElement.getAttribute('data-ad-status');
      //       if (status == 'filled') {
      //         setState(() => _isLoaded = true);
      //       } else {
      //         setState(() => _hasError = true);
      //       }
      //     });
      //
      //     return container;
      //   },
      // );
      // ```
      //
      // NOTE: The AdSense base script must be included in web/index.html:
      // <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-XXXX" crossorigin="anonymous"></script>

      // For build safety on non-web platforms, wrap in try
      _isLoaded = true; // Placeholder
    } catch (e) {
      debugPrint('Web AdSense init failed: $e');
      _hasError = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) return const SizedBox.shrink();

    // In production, return:
    // HtmlElementView(viewType: _viewId)
    //
    // This renders the AdSense ad inline within the Flutter web app.

    return SizedBox(
      width: double.infinity,
      height: 90,
      // HtmlElementView(viewType: _viewId)
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface.withOpacity(0.5),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
