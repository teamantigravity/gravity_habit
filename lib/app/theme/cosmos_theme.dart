import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gravity_habit/app/theme/palettes.dart';
import 'package:gravity_habit/features/settings/settings_provider.dart';

final cosmosThemeProvider = Provider<CosmosTheme>((ref) {
  final settings = ref.watch(settingsProvider);
  final palette = CosmosPalettes.byId(settings.paletteId);
  return CosmosTheme(
    palette: palette,
    dyslexiaFont: settings.dyslexiaFont,
    highContrast: settings.highContrast,
  );
});

class CosmosTheme {
  CosmosTheme({
    required this.palette,
    this.dyslexiaFont = false,
    this.highContrast = false,
  });

  final CosmosPalette palette;
  final bool dyslexiaFont;
  final bool highContrast;

  String get _displayFont => dyslexiaFont ? 'OpenDyslexic' : 'SpaceGrotesk';
  String get _uiFont => dyslexiaFont ? 'OpenDyslexic' : 'Inter';
  String get _monoFont => 'JetBrainsMono';

  TextTheme get _textTheme => TextTheme(
        displayLarge: TextStyle(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.02 * 57, // -0.02em
          fontSize: 57,
        ),
        displayMedium: TextStyle(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.02 * 45,
          fontSize: 45,
        ),
        displaySmall: TextStyle(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w500,
          letterSpacing: -0.02 * 36,
          fontSize: 36,
        ),
        headlineLarge: TextStyle(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w700,
          fontSize: 32,
        ),
        headlineMedium: TextStyle(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w600,
          fontSize: 28,
        ),
        headlineSmall: TextStyle(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
        titleLarge: TextStyle(
          fontFamily: _uiFont,
          fontWeight: FontWeight.w600,
          fontSize: 22,
        ),
        titleMedium: TextStyle(
          fontFamily: _uiFont,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
        titleSmall: TextStyle(
          fontFamily: _uiFont,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        bodyLarge: TextStyle(
          fontFamily: _uiFont,
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        bodyMedium: TextStyle(
          fontFamily: _uiFont,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        ),
        bodySmall: TextStyle(
          fontFamily: _uiFont,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
        labelLarge: TextStyle(
          fontFamily: _uiFont,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        labelMedium: TextStyle(
          fontFamily: _uiFont,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
        labelSmall: TextStyle(
          fontFamily: _monoFont,
          fontWeight: FontWeight.w400,
          fontSize: 11,
        ),
      );

  ThemeData get darkTheme {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: palette.accent,
      onPrimary: palette.onAccent,
      primaryContainer: palette.accent.withOpacity(0.16),
      onPrimaryContainer: palette.accent,
      secondary: palette.secondary,
      onSecondary: palette.onSecondary,
      secondaryContainer: palette.secondary.withOpacity(0.16),
      onSecondaryContainer: palette.secondary,
      tertiary: palette.tertiary,
      onTertiary: Colors.white,
      error: palette.error,
      onError: Colors.white,
      surface: palette.surfaceDark,
      onSurface: palette.onSurfaceDark,
      surfaceContainerHighest: palette.surfaceContainerDark,
      outline: palette.outlineDark,
      outlineVariant: palette.outlineVariantDark,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      textTheme: _textTheme.apply(
        bodyColor: palette.onSurfaceDark,
        displayColor: palette.onSurfaceDark,
      ),
      scaffoldBackgroundColor: palette.backgroundDark,
      canvasColor: palette.backgroundDark,
      cardTheme: CardThemeData(
        color: palette.surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: palette.surfaceDark.withOpacity(0.9),
        selectedItemColor: palette.accent,
        unselectedItemColor: palette.onSurfaceDark.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: _displayFont,
          fontWeight: FontWeight.w700,
          fontSize: 20,
          color: palette.onSurfaceDark,
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: palette.accent,
        foregroundColor: palette.onAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: palette.surfaceContainerDark,
        contentTextStyle: TextStyle(
          fontFamily: _uiFont,
          color: palette.onSurfaceDark,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        behavior: SnackBarBehavior.floating,
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: palette.surfaceDark,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: palette.surfaceDark,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: palette.outlineVariantDark,
        thickness: 0.5,
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return palette.accent;
          return palette.onSurfaceDark.withOpacity(0.5);
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return palette.accent.withOpacity(0.3);
          }
          return palette.outlineVariantDark;
        }),
      ),
      sliderTheme: SliderThemeData(
        activeTrackColor: palette.accent,
        inactiveTrackColor: palette.accent.withOpacity(0.2),
        thumbColor: palette.accent,
        overlayColor: palette.accent.withOpacity(0.1),
      ),
    );
  }

  ThemeData get lightTheme {
    final colorScheme = ColorScheme(
      brightness: Brightness.light,
      primary: palette.accentLight ?? palette.accent,
      onPrimary: Colors.white,
      primaryContainer:
          (palette.accentLight ?? palette.accent).withOpacity(0.12),
      onPrimaryContainer: palette.accentLight ?? palette.accent,
      secondary: palette.secondaryLight ?? palette.secondary,
      onSecondary: Colors.white,
      secondaryContainer:
          (palette.secondaryLight ?? palette.secondary).withOpacity(0.12),
      onSecondaryContainer: palette.secondaryLight ?? palette.secondary,
      tertiary: palette.tertiaryLight ?? palette.tertiary,
      onTertiary: Colors.white,
      error: palette.error,
      onError: Colors.white,
      surface: palette.surfaceLight ?? const Color(0xFFFAF7F2),
      onSurface: palette.onSurfaceLight ?? const Color(0xFF1C1B1F),
      surfaceContainerHighest:
          palette.surfaceContainerLight ?? const Color(0xFFE8E0D1),
      outline: palette.outlineLight ?? const Color(0xFF79747E),
      outlineVariant: palette.outlineVariantLight ?? const Color(0xFFCAC4D0),
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: colorScheme,
      textTheme: _textTheme.apply(
        bodyColor: palette.onSurfaceLight ?? const Color(0xFF1C1B1F),
        displayColor: palette.onSurfaceLight ?? const Color(0xFF1C1B1F),
      ),
      scaffoldBackgroundColor:
          palette.backgroundLight ?? const Color(0xFFFAF7F2),
      canvasColor: palette.backgroundLight ?? const Color(0xFFFAF7F2),
      cardTheme: CardThemeData(
        color: palette.surfaceLight ?? const Color(0xFFFAF7F2),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: palette.accentLight ?? palette.accent,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
