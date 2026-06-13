// BUG 4: HabitEntry is imported from domain/entities/habit.dart
// but SkipReason enum is defined in data/isar/schemas/habit_entry_schema.dart
// The freezed entity references it but may not import it correctly
// ❌ Potential compile error or wrong type resolution
