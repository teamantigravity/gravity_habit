import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/features/settings/settings_provider.dart';
import 'package:gravity_habit/services/ads/ad_service.dart';
import 'package:gravity_habit/services/haptics/haptic_service.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(settingsProvider);
    final notifier = ref.read(settingsProvider.notifier);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Spacing.md),
          children: [
            const SizedBox(height: Spacing.sm),
            Text(
              'Settings',
              style: context.textTheme.headlineSmall?.copyWith(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: Spacing.xl),

            // ---- APPEARANCE ----
            _SectionHeader('Appearance'),
            _SettingsTile(
              title: 'Theme',
              subtitle: switch (settings.themeMode) {
                ThemeMode.system => 'System',
                ThemeMode.light => 'Light',
                ThemeMode.dark => 'Dark',
              },
              onTap: () => _showThemePicker(context, notifier, settings),
            ),
            _SettingsTile(
              title: 'Palette',
              subtitle: settings.paletteId.capitalize(),
              onTap: () => _showPalettePicker(context, notifier, settings),
            ),
            _SwitchTile(
              title: 'Reduce Motion',
              value: settings.reduceMotion,
              onChanged: (v) => notifier.update((s) => s.copyWith(reduceMotion: v)),
            ),
            _SwitchTile(
              title: 'High Contrast',
              value: settings.highContrast,
              onChanged: (v) => notifier.update((s) => s.copyWith(highContrast: v)),
            ),
            _SwitchTile(
              title: 'Dyslexia Font',
              value: settings.dyslexiaFont,
              onChanged: (v) => notifier.update((s) => s.copyWith(dyslexiaFont: v)),
            ),
            _SettingsTile(
              title: 'Font Scale',
              subtitle: '${(settings.fontScale * 100).round()}%',
              onTap: () => _showFontScaleDialog(context, notifier, settings),
            ),

            const SizedBox(height: Spacing.xl),
            _SectionHeader('Sound & Haptics'),
            _SwitchTile(
              title: 'Sound',
              value: settings.soundEnabled,
              onChanged: (v) => notifier.update((s) => s.copyWith(soundEnabled: v)),
            ),
            _SettingsTile(
              title: 'Haptic Intensity',
              subtitle: switch (settings.hapticIntensity) {
                0 => 'Off',
                1 => 'Subtle',
                2 => 'Standard',
                3 => 'Strong',
                _ => 'Standard',
              },
              onTap: () => _showHapticPicker(context, notifier, settings),
            ),

            const SizedBox(height: Spacing.xl),
            _SectionHeader('Notifications'),
            _SwitchTile(
              title: 'Smart Nudges',
              value: settings.smartNudgesEnabled,
              onChanged: (v) =>
                  notifier.update((s) => s.copyWith(smartNudgesEnabled: v)),
            ),
            _SwitchTile(
              title: 'Streak-Save Reminders',
              value: settings.streakSaveReminderEnabled,
              onChanged: (v) =>
                  notifier.update((s) => s.copyWith(streakSaveReminderEnabled: v)),
            ),
            _SwitchTile(
              title: 'Weekly Review',
              value: settings.weeklyReviewEnabled,
              onChanged: (v) =>
                  notifier.update((s) => s.copyWith(weeklyReviewEnabled: v)),
            ),

            const SizedBox(height: Spacing.xl),
            _SectionHeader('Privacy & Security'),
            _SwitchTile(
              title: 'App Lock',
              value: settings.appLockEnabled,
              onChanged: (v) =>
                  notifier.update((s) => s.copyWith(appLockEnabled: v)),
            ),
            _SwitchTile(
              title: 'Block Screenshots',
              value: settings.screenshotBlocking,
              onChanged: (v) =>
                  notifier.update((s) => s.copyWith(screenshotBlocking: v)),
            ),

            const SizedBox(height: Spacing.xl),
            _SectionHeader('Data'),
            _SettingsTile(
              title: 'Export Data',
              subtitle: 'JSON, CSV, or .gravity',
              onTap: () => _exportData(context, ref),
            ),
            _SettingsTile(
              title: 'Import Data',
              subtitle: 'Restore from file',
              onTap: () => _importData(context, ref),
            ),
            _SettingsTile(
              title: 'Reset App',
              subtitle: 'Delete all data',
              onTap: () => _confirmReset(context, ref),
              isDestructive: true,
            ),

            const SizedBox(height: Spacing.xl),
            _SectionHeader('Subscription'),
            if (!settings.adsRemoved)
              _SettingsTile(
                title: 'Remove Ads',
                subtitle: 'Everything else is already yours',
                onTap: () => context.push('/remove-ads'),
              ),
            if (settings.adsRemoved)
              _SettingsTile(
                title: 'Subscription',
                subtitle: 'Ads removed — thank you',
                onTap: () {},
              ),

            const SizedBox(height: Spacing.xl),
            _SectionHeader('About'),
            _SettingsTile(
              title: 'Version',
              subtitle: '1.0.0',
              onTap: () {},
            ),
            _SettingsTile(
              title: 'Privacy Policy',
              subtitle: '',
              onTap: () => launchUrl(Uri.parse('https://gravityhabit.app/privacy')),
            ),
            _SettingsTile(
              title: 'Open Source Licenses',
              subtitle: '',
              onTap: () => showLicensePage(
                context: context,
                applicationName: 'Gravity Habit',
                applicationVersion: '1.0.0',
              ),
            ),
            const SizedBox(height: Spacing.md),

            // The Promise
            Container(
              padding: const EdgeInsets.all(Spacing.md),
              decoration: BoxDecoration(
                color: context.colors.primaryContainer.withOpacity(0.1),
                borderRadius: BorderRadius.circular(CornerRadii.md),
                border: Border.all(
                  color: context.colors.primary.withOpacity(0.1),
                ),
              ),
              child: Text(
                'Gravity Habit will never ask for your email, your name, your phone number, '
                'or anything about you. Your data lives only on your device \u2014 we cannot see '
                'it, even if we wanted to. Every feature is free, forever. The only thing you '
                'can pay for is to remove the small banner ads that help keep the lights on, '
                'and even that is one-time if you\'d prefer.\n\n'
                'We will never sell your data because we don\'t have it. We will never spam you '
                'with notifications. We will never use dark patterns to manipulate you. We will '
                'never lock features behind paywalls.\n\n'
                'This app exists to help you become who you want to be \u2014 quietly, beautifully, '
                'on your own terms.\n\n'
                'Welcome to the cosmos. It\'s yours.',
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.colors.onSurface.withOpacity(0.6),
                  height: 1.5,
                ),
              ),
            ),

            // Banner ad slot at very bottom
            if (!settings.adsRemoved)
              const Padding(
                padding: EdgeInsets.only(top: Spacing.xl),
                child: AdBannerWidget(),
              ),

            const SizedBox(height: 120),
          ],
        ),
      ),
    );
  }

  void _showThemePicker(
    BuildContext context,
    SettingsNotifier notifier,
    AppSettings settings,
  ) {
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final mode in ThemeMode.values)
            ListTile(
              title: Text(mode.name.capitalize()),
              trailing: settings.themeMode == mode
                  ? Icon(Icons.check, color: context.colors.primary)
                  : null,
              onTap: () {
                notifier.update((s) => s.copyWith(themeMode: mode));
                Navigator.pop(ctx);
              },
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showPalettePicker(
    BuildContext context,
    SettingsNotifier notifier,
    AppSettings settings,
  ) {
    final palettes = ['midnight', 'nebula', 'aurora', 'void', 'solstice', 'dawn'];
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final p in palettes)
            ListTile(
              title: Text(p.capitalize()),
              trailing: settings.paletteId == p
                  ? Icon(Icons.check, color: context.colors.primary)
                  : null,
              onTap: () {
                notifier.update((s) => s.copyWith(paletteId: p));
                Navigator.pop(ctx);
              },
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showHapticPicker(
    BuildContext context,
    SettingsNotifier notifier,
    AppSettings settings,
  ) {
    final options = ['Off', 'Subtle', 'Standard', 'Strong'];
    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < options.length; i++)
            ListTile(
              title: Text(options[i]),
              trailing: settings.hapticIntensity == i
                  ? Icon(Icons.check, color: context.colors.primary)
                  : null,
              onTap: () {
                notifier.update((s) => s.copyWith(hapticIntensity: i));
                Navigator.pop(ctx);
              },
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void _showFontScaleDialog(
    BuildContext context,
    SettingsNotifier notifier,
    AppSettings settings,
  ) {
    var scale = settings.fontScale;
    showDialog<void>(
      context: context,
      builder: (ctx) => StatefulBuilder(
        builder: (ctx, setState) => AlertDialog(
          title: const Text('Font Scale'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Slider(
                value: scale,
                min: 0.9,
                max: 1.5,
                divisions: 12,
                label: '${(scale * 100).round()}%',
                onChanged: (v) => setState(() => scale = v),
              ),
              Text('${(scale * 100).round()}%'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                notifier.update((s) => s.copyWith(fontScale: scale));
                Navigator.pop(ctx);
              },
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _exportData(BuildContext context, WidgetRef ref) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Export feature — preparing data...')),
    );
    // Export implementation would serialize DB to JSON/CSV/.gravity
  }

  Future<void> _importData(BuildContext context, WidgetRef ref) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Import feature — select a file...')),
    );
  }

  Future<void> _confirmReset(BuildContext context, WidgetRef ref) async {
    final first = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reset App'),
        content: const Text('This will permanently delete ALL your data. Are you sure?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Continue', style: TextStyle(color: context.colors.error)),
          ),
        ],
      ),
    );

    if (first != true || !context.mounted) return;

    final second = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Are you absolutely sure?'),
        content: const Text('This cannot be undone. All habits, streaks, and progress will be lost.'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: const Text('Cancel')),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text('Delete Everything', style: TextStyle(color: context.colors.error)),
          ),
        ],
      ),
    );

    if (second == true) {
      // Reset DB
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('App reset. Restarting...')),
      );
    }
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: Spacing.xs),
      child: Text(
        title,
        style: context.textTheme.titleSmall?.copyWith(
          color: context.colors.primary,
          fontFamily: 'SpaceGrotesk',
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isDestructive = false,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: TextStyle(
          color: isDestructive ? context.colors.error : null,
        ),
      ),
      subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }
}

class _SwitchTile extends StatelessWidget {
  const _SwitchTile({
    required this.title,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}

extension _StringX on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}
