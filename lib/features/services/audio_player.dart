//import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';

class Audioplayer {
  AudioPlayer? player;

  Future<void> play(String asset) async {
    final player = AudioPlayer();
    try {
      await player.setAsset('assets/audio/$asset');
      await player.setVolume(1.0);
      await player.play();

      // Wait until playback completes
      await player.playerStateStream.firstWhere(
        (state) => state.processingState == ProcessingState.completed,
      );
    } catch (e) {
      print('Audio error: $e');
    } finally {
      await player.dispose();
    }
  }
}
