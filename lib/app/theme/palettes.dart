import 'package:flutter/material.dart';

class CosmosPalette {
  const CosmosPalette({
    required this.id,
    required this.name,
    required this.backgroundDark,
    required this.surfaceDark,
    required this.surfaceContainerDark,
    required this.onSurfaceDark,
    required this.outlineDark,
    required this.outlineVariantDark,
    required this.accent,
    required this.onAccent,
    required this.secondary,
    required this.onSecondary,
    required this.tertiary,
    required this.error,
    this.accentLight,
    this.secondaryLight,
    this.tertiaryLight,
    this.backgroundLight,
    this.surfaceLight,
    this.surfaceContainerLight,
    this.onSurfaceLight,
    this.outlineLight,
    this.outlineVariantLight,
    this.isLight = false,
    this.isFree = true,
    this.unlockTier,
    this.stardustCost,
  });

  final String id;
  final String name;

  // Dark mode
  final Color backgroundDark;
  final Color surfaceDark;
  final Color surfaceContainerDark;
  final Color onSurfaceDark;
  final Color outlineDark;
  final Color outlineVariantDark;
  final Color accent;
  final Color onAccent;
  final Color secondary;
  final Color onSecondary;
  final Color tertiary;
  final Color error;

  // Light mode overrides
  final Color? accentLight;
  final Color? secondaryLight;
  final Color? tertiaryLight;
  final Color? backgroundLight;
  final Color? surfaceLight;
  final Color? surfaceContainerLight;
  final Color? onSurfaceLight;
  final Color? outlineLight;
  final Color? outlineVariantLight;

  final bool isLight;
  final bool isFree;
  final int? unlockTier;
  final int? stardustCost;
}

class CosmosPalettes {
  CosmosPalettes._();

  static CosmosPalette byId(String id) {
    return all.firstWhere(
      (p) => p.id == id,
      orElse: () => midnight,
    );
  }

  static final all = [
    midnight,
    nebula,
    aurora,
    voidPalette,
    solstice,
    dawn,
    inferno,
    prism,
    verdant,
    sakura,
    glacier,
    ember,
    twilight,
    lavender,
    onyx,
    pearl,
  ];

  static const midnight = CosmosPalette(
    id: 'midnight',
    name: 'Midnight',
    backgroundDark: Color(0xFF0A0B1E),
    surfaceDark: Color(0xFF141630),
    surfaceContainerDark: Color(0xFF1B1F3B),
    onSurfaceDark: Color(0xFFE8EAED),
    outlineDark: Color(0xFF3A3F5C),
    outlineVariantDark: Color(0xFF252840),
    accent: Color(0xFF6EE7FF),
    onAccent: Color(0xFF003544),
    secondary: Color(0xFF8B9FFF),
    onSecondary: Color(0xFF1B2570),
    tertiary: Color(0xFFB8C0FF),
    error: Color(0xFFFF6B6B),
  );

  static const nebula = CosmosPalette(
    id: 'nebula',
    name: 'Nebula',
    backgroundDark: Color(0xFF1A0B2E),
    surfaceDark: Color(0xFF231540),
    surfaceContainerDark: Color(0xFF2D1B4E),
    onSurfaceDark: Color(0xFFF0E4FF),
    outlineDark: Color(0xFF4A3570),
    outlineVariantDark: Color(0xFF352550),
    accent: Color(0xFFFF6EC7),
    onAccent: Color(0xFF4A0030),
    secondary: Color(0xFFC77DFF),
    onSecondary: Color(0xFF2A0050),
    tertiary: Color(0xFFE0AAFF),
    error: Color(0xFFFF6B6B),
  );

  static const aurora = CosmosPalette(
    id: 'aurora',
    name: 'Aurora',
    backgroundDark: Color(0xFF0B1F1A),
    surfaceDark: Color(0xFF122E26),
    surfaceContainerDark: Color(0xFF133D2E),
    onSurfaceDark: Color(0xFFE0F5EC),
    outlineDark: Color(0xFF2A5C48),
    outlineVariantDark: Color(0xFF1D4535),
    accent: Color(0xFF6EFFB8),
    onAccent: Color(0xFF003822),
    secondary: Color(0xFF80FFD4),
    onSecondary: Color(0xFF004D2E),
    tertiary: Color(0xFFA5FFD6),
    error: Color(0xFFFF6B6B),
  );

  static const voidPalette = CosmosPalette(
    id: 'void',
    name: 'Void',
    backgroundDark: Color(0xFF000000),
    surfaceDark: Color(0xFF0A0A0A),
    surfaceContainerDark: Color(0xFF141414),
    onSurfaceDark: Color(0xFFE0E0E0),
    outlineDark: Color(0xFF333333),
    outlineVariantDark: Color(0xFF222222),
    accent: Color(0xFF6EE7FF), // User-configurable
    onAccent: Color(0xFF003544),
    secondary: Color(0xFF8B9FFF),
    onSecondary: Color(0xFF1B2570),
    tertiary: Color(0xFFB8C0FF),
    error: Color(0xFFFF6B6B),
  );

  static const solstice = CosmosPalette(
    id: 'solstice',
    name: 'Solstice',
    backgroundDark: Color(0xFF1A1510),
    surfaceDark: Color(0xFF241E16),
    surfaceContainerDark: Color(0xFF2E261D),
    onSurfaceDark: Color(0xFFF5EFE7),
    outlineDark: Color(0xFF5C4D3C),
    outlineVariantDark: Color(0xFF3D342A),
    accent: Color(0xFFFF7A3D),
    onAccent: Color(0xFF3C1800),
    secondary: Color(0xFFFFAA6E),
    onSecondary: Color(0xFF4A2200),
    tertiary: Color(0xFFFFCC99),
    error: Color(0xFFFF6B6B),
    isLight: true,
    backgroundLight: Color(0xFFFAF7F2),
    surfaceLight: Color(0xFFF5F0E8),
    surfaceContainerLight: Color(0xFFE8E0D1),
    onSurfaceLight: Color(0xFF2C2520),
    outlineLight: Color(0xFF8C7D6D),
    outlineVariantLight: Color(0xFFD0C4B3),
  );

  static const dawn = CosmosPalette(
    id: 'dawn',
    name: 'Dawn',
    backgroundDark: Color(0xFF151A20),
    surfaceDark: Color(0xFF1D2530),
    surfaceContainerDark: Color(0xFF252E3B),
    onSurfaceDark: Color(0xFFE8ECF2),
    outlineDark: Color(0xFF4A5568),
    outlineVariantDark: Color(0xFF343D4D),
    accent: Color(0xFFFF6E8A),
    onAccent: Color(0xFF440020),
    secondary: Color(0xFFFF9EB0),
    onSecondary: Color(0xFF5A0028),
    tertiary: Color(0xFFFFBDCA),
    error: Color(0xFFFF6B6B),
    isLight: true,
    backgroundLight: Color(0xFFF5F7FA),
    surfaceLight: Color(0xFFEDF0F5),
    surfaceContainerLight: Color(0xFFDCE3ED),
    onSurfaceLight: Color(0xFF1C2028),
    outlineLight: Color(0xFF7A8594),
    outlineVariantLight: Color(0xFFC2CCD8),
  );

  // Tier-unlocked palettes
  static const inferno = CosmosPalette(
    id: 'inferno',
    name: 'Inferno',
    backgroundDark: Color(0xFF1A0A0A),
    surfaceDark: Color(0xFF2A1010),
    surfaceContainerDark: Color(0xFF3A1515),
    onSurfaceDark: Color(0xFFFFE8E0),
    outlineDark: Color(0xFF6A3030),
    outlineVariantDark: Color(0xFF4A2020),
    accent: Color(0xFFFF4500),
    onAccent: Color(0xFF000000),
    secondary: Color(0xFFFF8C00),
    onSecondary: Color(0xFF3A1500),
    tertiary: Color(0xFFFFD700),
    error: Color(0xFFFF4444),
    isFree: false,
    unlockTier: 65,
  );

  static const prism = CosmosPalette(
    id: 'prism',
    name: 'Prism',
    backgroundDark: Color(0xFF0A0A1E),
    surfaceDark: Color(0xFF141428),
    surfaceContainerDark: Color(0xFF1E1E38),
    onSurfaceDark: Color(0xFFF0F0FF),
    outlineDark: Color(0xFF3A3A60),
    outlineVariantDark: Color(0xFF2A2A48),
    accent: Color(0xFFFF00FF),
    onAccent: Color(0xFF2A002A),
    secondary: Color(0xFF00FFFF),
    onSecondary: Color(0xFF003A3A),
    tertiary: Color(0xFFFFFF00),
    error: Color(0xFFFF4444),
    isFree: false,
    unlockTier: 85,
  );

  // Stardust palettes (500 each)
  static const verdant = CosmosPalette(
    id: 'verdant',
    name: 'Verdant',
    backgroundDark: Color(0xFF0A1A0A),
    surfaceDark: Color(0xFF122812),
    surfaceContainerDark: Color(0xFF1A3A1A),
    onSurfaceDark: Color(0xFFE0FFE0),
    outlineDark: Color(0xFF2A5C2A),
    outlineVariantDark: Color(0xFF1D451D),
    accent: Color(0xFF00E676),
    onAccent: Color(0xFF003A1A),
    secondary: Color(0xFF69F0AE),
    onSecondary: Color(0xFF004D30),
    tertiary: Color(0xFFB9F6CA),
    error: Color(0xFFFF6B6B),
    isFree: false,
    stardustCost: 500,
  );

  static const sakura = CosmosPalette(
    id: 'sakura',
    name: 'Sakura',
    backgroundDark: Color(0xFF1A0A14),
    surfaceDark: Color(0xFF28101E),
    surfaceContainerDark: Color(0xFF3A1528),
    onSurfaceDark: Color(0xFFFFE0F0),
    outlineDark: Color(0xFF6A3050),
    outlineVariantDark: Color(0xFF4A2038),
    accent: Color(0xFFFF80AB),
    onAccent: Color(0xFF44001A),
    secondary: Color(0xFFFF4081),
    onSecondary: Color(0xFF5A0020),
    tertiary: Color(0xFFFF80AB),
    error: Color(0xFFFF6B6B),
    isFree: false,
    stardustCost: 500,
  );

  static const glacier = CosmosPalette(
    id: 'glacier',
    name: 'Glacier',
    backgroundDark: Color(0xFF0A141E),
    surfaceDark: Color(0xFF101E2E),
    surfaceContainerDark: Color(0xFF152838),
    onSurfaceDark: Color(0xFFE0F0FF),
    outlineDark: Color(0xFF2A4A6A),
    outlineVariantDark: Color(0xFF1D3550),
    accent: Color(0xFF40C4FF),
    onAccent: Color(0xFF002A44),
    secondary: Color(0xFF80D8FF),
    onSecondary: Color(0xFF003D5A),
    tertiary: Color(0xFFB3E5FC),
    error: Color(0xFFFF6B6B),
    isFree: false,
    stardustCost: 500,
  );

  static const ember = CosmosPalette(
    id: 'ember',
    name: 'Ember',
    backgroundDark: Color(0xFF1A100A),
    surfaceDark: Color(0xFF281810),
    surfaceContainerDark: Color(0xFF3A2015),
    onSurfaceDark: Color(0xFFFFF0E0),
    outlineDark: Color(0xFF6A4030),
    outlineVariantDark: Color(0xFF4A2D20),
    accent: Color(0xFFFF6D00),
    onAccent: Color(0xFF3A1500),
    secondary: Color(0xFFFF9E40),
    onSecondary: Color(0xFF4A2000),
    tertiary: Color(0xFFFFCC80),
    error: Color(0xFFFF4444),
    isFree: false,
    stardustCost: 500,
  );

  static const twilight = CosmosPalette(
    id: 'twilight',
    name: 'Twilight',
    backgroundDark: Color(0xFF0F0A1E),
    surfaceDark: Color(0xFF18122E),
    surfaceContainerDark: Color(0xFF201A3E),
    onSurfaceDark: Color(0xFFE8E0FF),
    outlineDark: Color(0xFF403060),
    outlineVariantDark: Color(0xFF2E2248),
    accent: Color(0xFF7C4DFF),
    onAccent: Color(0xFF1A0040),
    secondary: Color(0xFFB388FF),
    onSecondary: Color(0xFF2A0060),
    tertiary: Color(0xFFD1C4E9),
    error: Color(0xFFFF6B6B),
    isFree: false,
    stardustCost: 500,
  );

  static const lavender = CosmosPalette(
    id: 'lavender',
    name: 'Lavender',
    backgroundDark: Color(0xFF14101E),
    surfaceDark: Color(0xFF1E182E),
    surfaceContainerDark: Color(0xFF28203E),
    onSurfaceDark: Color(0xFFF0E8FF),
    outlineDark: Color(0xFF483860),
    outlineVariantDark: Color(0xFF352A48),
    accent: Color(0xFFCE93D8),
    onAccent: Color(0xFF380040),
    secondary: Color(0xFFE1BEE7),
    onSecondary: Color(0xFF4A0058),
    tertiary: Color(0xFFF3E5F5),
    error: Color(0xFFFF6B6B),
    isFree: false,
    stardustCost: 500,
  );

  static const onyx = CosmosPalette(
    id: 'onyx',
    name: 'Onyx',
    backgroundDark: Color(0xFF050505),
    surfaceDark: Color(0xFF101010),
    surfaceContainerDark: Color(0xFF1A1A1A),
    onSurfaceDark: Color(0xFFD0D0D0),
    outlineDark: Color(0xFF3A3A3A),
    outlineVariantDark: Color(0xFF2A2A2A),
    accent: Color(0xFFBDBDBD),
    onAccent: Color(0xFF1A1A1A),
    secondary: Color(0xFF757575),
    onSecondary: Color(0xFFE0E0E0),
    tertiary: Color(0xFF9E9E9E),
    error: Color(0xFFEF5350),
    isFree: false,
    stardustCost: 500,
  );

  static const pearl = CosmosPalette(
    id: 'pearl',
    name: 'Pearl',
    backgroundDark: Color(0xFF141416),
    surfaceDark: Color(0xFF1E1E22),
    surfaceContainerDark: Color(0xFF28282E),
    onSurfaceDark: Color(0xFFF5F5F5),
    outlineDark: Color(0xFF48484E),
    outlineVariantDark: Color(0xFF38383E),
    accent: Color(0xFFF5F0E8),
    onAccent: Color(0xFF2A2520),
    secondary: Color(0xFFD4CFC5),
    onSecondary: Color(0xFF3A3530),
    tertiary: Color(0xFFE8E0D1),
    error: Color(0xFFFF6B6B),
    isLight: true,
    isFree: false,
    stardustCost: 500,
    backgroundLight: Color(0xFFFFFDF8),
    surfaceLight: Color(0xFFF8F5EF),
    surfaceContainerLight: Color(0xFFF0EBE3),
    onSurfaceLight: Color(0xFF2A2520),
    outlineLight: Color(0xFF9E9690),
    outlineVariantLight: Color(0xFFD0C8BD),
  );
}
