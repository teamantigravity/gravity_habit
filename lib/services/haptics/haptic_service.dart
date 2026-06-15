import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hapticServiceProvider = Provider<HapticService>((ref) {
  throw UnimplementedError('Must be overridden');
});

enum HapticType {
  tap,
  complete,
  milestone,
  freeze,
  error,
  slide,
  boundary,
  orbitPull,
}

class HapticService {
  int _intensity = 2; // 0=off, 1=subtle, 2=standard, 3=strong

  void setIntensity(int intensity) {
    _intensity = intensity.clamp(0, 3);
  }

  Future<void> play(HapticType type) async {
    if (_intensity == 0) return;

    switch (type) {
      case HapticType.tap:
        await _tap();
      case HapticType.complete:
        await _complete();
      case HapticType.milestone:
        await _milestone();
      case HapticType.freeze:
        await _freeze();
      case HapticType.error:
        await _error();
      case HapticType.slide:
        await _slide();
      case HapticType.boundary:
        await _boundary();
      case HapticType.orbitPull:
        await _orbitPull();
    }
  }

  Future<void> _tap() async {
    if (_intensity <= 1) {
      await HapticFeedback.selectionClick();
    } else {
      await HapticFeedback.lightImpact();
    }
  }

  Future<void> _complete() async {
    // Soft thump
    await HapticFeedback.mediumImpact();
    await Future<void>.delayed(const Duration(milliseconds: 80));
    // 3-tap sparkle
    for (var i = 0; i < 3; i++) {
      await HapticFeedback.selectionClick();
      await Future<void>.delayed(const Duration(milliseconds: 40));
    }
  }

  Future<void> _milestone() async {
    // Crescendo of 6 taps with rising intensity
    for (var i = 0; i < 6; i++) {
      if (i < 2) {
        await HapticFeedback.selectionClick();
      } else if (i < 4) {
        await HapticFeedback.lightImpact();
      } else {
        await HapticFeedback.mediumImpact();
      }
      await Future<void>.delayed(Duration(milliseconds: 60 - i * 5));
    }
  }

  Future<void> _freeze() async {
    await HapticFeedback.heavyImpact();
  }

  Future<void> _error() async {
    await HapticFeedback.lightImpact();
    await Future<void>.delayed(const Duration(milliseconds: 80));
    await HapticFeedback.lightImpact();
  }

  Future<void> _slide() async {
    await HapticFeedback.selectionClick();
  }

  Future<void> _boundary() async {
    await HapticFeedback.mediumImpact();
  }

  Future<void> _orbitPull() async {
    await HapticFeedback.selectionClick();
    await Future<void>.delayed(const Duration(milliseconds: 100));
    await HapticFeedback.selectionClick();
  }
}
