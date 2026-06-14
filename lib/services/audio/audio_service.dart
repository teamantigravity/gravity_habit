import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final audioServiceProvider = Provider<AudioService>((ref) {
  throw UnimplementedError('Must be overridden');
});

enum SoundEvent {
  tap,
  complete,
  milestone,
  error,
}

class AudioService {
  final _player = AudioPlayer();
  final _ambientPlayer = AudioPlayer();
  bool _enabled = false;
  double _volume = 0.7;
  String _soundPackId = 'cosmos';

  Future<void> initialize() async {
    await _player.setVolume(_volume);
    await _ambientPlayer.setVolume(0.3);
  }

  void configure({
    bool? enabled,
    double? volume,
    String? soundPackId,
  }) {
    if (enabled != null) _enabled = enabled;
    if (volume != null) {
      _volume = volume;
      unawaited(_player.setVolume(_volume));
    }
    if (soundPackId != null) _soundPackId = soundPackId;
  }

  Future<void> play(SoundEvent event) async {
    if (!_enabled) return;

    final assetPath = _assetPath(event);
    if (assetPath == null) return;

    try {
      await _player.setAsset(assetPath);
      await _player.seek(Duration.zero);
      await _player.play();
    } catch (_) {
      // Silent failure for audio — never blocks UI
    }
  }

  String? _assetPath(SoundEvent event) {
    final eventName = switch (event) {
      SoundEvent.tap => 'tap',
      SoundEvent.complete => 'complete',
      SoundEvent.milestone => 'milestone',
      SoundEvent.error => 'error',
    };
    return 'assets/audio/$_soundPackId/$eventName.wav';
  }

  Future<void> playAmbient() async {
    if (!_enabled) return;
    try {
      await _ambientPlayer.setAsset(
        'assets/audio/$_soundPackId/ambient.wav',
      );
      await _ambientPlayer.setLoopMode(LoopMode.one);
      await _ambientPlayer.play();
    } catch (_) {}
  }

  Future<void> stopAmbient() async {
    await _ambientPlayer.stop();
  }

  Future<void> dispose() async {
    await _player.dispose();
    await _ambientPlayer.dispose();
  }
}
