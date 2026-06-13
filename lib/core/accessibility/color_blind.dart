import 'dart:ui';

/// Color-blind safe palette transformations.
class ColorBlindFilter {
  ColorBlindFilter._();

  /// Apply color-blind transformation to a color.
  static Color transform(Color color, int type) {
    return switch (type) {
      1 => _deuteranopia(color),
      2 => _protanopia(color),
      3 => _tritanopia(color),
      4 => _achromatopsia(color),
      _ => color,
    };
  }

  static Color _deuteranopia(Color c) {
    // Simulate red-green color blindness (most common)
    final r = c.red * 0.625 + c.green * 0.375;
    final g = c.red * 0.7 + c.green * 0.3;
    final b = c.blue * 1.0;
    return Color.fromARGB(c.alpha, r.round().clamp(0, 255),
        g.round().clamp(0, 255), b.round().clamp(0, 255));
  }

  static Color _protanopia(Color c) {
    final r = c.red * 0.567 + c.green * 0.433;
    final g = c.red * 0.558 + c.green * 0.442;
    final b = c.blue * 1.0;
    return Color.fromARGB(c.alpha, r.round().clamp(0, 255),
        g.round().clamp(0, 255), b.round().clamp(0, 255));
  }

  static Color _tritanopia(Color c) {
    final r = c.red * 0.95 + c.green * 0.05;
    final g = c.green * 0.433 + c.blue * 0.567;
    final b = c.green * 0.475 + c.blue * 0.525;
    return Color.fromARGB(c.alpha, r.round().clamp(0, 255),
        g.round().clamp(0, 255), b.round().clamp(0, 255));
  }

  static Color _achromatopsia(Color c) {
    final gray = (c.red * 0.299 + c.green * 0.587 + c.blue * 0.114).round();
    return Color.fromARGB(c.alpha, gray, gray, gray);
  }
}
