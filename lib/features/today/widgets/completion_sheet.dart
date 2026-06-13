import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';
import 'package:gravity_habit/features/today/providers/today_provider.dart';
import 'package:gravity_habit/features/today/widgets/completion_animation.dart';
import 'package:gravity_habit/services/audio/audio_service.dart';
import 'package:gravity_habit/services/haptics/haptic_service.dart';
import 'package:gravity_habit/ui/widgets/cosmic_button.dart';

class CompletionSheet extends ConsumerStatefulWidget {
  const CompletionSheet({required this.habitId, super.key});

  final String habitId;

  @override
  ConsumerState<CompletionSheet> createState() => _CompletionSheetState();
}

class _CompletionSheetState extends ConsumerState<CompletionSheet> {
  String? _note;
  int? _selectedMood;
  bool _isCompleting = false;
  bool _showCelebration = false;

  @override
  Widget build(BuildContext context) {
    final todayState = ref.watch(todayProvider);

    return todayState.maybeWhen(
      data: (state) {
        final habit = state.habits.firstWhere(
          (h) => h.id == widget.habitId,
        );
        final entry = state.todayEntries
            .where((e) => e.habitId == widget.habitId)
            .firstOrNull;
        final isAlreadyComplete = entry?.isComplete ?? false;
        final streak = state.streaks[widget.habitId] ?? 0;

        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(28),
                ),
              ),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom +
                    context.padding.bottom +
                    Spacing.md,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Handle
                    Container(
                      margin: const EdgeInsets.only(top: Spacing.sm),
                      width: 36,
                      height: 4,
                      decoration: BoxDecoration(
                        color: context.colors.outlineVariant.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),

                    const SizedBox(height: Spacing.xl),

                    // Hero: Emoji + Name + Streak
                    Text(
                      habit.emoji,
                      style: const TextStyle(fontSize: 56),
                    ).animate().scaleXY(
                          begin: 0.8,
                          end: 1,
                          duration: 300.ms,
                          curve: const Cubic(0.16, 1, 0.3, 1),
                        ),
                    const SizedBox(height: Spacing.sm),
                    Text(
                      habit.name,
                      style: context.textTheme.headlineSmall?.copyWith(
                        fontFamily: 'SpaceGrotesk',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (streak > 0)
                      Padding(
                        padding: const EdgeInsets.only(top: Spacing.xxs),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.local_fire_department_rounded,
                              size: 16,
                              color: context.colors.primary,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '$streak day streak',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: context.colors.primary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),

                    const SizedBox(height: Spacing.xxl),

                    // Primary action
                    if (!isAlreadyComplete) _buildPrimaryAction(habit),

                    if (isAlreadyComplete)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.xxl,
                        ),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(Spacing.md),
                          decoration: BoxDecoration(
                            color: context.colors.primaryContainer,
                            borderRadius:
                                BorderRadius.circular(CornerRadii.md),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: context.colors.primary,
                              ),
                              const SizedBox(width: Spacing.xs),
                              Text(
                                'Completed',
                                style:
                                    context.textTheme.titleMedium?.copyWith(
                                  color: context.colors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                    const SizedBox(height: Spacing.xl),

                    // Mood selector
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.xxl,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (index) {
                          final moods = ['😔', '😐', '🙂', '😊', '🤩'];
                          final isSelected = _selectedMood == index + 1;
                          return GestureDetector(
                            onTap: () {
                              setState(() => _selectedMood = index + 1);
                              ref
                                  .read(hapticServiceProvider)
                                  .play(HapticType.tap);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: isSelected
                                    ? context.colors.primaryContainer
                                    : Colors.transparent,
                                border: isSelected
                                    ? Border.all(
                                        color: context.colors.primary,
                                        width: 2,
                                      )
                                    : null,
                              ),
                              child: Center(
                                child: Text(
                                  moods[index],
                                  style: TextStyle(
                                    fontSize: isSelected ? 24 : 20,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),

                    const SizedBox(height: Spacing.md),

                    // Note field
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Spacing.xxl,
                      ),
                      child: TextField(
                        maxLength: 280,
                        maxLines: 2,
                        onChanged: (v) => _note = v,
                        decoration: InputDecoration(
                          hintText: 'Add a note...',
                          hintStyle: TextStyle(
                            color:
                                context.colors.onSurface.withOpacity(0.3),
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(CornerRadii.sm),
                            borderSide: BorderSide(
                              color: context.colors.outlineVariant,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(CornerRadii.sm),
                            borderSide: BorderSide(
                              color: context.colors.outlineVariant
                                  .withOpacity(0.3),
                            ),
                          ),
                          counterText: '',
                          contentPadding: const EdgeInsets.all(Spacing.sm),
                        ),
                      ),
                    ),

                    const SizedBox(height: Spacing.md),

                    // Skip options
                    if (!isAlreadyComplete)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.xxl,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _SkipChip(
                              label: '🤒 Sick',
                              onTap: () => _skip('sick'),
                            ),
                            const SizedBox(width: Spacing.xs),
                            _SkipChip(
                              label: '✈️ Traveling',
                              onTap: () => _skip('traveling'),
                            ),
                            const SizedBox(width: Spacing.xs),
                            _SkipChip(
                              label: '💤 Rest',
                              onTap: () => _skip('restDay'),
                            ),
                          ],
                        ),
                      ),

                    // Why text
                    if (habit.whyText != null &&
                        habit.whyText!.isNotEmpty) ...[
                      const SizedBox(height: Spacing.md),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: Spacing.xxl,
                        ),
                        child: Text(
                          habit.whyText!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colors.onSurface.withOpacity(0.4),
                            fontStyle: FontStyle.italic,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],

                    const SizedBox(height: Spacing.md),
                  ],
                ),
              ),
            ),

            // Celebration overlay
            if (_showCelebration)
              Positioned.fill(
                child: CompletionAnimation(
                  color: Color(habit.color),
                  onComplete: () {
                    setState(() => _showCelebration = false);
                    Navigator.of(context).pop();
                  },
                ),
              ),
          ],
        );
      },
      orElse: () => const SizedBox(height: 200),
    );
  }

  Widget _buildPrimaryAction(habit) {
    if (habit.targetType == HabitTargetType.binary) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: Spacing.xxl),
        child: SizedBox(
          width: double.infinity,
          height: 64,
          child: CosmicButton(
            label: 'Complete',
            isExpanded: true,
            onPressed: _isCompleting ? null : () => _complete(),
          ),
        ),
      );
    }

    // Count / duration / distance — show counter or timer
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.xxl),
      child: Column(
        children: [
          Text(
            'Target: ${habit.targetValue.toStringAsFixed(0)} ${habit.unit}',
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colors.onSurface.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: Spacing.md),
          SizedBox(
            width: double.infinity,
            height: 64,
            child: CosmicButton(
              label: 'Complete',
              isExpanded: true,
              onPressed: _isCompleting ? null : () => _complete(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _complete() async {
    setState(() => _isCompleting = true);

    // Play haptic & audio
    ref.read(hapticServiceProvider).play(HapticType.complete);
    ref.read(audioServiceProvider).play(SoundEvent.complete);

    await ref.read(todayProvider.notifier).completeHabit(
          widget.habitId,
          note: _note,
          mood: _selectedMood,
        );

    if (mounted) {
      setState(() {
        _showCelebration = true;
        _isCompleting = false;
      });
    }
  }

  Future<void> _skip(String reason) async {
    ref.read(hapticServiceProvider).play(HapticType.tap);
    await ref.read(todayProvider.notifier).skipHabit(
          widget.habitId,
          reason,
        );
    if (mounted) Navigator.of(context).pop();
  }
}

class _SkipChip extends StatelessWidget {
  const _SkipChip({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Spacing.sm,
          vertical: Spacing.xs,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CornerRadii.xl),
          border: Border.all(
            color: context.colors.outlineVariant.withOpacity(0.3),
          ),
        ),
        child: Text(
          label,
          style: context.textTheme.labelSmall?.copyWith(
            fontFamily: 'Inter',
            color: context.colors.onSurface.withOpacity(0.6),
          ),
        ),
      ),
    );
  }
}
