import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

/// Accessibility helpers ensuring WCAG 2.2 AA compliance.
class SemanticsHelper {
  SemanticsHelper._();

  /// Wrap orbit canvas elements as an ordered list for screen readers.
  static Widget orbitSemantics({
    required List<String> habitNames,
    required List<bool> completionStates,
    required Widget child,
  }) {
    return Semantics(
      label: 'Orbit view with ${habitNames.length} habits',
      child: MergeSemantics(
        child: Column(
          children: [
            // Hidden semantic list for screen readers
            for (var i = 0; i < habitNames.length; i++)
              Semantics(
                label:
                    '${habitNames[i]}: ${completionStates[i] ? "completed" : "pending"}',
                sortKey: OrdinalSortKey(i.toDouble()),
                child: const SizedBox.shrink(),
              ),
            // Visual canvas
            Expanded(child: child),
          ],
        ),
      ),
    );
  }

  /// Minimum touch target size (44dp × 44dp per WCAG).
  static const minTouchTarget = 44.0;

  /// Ensure contrast ratio meets AA (4.5:1 for normal text, 3:1 for large).
  static bool meetsContrastAA(Color foreground, Color background) {
    final ratio = _contrastRatio(foreground, background);
    return ratio >= 4.5;
  }

  static bool meetsContrastAALarge(Color foreground, Color background) {
    final ratio = _contrastRatio(foreground, background);
    return ratio >= 3.0;
  }

  static double _contrastRatio(Color a, Color b) {
    final lA = _relativeLuminance(a);
    final lB = _relativeLuminance(b);
    final lighter = lA > lB ? lA : lB;
    final darker = lA > lB ? lB : lA;
    return (lighter + 0.05) / (darker + 0.05);
  }

  static double _relativeLuminance(Color color) {
    double linearize(int channel) {
      final sRgb = channel / 255.0;
      return sRgb <= 0.03928
          ? sRgb / 12.92
          : ((sRgb + 0.055) / 1.055) * ((sRgb + 0.055) / 1.055) * ((sRgb + 0.055) / 1.055) // pow approximation
              ;
    }

    final r = linearize(color.red);
    final g = linearize(color.green);
    final b = linearize(color.blue);
    return 0.2126 * r + 0.7152 * g + 0.0722 * b;
  }
}

/// Widget that ensures minimum 44dp touch target.
class AccessibleTapTarget extends StatelessWidget {
  const AccessibleTapTarget({
    required this.child,
    required this.onTap,
    this.semanticLabel,
    super.key,
  });

  final Widget child;
  final VoidCallback onTap;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      button: true,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            minWidth: SemanticsHelper.minTouchTarget,
            minHeight: SemanticsHelper.minTouchTarget,
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
