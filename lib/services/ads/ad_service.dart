import 'package:flutter/material.dart';
import 'package:gravity_habit/core/constants/spacing.dart';

/// Placeholder ad banner widget.
/// In production, this wraps google_mobile_ads BannerAd.
class AdBannerWidget extends StatelessWidget {
  const AdBannerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // In production: load and display a google_mobile_ads BannerAd
    // This placeholder shows the designated ad slot
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Theme.of(context).colorScheme.outlineVariant.withOpacity(0.1),
        ),
      ),
      child: Center(
        child: Text(
          'Ad',
          style: TextStyle(
            fontSize: 11,
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.2),
          ),
        ),
      ),
    );
  }
}
