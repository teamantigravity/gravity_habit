import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gravity_habit/core/constants/spacing.dart';
import 'package:gravity_habit/core/extensions/context_extensions.dart';
import 'package:gravity_habit/data/isar/schemas/habit_schema.dart';
import 'package:gravity_habit/data/repositories/habit_repository.dart';
import 'package:gravity_habit/domain/entities/habit.dart';
import 'package:gravity_habit/features/today/providers/today_provider.dart';
import 'package:gravity_habit/services/haptics/haptic_service.dart';
import 'package:gravity_habit/ui/widgets/cosmic_button.dart';

class HabitEditorScreen extends ConsumerStatefulWidget {
  const HabitEditorScreen({this.habitId, super.key});

  final String? habitId;

  @override
  ConsumerState<HabitEditorScreen> createState() =>
      _HabitEditorScreenState();
}

class _HabitEditorScreenState extends ConsumerState<HabitEditorScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _cueController = TextEditingController();
  final _whyController = TextEditingController();

  String _emoji = '⭐';
  int _color = 0xFF6EE7FF;
  HabitFrequency _frequency = HabitFrequency.daily;
  HabitTargetType _targetType = HabitTargetType.binary;
  double _targetValue = 1;
  String _unit = '';
  GravityClass _gravityClass = GravityClass.pebble;
  List<TimeOfDayData> _reminders = [];
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    if (widget.habitId != null) {
      _loadExisting();
    }
  }

  Future<void> _loadExisting() async {
    final habit =
        await ref.read(habitRepositoryProvider).getHabit(widget.habitId!);
    if (habit == null) return;
    setState(() {
      _isEditing = true;
      _nameController.text = habit.name;
      _descController.text = habit.description ?? '';
      _cueController.text = habit.cueText ?? '';
      _whyController.text = habit.whyText ?? '';
      _emoji = habit.emoji;
      _color = habit.color;
      _frequency = habit.frequency;
      _targetType = habit.targetType;
      _targetValue = habit.targetValue;
      _unit = habit.unit;
      _gravityClass = habit.gravityClass;
      _reminders = habit.reminderTimes;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _cueController.dispose();
    _whyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing ? 'Edit Habit' : 'New Habit',
          style: const TextStyle(fontFamily: 'SpaceGrotesk'),
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(Spacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1: Identity
            _SectionHeader(title: 'Identity'),
            const SizedBox(height: Spacing.sm),

            // Emoji picker
            GestureDetector(
              onTap: _showEmojiPicker,
              child: Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Color(_color).withOpacity(0.15),
                    borderRadius: BorderRadius.circular(CornerRadii.md),
                    border: Border.all(
                      color: Color(_color).withOpacity(0.3),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _emoji,
                      style: const TextStyle(fontSize: 36),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: Spacing.md),

            // Name
            TextField(
              controller: _nameController,
              maxLength: 60,
              decoration: InputDecoration(
                labelText: 'Habit name',
                counterText: '${_nameController.text.length}/60',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(CornerRadii.sm),
                ),
              ),
              onChanged: (_) => setState(() {}),
            ),
            const SizedBox(height: Spacing.md),

            // Color picker
            SizedBox(
              height: 44,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _colorOptions.map((c) {
                  final isSelected = _color == c;
                  return GestureDetector(
                    onTap: () {
                      setState(() => _color = c);
                      ref.read(hapticServiceProvider).play(HapticType.tap);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 36,
                      height: 36,
                      margin: const EdgeInsets.only(right: Spacing.xs),
                      decoration: BoxDecoration(
                        color: Color(c),
                        shape: BoxShape.circle,
                        border: isSelected
                            ? Border.all(
                                color: context.colors.onSurface,
                                width: 3,
                              )
                            : null,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: Spacing.xxl),

            // Section 2: Rhythm
            _SectionHeader(title: 'Rhythm'),
            const SizedBox(height: Spacing.sm),
            SegmentedButton<HabitFrequency>(
              segments: const [
                ButtonSegment(
                  value: HabitFrequency.daily,
                  label: Text('Daily'),
                ),
                ButtonSegment(
                  value: HabitFrequency.weeklyOnDays,
                  label: Text('Days'),
                ),
                ButtonSegment(
                  value: HabitFrequency.xTimesPerWeek,
                  label: Text('×/Week'),
                ),
              ],
              selected: {_frequency},
              onSelectionChanged: (v) {
                setState(() => _frequency = v.first);
                ref.read(hapticServiceProvider).play(HapticType.tap);
              },
            ),

            const SizedBox(height: Spacing.xxl),

            // Section 3: Goal
            _SectionHeader(title: 'Goal'),
            const SizedBox(height: Spacing.sm),
            SegmentedButton<HabitTargetType>(
              segments: const [
                ButtonSegment(
                  value: HabitTargetType.binary,
                  label: Text('Yes/No'),
                ),
                ButtonSegment(
                  value: HabitTargetType.count,
                  label: Text('Count'),
                ),
                ButtonSegment(
                  value: HabitTargetType.duration,
                  label: Text('Timer'),
                ),
              ],
              selected: {_targetType},
              onSelectionChanged: (v) {
                setState(() => _targetType = v.first);
              },
            ),
            if (_targetType != HabitTargetType.binary) ...[
              const SizedBox(height: Spacing.md),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Target',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(CornerRadii.sm),
                        ),
                      ),
                      onChanged: (v) =>
                          _targetValue = double.tryParse(v) ?? 1,
                    ),
                  ),
                  const SizedBox(width: Spacing.sm),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Unit',
                        hintText: _targetType == HabitTargetType.count
                            ? 'reps'
                            : 'minutes',
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(CornerRadii.sm),
                        ),
                      ),
                      onChanged: (v) => _unit = v,
                    ),
                  ),
                ],
              ),
            ],

            const SizedBox(height: Spacing.xxl),

            // Section 4: Cue
            _SectionHeader(title: 'Implementation Intention'),
            const SizedBox(height: Spacing.sm),
            TextField(
              controller: _cueController,
              maxLength: 200,
              decoration: InputDecoration(
                hintText: 'After I ___, I will ___',
                hintStyle: TextStyle(
                  color: context.colors.onSurface.withOpacity(0.3),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(CornerRadii.sm),
                ),
                counterText: '',
              ),
            ),

            const SizedBox(height: Spacing.xxl),

            // Section 5: Why
            _SectionHeader(title: 'Why'),
            const SizedBox(height: Spacing.sm),
            TextField(
              controller: _whyController,
              maxLength: 200,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Why does this matter to you?',
                hintStyle: TextStyle(
                  color: context.colors.onSurface.withOpacity(0.3),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(CornerRadii.sm),
                ),
                counterText: '',
              ),
            ),

            const SizedBox(height: Spacing.xxl),

            // Section 6: Gravity Class
            _SectionHeader(title: 'Gravity Class'),
            const SizedBox(height: Spacing.sm),
            _GravityClassSlider(
              value: _gravityClass,
              color: Color(_color),
              onChanged: (v) {
                setState(() => _gravityClass = v);
                ref.read(hapticServiceProvider).play(HapticType.boundary);
              },
            ),

            const SizedBox(height: Spacing.xxxl),

            // Save button
            CosmicButton(
              label: _isEditing ? 'Save Changes' : 'Create Habit',
              isExpanded: true,
              onPressed: _nameController.text.trim().isEmpty
                  ? null
                  : _save,
            ),

            const SizedBox(height: Spacing.massive),
          ],
        ),
      ),
    );
  }

  Future<void> _save() async {
    ref.read(hapticServiceProvider).play(HapticType.complete);

    final repo = ref.read(habitRepositoryProvider);
    final habit = Habit(
      id: widget.habitId ?? '',
      name: _nameController.text.trim(),
      emoji: _emoji,
      color: _color,
      description: _descController.text.trim().isEmpty
          ? null
          : _descController.text.trim(),
      frequency: _frequency,
      targetType: _targetType,
      targetValue: _targetType == HabitTargetType.binary ? 1 : _targetValue,
      unit: _unit,
      reminderTimes: _reminders,
      reminderDays: const [1, 2, 3, 4, 5, 6, 7],
      gravityClass: _gravityClass,
      createdAt: DateTime.now(),
      order: 999,
      cueText: _cueController.text.trim().isEmpty
          ? null
          : _cueController.text.trim(),
      whyText: _whyController.text.trim().isEmpty
          ? null
          : _whyController.text.trim(),
    );

    if (_isEditing) {
      await repo.updateHabit(habit);
    } else {
      await repo.createHabit(habit);
    }

    ref.read(todayProvider.notifier).refresh();

    if (mounted) context.pop();
  }

  void _showEmojiPicker() {
    // Simple emoji selection dialog
    final emojis = [
      '⭐', '🌟', '💧', '🏃', '💪', '📚', '🧘', '✍️', '🎨',
      '🎵', '💊', '🦷', '🥶', '🌿', '📓', '🎯', '🏋️', '🧘‍♀️',
      '🫸', '🏗️', '🏊', '📷', '💬', '📞', '🌟', '👀', '📧',
      '📋', '🌅', '🙏', '🌳', '🌇', '🚫', '📵', '🔌', '🌙',
      '🚴', '☀️', '🧍', '🎧', '📊', '👂', '🤫', '🫀', '🧠',
    ];

    showModalBottomSheet<void>(
      context: context,
      builder: (ctx) {
        return Container(
          padding: const EdgeInsets.all(Spacing.md),
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              childAspectRatio: 1,
            ),
            itemCount: emojis.length,
            itemBuilder: (ctx, i) {
              return GestureDetector(
                onTap: () {
                  setState(() => _emoji = emojis[i]);
                  Navigator.pop(ctx);
                },
                child: Center(
                  child: Text(
                    emojis[i],
                    style: const TextStyle(fontSize: 28),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  static const _colorOptions = [
    0xFF6EE7FF, 0xFFFF6EC7, 0xFF6EFFB8, 0xFFFF7A3D, 0xFFFF6E8A,
    0xFF8B9FFF, 0xFFC77DFF, 0xFF80FFD4, 0xFFFFCA28, 0xFFEF5350,
    0xFF66BB6A, 0xFF42A5F5, 0xFFAB47BC, 0xFF78909C, 0xFFA1887F,
    0xFFFF8A65,
  ];
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.textTheme.titleMedium?.copyWith(
        fontFamily: 'SpaceGrotesk',
        fontWeight: FontWeight.w600,
        color: context.colors.primary,
      ),
    );
  }
}

class _GravityClassSlider extends StatelessWidget {
  const _GravityClassSlider({
    required this.value,
    required this.color,
    required this.onChanged,
  });

  final GravityClass value;
  final Color color;
  final ValueChanged<GravityClass> onChanged;

  @override
  Widget build(BuildContext context) {
    final classes = GravityClass.values;
    final labels = ['Feather', 'Pebble', 'Stone', 'Boulder', 'Planet'];
    final masses = ['1', '3', '7', '15', '30'];

    return Column(
      children: [
        Slider(
          value: value.index.toDouble(),
          min: 0,
          max: 4,
          divisions: 4,
          onChanged: (v) => onChanged(classes[v.round()]),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (i) {
            final isSelected = value.index == i;
            return Column(
              children: [
                Text(
                  labels[i],
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight:
                        isSelected ? FontWeight.w600 : FontWeight.w400,
                    color: isSelected
                        ? color
                        : context.colors.onSurface.withOpacity(0.4),
                  ),
                ),
                Text(
                  '${masses[i]} mass',
                  style: TextStyle(
                    fontSize: 9,
                    fontFamily: 'JetBrainsMono',
                    color: context.colors.onSurface.withOpacity(0.3),
                  ),
                ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
