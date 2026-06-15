import 'package:flutter/material.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/isar/schemas/habit_entry_schema.dart';
import 'package:gravity_habit/domain/entities/habit.dart';

class HabitListCard extends StatelessWidget {
  const HabitListCard({
    required this.habit,
    required this.onTap,
    required this.onComplete,
    required this.onSkip,
    this.entry,
    super.key,
  });

  final Habit habit;
  final HabitEntry? entry;
  final VoidCallback onTap;
  final VoidCallback onComplete;
  final void Function(String reason) onSkip;

  @override
  Widget build(BuildContext context) {
    final isComplete = entry?.isComplete ?? false;
    final isSkipped = entry?.skipReason != null;

    return Semantics(
      label:
          '${habit.name}, ${isComplete ? "completed" : isSkipped ? "skipped" : "pending"}',
      button: true,
      child: Dismissible(
        key: ValueKey(habit.id),
        direction:
            isComplete ? DismissDirection.none : DismissDirection.horizontal,
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.startToEnd) {
            // Swipe right to complete
            onComplete();
            return false;
          } else {
            // Swipe left to skip
            onSkip('other');
            return false;
          }
        },
        background: Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: Spacing.xl),
          decoration: BoxDecoration(
            color: context.colors.primary.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(CornerRadii.md),
          ),
          child: Icon(
            Icons.check_rounded,
            color: context.colors.primary,
          ),
        ),
        secondaryBackground: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: Spacing.xl),
          decoration: BoxDecoration(
            color: context.colors.outlineVariant.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(CornerRadii.md),
          ),
          child: Icon(
            Icons.skip_next_rounded,
            color: context.colors.onSurface.withValues(alpha: 0.5),
          ),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 240),
            padding: const EdgeInsets.symmetric(
              horizontal: Spacing.md,
              vertical: Spacing.sm,
            ),
            decoration: BoxDecoration(
              color: isComplete
                  ? context.colors.primaryContainer.withValues(alpha: 0.3)
                  : context.colors.surface,
              borderRadius: BorderRadius.circular(CornerRadii.md),
              border: Border.all(
                color: isComplete
                    ? context.colors.primary.withValues(alpha: 0.3)
                    : context.colors.outlineVariant.withValues(alpha: 0.15),
              ),
              boxShadow: isComplete
                  ? [
                      BoxShadow(
                        color: context.colors.primary.withValues(alpha: 0.08),
                        blurRadius: 16,
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                // Emoji
                Text(
                  habit.emoji,
                  style: TextStyle(
                    fontSize: 28,
                    color: isComplete ? null : null,
                  ),
                ),
                const SizedBox(width: Spacing.sm),

                // Name
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        habit.name,
                        style: context.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          decoration:
                              isComplete ? TextDecoration.lineThrough : null,
                          color: isComplete
                              ? context.colors.onSurface.withValues(alpha: 0.5)
                              : null,
                        ),
                      ),
                      if (isSkipped && entry?.skipReason != null)
                        Text(
                          _skipLabel(entry!.skipReason!),
                          style: context.textTheme.bodySmall?.copyWith(
                            color:
                                context.colors.onSurface.withValues(alpha: 0.4),
                          ),
                        ),
                    ],
                  ),
                ),

                // Ring progress
                SizedBox(
                  width: 36,
                  height: 36,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircularProgressIndicator(
                        value: isComplete ? 1.0 : 0.0,
                        strokeWidth: 3,
                        backgroundColor: context.colors.outlineVariant
                            .withValues(alpha: 0.2),
                        valueColor: AlwaysStoppedAnimation(
                          Color(habit.color),
                        ),
                      ),
                      if (isComplete)
                        Icon(
                          Icons.check_rounded,
                          size: 18,
                          color: Color(habit.color),
                        ),
                    ],
                  ),
                ),

                // Quick complete button
                if (!isComplete && !isSkipped) ...[
                  const SizedBox(width: Spacing.xs),
                  GestureDetector(
                    onTap: onComplete,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(habit.color).withValues(alpha: 0.1),
                      ),
                      child: Icon(
                        Icons.add_rounded,
                        color: Color(habit.color),
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _skipLabel(SkipReason reason) {
    return switch (reason) {
      SkipReason.sick => 'Skipped — sick',
      SkipReason.traveling => 'Skipped — traveling',
      SkipReason.restDay => 'Skipped — rest day',
      SkipReason.forgot => 'Missed',
      SkipReason.other => 'Skipped',
    };
  }
}
