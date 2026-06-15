import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/features/settings/settings_provider.dart';
import 'package:gravity_habit/services/haptics/haptic_service.dart';

class RemoveAdsScreen extends ConsumerWidget {
  const RemoveAdsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(Spacing.xxl),
          child: Column(
            children: [
              const Spacer(flex: 2),

              // Serene cosmos illustration
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      context.colors.primary.withValues(alpha: 0.3),
                      context.colors.primary.withValues(alpha: 0.05),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Icon(
                  Icons.auto_awesome,
                  size: 64,
                  color: context.colors.primary.withValues(alpha: 0.8),
                ),
              ).animate().fadeIn(duration: 600.ms).scaleXY(begin: 0.8, end: 1),

              const SizedBox(height: Spacing.xxl),

              Text(
                'Support Gravity Habit.\nRemove ads.',
                textAlign: TextAlign.center,
                style: context.textTheme.headlineSmall?.copyWith(
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.w700,
                ),
              ).animate().fadeIn(delay: 200.ms, duration: 400.ms),

              const SizedBox(height: Spacing.sm),

              Text(
                'Everything else is already yours. Forever.',
                textAlign: TextAlign.center,
                style: context.textTheme.bodyLarge?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.6),
                ),
              ).animate().fadeIn(delay: 400.ms, duration: 400.ms),

              const Spacer(),

              // Pricing cards
              _PricingCard(
                title: 'Lifetime',
                price: r'$9.99',
                period: 'One-time purchase',
                isRecommended: true,
                onTap: () => _purchase(context, ref, 'lifetime'),
              ).animate().fadeIn(delay: 600.ms, duration: 300.ms),

              const SizedBox(height: Spacing.sm),

              _PricingCard(
                title: 'Yearly',
                price: r'$3.99',
                period: 'per year',
                onTap: () => _purchase(context, ref, 'yearly'),
              ).animate().fadeIn(delay: 700.ms, duration: 300.ms),

              const SizedBox(height: Spacing.sm),

              _PricingCard(
                title: 'Monthly',
                price: r'$0.99',
                period: 'per month',
                onTap: () => _purchase(context, ref, 'monthly'),
              ).animate().fadeIn(delay: 800.ms, duration: 300.ms),

              const SizedBox(height: Spacing.md),

              TextButton(
                onPressed: () => _restore(context, ref),
                child: Text(
                  'Restore purchases',
                  style: TextStyle(
                    color: context.colors.onSurface.withValues(alpha: 0.5),
                  ),
                ),
              ),

              const SizedBox(height: Spacing.xs),

              Text(
                'Cancel anytime from your device settings.\nPrices may vary by region.',
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.onSurface.withValues(alpha: 0.3),
                ),
              ),

              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _purchase(
    BuildContext context,
    WidgetRef ref,
    String sku,
  ) async {
    ref.read(hapticServiceProvider).play(HapticType.tap);
    // IAP purchase flow would go here
    // For now, simulate
    await ref.read(settingsProvider.notifier).update(
          (s) => s.copyWith(adsRemoved: true),
        );
    if (context.mounted) {
      ref.read(hapticServiceProvider).play(HapticType.complete);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Ads removed. Thank you.')),
      );
      Navigator.pop(context);
    }
  }

  Future<void> _restore(BuildContext context, WidgetRef ref) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Checking for previous purchases...')),
    );
    // IAP restore flow
  }
}

class _PricingCard extends StatelessWidget {
  const _PricingCard({
    required this.title,
    required this.price,
    required this.period,
    required this.onTap,
    this.isRecommended = false,
  });

  final String title;
  final String price;
  final String period;
  final VoidCallback onTap;
  final bool isRecommended;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.xl,
          vertical: Spacing.md,
        ),
        decoration: BoxDecoration(
          color: isRecommended
              ? context.colors.primaryContainer.withValues(alpha: 0.2)
              : context.colors.surface,
          borderRadius: BorderRadius.circular(CornerRadii.md),
          border: Border.all(
            color: isRecommended
                ? context.colors.primary
                : context.colors.outlineVariant.withValues(alpha: 0.2),
            width: isRecommended ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        title,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      if (isRecommended) ...[
                        const SizedBox(width: Spacing.xs),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: context.colors.primary,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            'BEST',
                            style: TextStyle(
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              color: context.colors.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  Text(
                    period,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colors.onSurface.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              price,
              style: context.textTheme.headlineSmall?.copyWith(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
