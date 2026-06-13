import 'package:flutter/material.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';

/// Desktop interstitial ad using a full-screen overlay with WebView.
///
/// Since there's no native interstitial SDK for desktop,
/// we render a full-screen modal containing a WebView with
/// an AdSense ad unit configured for interstitial/large-format display.
///
/// The user can dismiss after a brief countdown (3 seconds).
class DesktopInterstitialService {
  Future<bool> show(BuildContext context) async {
    if (!AdConfig.isDesktopWebView) return false;

    try {
      final result = await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        barrierColor: Colors.black87,
        builder: (ctx) => _DesktopInterstitialDialog(),
      );
      return result ?? false;
    } catch (e) {
      debugPrint('Desktop interstitial failed: $e');
      return false;
    }
  }
}

class _DesktopInterstitialDialog extends StatefulWidget {
  @override
  State<_DesktopInterstitialDialog> createState() =>
      _DesktopInterstitialDialogState();
}

class _DesktopInterstitialDialogState
    extends State<_DesktopInterstitialDialog> {
  bool _canDismiss = false;
  int _countdown = 3;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    Future.doWhile(() async {
      await Future<void>.delayed(const Duration(seconds: 1));
      if (!mounted) return false;
      setState(() => _countdown--);
      if (_countdown <= 0) {
        setState(() => _canDismiss = true);
        return false;
      }
      return true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      backgroundColor: Colors.transparent,
      child: Container(
        width: 600,
        height: 400,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            // WebView with AdSense large-format ad would go here
            // Same approach as DesktopWebViewBanner but with
            // a larger ad format (e.g., 300×250 or responsive)
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // In production: WebViewWidget with AdSense
                  SizedBox(
                    width: 300,
                    height: 250,
                    child: Container(
                      color: Theme.of(context)
                          .colorScheme
                          .surface
                          .withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ),

            // Close button (appears after countdown)
            Positioned(
              top: 8,
              right: 8,
              child: _canDismiss
                  ? IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context, true),
                    )
                  : Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black54,
                      ),
                      child: Center(
                        child: Text(
                          '$_countdown',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
