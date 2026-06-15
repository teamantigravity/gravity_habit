import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';
import 'package:gravity_habit/data/repositories/habit_repository.dart';
import 'package:gravity_habit/domain/entities/habit.dart';
import 'package:gravity_habit/features/onboarding/habit_templates.dart';
import 'package:gravity_habit/features/settings/settings_provider.dart';
import 'package:gravity_habit/services/haptics/haptic_service.dart';
import 'package:gravity_habit/services/notifications/notification_service.dart';
import 'package:gravity_habit/ui/widgets/cosmic_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  // Page 2 state
  final Set<String> _selectedTemplateIds = {};

  // Page 3 state
  TimeOfDay _reminderTime = const TimeOfDay(hour: 8, minute: 0);
  bool _remindersEnabled = true;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    ref.read(hapticServiceProvider).play(HapticType.tap);
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 380),
        curve: const Cubic(0.16, 1, 0.3, 1),
      );
    }
  }

  Future<void> _completeOnboarding() async {
    ref.read(hapticServiceProvider).play(HapticType.complete);

    // Create selected habits
    final repo = ref.read(habitRepositoryProvider);
    const templates = HabitTemplates.all;
    var order = 0;

    for (final templateId in _selectedTemplateIds) {
      final template = templates.firstWhere((t) => t.id == templateId);
      await repo.createHabit(
        Habit(
          id: '',
          name: template.name,
          emoji: template.emoji,
          color: template.color,
          description: template.description,
          frequency: HabitFrequency.daily,
          targetType: HabitTargetType.binary,
          targetValue: 1,
          unit: '',
          reminderTimes: _remindersEnabled
              ? [
                  TimeOfDayData(
                    hour: _reminderTime.hour,
                    minute: _reminderTime.minute,
                  ),
                ]
              : [],
          reminderDays: const [1, 2, 3, 4, 5, 6, 7],
          gravityClass: template.gravityClass,
          createdAt: DateTime.now(),
          order: order++,
          whyText: template.whyText,
        ),
      );
    }

    // Request notification permission if enabled
    if (_remindersEnabled) {
      await ref.read(notificationServiceProvider).requestPermission();
    }

    // Mark onboarded
    await ref.read(settingsProvider.notifier).update(
          (s) => s.copyWith(hasOnboarded: true),
        );

    if (mounted) {
      context.go('/today');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (page) => setState(() => _currentPage = page),
        children: [
          _WelcomePage(onContinue: _nextPage),
          _PickOrbitsPage(
            selectedIds: _selectedTemplateIds,
            onToggle: (id) {
              setState(() {
                if (_selectedTemplateIds.contains(id)) {
                  _selectedTemplateIds.remove(id);
                } else if (_selectedTemplateIds.length < 3) {
                  _selectedTemplateIds.add(id);
                }
              });
              ref.read(hapticServiceProvider).play(HapticType.tap);
            },
            onContinue: _nextPage,
          ),
          _ReminderPage(
            reminderTime: _reminderTime,
            remindersEnabled: _remindersEnabled,
            onTimeChanged: (time) => setState(() => _reminderTime = time),
            onToggle: (v) => setState(() => _remindersEnabled = v),
            onComplete: _completeOnboarding,
          ),
        ],
      ),
    );
  }
}

class _WelcomePage extends StatelessWidget {
  const _WelcomePage({required this.onContinue});

  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xxl),
        child: Column(
          children: [
            const Spacer(flex: 3),
            // Cosmic drift background effect
            SizedBox(
              height: 200,
              width: 200,
              child: CustomPaint(
                painter: _CosmicDriftPainter(
                  color: context.colors.primary,
                ),
              ),
            )
                .animate(onPlay: (c) => c.repeat(reverse: true))
                .scaleXY(
                  begin: 0.95,
                  end: 1.05,
                  duration: 8.seconds,
                  curve: Curves.easeInOut,
                )
                .animate()
                .fadeIn(duration: 800.ms),
            const SizedBox(height: Spacing.xxxl),
            Text(
              'Small actions.\nMassive pull.',
              textAlign: TextAlign.center,
              style: context.textTheme.displaySmall?.copyWith(
                fontFamily: 'SpaceGrotesk',
                fontWeight: FontWeight.w700,
              ),
            )
                .animate()
                .fadeIn(delay: 200.ms, duration: 600.ms)
                .slideY(begin: 0.1, end: 0),
            const SizedBox(height: Spacing.md),
            Text(
              'Gravity Habit',
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(
                color: context.colors.primary,
                fontFamily: 'SpaceGrotesk',
              ),
            ).animate().fadeIn(delay: 500.ms, duration: 600.ms),
            const Spacer(flex: 2),
            CosmicButton(
              label: 'Begin',
              onPressed: onContinue,
              isExpanded: true,
            ).animate().fadeIn(delay: 800.ms, duration: 400.ms),
            const SizedBox(height: Spacing.md),
            Text(
              'No account. No tracking. Ever.',
              style: context.textTheme.bodySmall?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.5),
              ),
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 1000.ms, duration: 400.ms),
            const SizedBox(height: Spacing.xxl),
          ],
        ),
      ),
    );
  }
}

class _CosmicDriftPainter extends CustomPainter {
  _CosmicDriftPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Core glow
    final coreGradient = RadialGradient(
      colors: [
        color.withValues(alpha: 0.6),
        color.withValues(alpha: 0.2),
        color.withValues(alpha: 0.05),
        Colors.transparent,
      ],
      stops: const [0.0, 0.3, 0.6, 1.0],
    );

    final corePaint = Paint()
      ..shader = coreGradient.createShader(
        Rect.fromCircle(center: center, radius: size.width / 2),
      );
    canvas.drawCircle(center, size.width / 2, corePaint);

    // Orbit rings
    for (var i = 1; i <= 3; i++) {
      final ringPaint = Paint()
        ..color = color.withValues(alpha: 0.1 + i * 0.03)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1;
      canvas.drawCircle(center, 30.0 + i * 25.0, ringPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PickOrbitsPage extends StatelessWidget {
  const _PickOrbitsPage({
    required this.selectedIds,
    required this.onToggle,
    required this.onContinue,
  });

  final Set<String> selectedIds;
  final void Function(String) onToggle;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    final starterTemplates = HabitTemplates.starters;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Spacing.xxl),
            Text(
              'What pulls you forward?',
              style: context.textTheme.headlineMedium?.copyWith(
                fontFamily: 'SpaceGrotesk',
              ),
            ).animate().fadeIn(duration: 400.ms),
            const SizedBox(height: Spacing.xs),
            Text(
              'Choose up to 3 habits to begin. You can always add more.',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.colors.onSurface.withValues(alpha: 0.6),
              ),
            ).animate().fadeIn(delay: 100.ms, duration: 400.ms),
            const SizedBox(height: Spacing.xl),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.isTablet ? 4 : 3,
                  childAspectRatio: 0.85,
                  crossAxisSpacing: Spacing.sm,
                  mainAxisSpacing: Spacing.sm,
                ),
                itemCount: starterTemplates.length,
                itemBuilder: (context, index) {
                  final template = starterTemplates[index];
                  final isSelected = selectedIds.contains(template.id);
                  return _OrbitCard(
                    template: template,
                    isSelected: isSelected,
                    onTap: () => onToggle(template.id),
                  ).animate().fadeIn(
                        delay: Duration(milliseconds: 50 * index),
                        duration: 300.ms,
                      );
                },
              ),
            ),
            const SizedBox(height: Spacing.md),
            CosmicButton(
              label: 'Continue →',
              onPressed: selectedIds.isNotEmpty ? onContinue : null,
              isExpanded: true,
            ),
            const SizedBox(height: Spacing.md),
          ],
        ),
      ),
    );
  }
}

class _OrbitCard extends StatelessWidget {
  const _OrbitCard({
    required this.template,
    required this.isSelected,
    required this.onTap,
  });

  final HabitTemplate template;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Semantics(
        label: '${template.name}, ${isSelected ? "selected" : "not selected"}',
        button: true,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: const Cubic(0.16, 1, 0.3, 1),
          decoration: BoxDecoration(
            color: isSelected
                ? context.colors.primaryContainer
                : context.colors.surface,
            borderRadius: BorderRadius.circular(CornerRadii.md),
            border: Border.all(
              color: isSelected
                  ? context.colors.primary
                  : context.colors.outlineVariant.withValues(alpha: 0.3),
              width: isSelected ? 2 : 1,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: context.colors.primary.withValues(alpha: 0.15),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : null,
          ),
          transform: isSelected
              ? Matrix4.translationValues(0.0, -4.0, 0.0)
              : Matrix4.identity(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                template.emoji,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(height: Spacing.xs),
              Text(
                template.name,
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ReminderPage extends StatelessWidget {
  const _ReminderPage({
    required this.reminderTime,
    required this.remindersEnabled,
    required this.onTimeChanged,
    required this.onToggle,
    required this.onComplete,
  });

  final TimeOfDay reminderTime;
  final bool remindersEnabled;
  final ValueChanged<TimeOfDay> onTimeChanged;
  final ValueChanged<bool> onToggle;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Spacing.xxl),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Text(
              'When does your\nday begin?',
              textAlign: TextAlign.center,
              style: context.textTheme.headlineMedium?.copyWith(
                fontFamily: 'SpaceGrotesk',
              ),
            ).animate().fadeIn(duration: 400.ms),
            const SizedBox(height: Spacing.xxxl),
            // Time wheel
            SizedBox(
              height: 200,
              child: _TimeWheelPicker(
                initialTime: reminderTime,
                onChanged: onTimeChanged,
              ),
            ).animate().fadeIn(delay: 200.ms, duration: 400.ms),
            const SizedBox(height: Spacing.xxl),
            // Reminder toggle
            GestureDetector(
              onTap: () => onToggle(!remindersEnabled),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 48,
                    height: 28,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: remindersEnabled
                          ? context.colors.primary
                          : context.colors.outlineVariant,
                    ),
                    child: AnimatedAlign(
                      duration: const Duration(milliseconds: 200),
                      alignment: remindersEnabled
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        width: 22,
                        height: 22,
                        margin: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Text(
                    'Send gentle reminders',
                    style: context.textTheme.bodyLarge,
                  ),
                ],
              ),
            ).animate().fadeIn(delay: 400.ms, duration: 400.ms),
            const Spacer(flex: 3),
            CosmicButton(
              label: 'Enter the cosmos',
              onPressed: onComplete,
              isExpanded: true,
            ).animate().fadeIn(delay: 600.ms, duration: 400.ms),
            const SizedBox(height: Spacing.xxl),
          ],
        ),
      ),
    );
  }
}

class _TimeWheelPicker extends StatefulWidget {
  const _TimeWheelPicker({
    required this.initialTime,
    required this.onChanged,
  });

  final TimeOfDay initialTime;
  final ValueChanged<TimeOfDay> onChanged;

  @override
  State<_TimeWheelPicker> createState() => _TimeWheelPickerState();
}

class _TimeWheelPickerState extends State<_TimeWheelPicker> {
  late FixedExtentScrollController _hourController;
  late FixedExtentScrollController _minuteController;
  late int _selectedHour;
  late int _selectedMinute;

  @override
  void initState() {
    super.initState();
    _selectedHour = widget.initialTime.hour;
    _selectedMinute = widget.initialTime.minute;
    _hourController = FixedExtentScrollController(
      initialItem: _selectedHour,
    );
    _minuteController = FixedExtentScrollController(
      initialItem: _selectedMinute ~/ 5,
    );
  }

  @override
  void dispose() {
    _hourController.dispose();
    _minuteController.dispose();
    super.dispose();
  }

  void _notifyChange() {
    widget.onChanged(TimeOfDay(hour: _selectedHour, minute: _selectedMinute));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Hours
        SizedBox(
          width: 70,
          child: ListWheelScrollView.useDelegate(
            controller: _hourController,
            itemExtent: 48,
            physics: const FixedExtentScrollPhysics(),
            diameterRatio: 1.5,
            onSelectedItemChanged: (index) {
              _selectedHour = index;
              _notifyChange();
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index < 0 || index > 23) return null;
                final isSelected = index == _selectedHour;
                return Center(
                  child: Text(
                    index.toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontFamily: 'SpaceGrotesk',
                      fontSize: isSelected ? 32 : 20,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w400,
                      color: isSelected
                          ? context.colors.primary
                          : context.colors.onSurface.withValues(alpha: 0.3),
                    ),
                  ),
                );
              },
              childCount: 24,
            ),
          ),
        ),
        Text(
          ':',
          style: TextStyle(
            fontFamily: 'SpaceGrotesk',
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: context.colors.onSurface,
          ),
        ),
        // Minutes (5-min increments)
        SizedBox(
          width: 70,
          child: ListWheelScrollView.useDelegate(
            controller: _minuteController,
            itemExtent: 48,
            physics: const FixedExtentScrollPhysics(),
            diameterRatio: 1.5,
            onSelectedItemChanged: (index) {
              _selectedMinute = index * 5;
              _notifyChange();
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index < 0 || index > 11) return null;
                final minute = index * 5;
                final isSelected = minute == _selectedMinute;
                return Center(
                  child: Text(
                    minute.toString().padLeft(2, '0'),
                    style: TextStyle(
                      fontFamily: 'SpaceGrotesk',
                      fontSize: isSelected ? 32 : 20,
                      fontWeight:
                          isSelected ? FontWeight.w700 : FontWeight.w400,
                      color: isSelected
                          ? context.colors.primary
                          : context.colors.onSurface.withValues(alpha: 0.3),
                    ),
                  ),
                );
              },
              childCount: 12,
            ),
          ),
        ),
      ],
    );
  }
}
