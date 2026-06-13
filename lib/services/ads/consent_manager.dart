// lib/services/ads/consent_manager.dart
// COMPLETE CORRECTED FILE

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gravity_habit/services/ads/ad_config.dart';

class ConsentManager {
  ConsentManager._();

  static bool _consentGathered = false;
  static bool _hasConsent = false;

  static bool get isConsentGathered => _consentGathered;
  static bool get hasConsent => _hasConsent;

  static Future<void> initialize({
    bool Function()? checkIfEeaUser,
  }) async {
    if (!AdConfig.canServeAds) {
      _consentGathered = true;
      return;
    }

    if (AdConfig.isNativeMobile) {
      await _initializeMobileConsent();
    } else {
      final isEea = checkIfEeaUser?.call() ?? false;
      if (isEea) {
        _consentGathered = false;
      } else {
        _consentGathered = true;
        _hasConsent = false;
      }
    }
  }

  static Future<void> _initializeMobileConsent() async {
    try {
      // On mobile, google_mobile_ads UMP handles this.
      // ConsentInformation.instance.requestConsentInfoUpdate(...)
      // For now, mark as gathered to prevent blocking.
      _consentGathered = true;
    } catch (e) {
      debugPrint('Mobile consent failed: $e');
      _consentGathered = true;
    }
  }

  static Future<bool> showDesktopConsentDialog(
    BuildContext context,
  ) async {
    if (_consentGathered) return _hasConsent;

    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Ad Preferences'),
        content: const Text(
          'We show small ads to support Gravity Habit. '
          'Would you like personalized ads based on your interests, '
          'or non-personalized ads?\n\n'
          'You can change this anytime in Settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Non-personalized'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Personalized'),
          ),
        ],
      ),
    );

    _consentGathered = true;
    _hasConsent = result ?? false;
    return _hasConsent;
  }

  static void reset() {
    _consentGathered = false;
    _hasConsent = false;
  }
}
