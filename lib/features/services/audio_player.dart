//import 'package:audioplayers/audioplayers.dart';
import 'package:just_audio/just_audio.dart';

class Audioplayer {
  AudioPlayer? player;
  
  Future<void> play(String asset) async {
    player = AudioPlayer();
    player!.setVolume(1);
    await player!.setAsset('audio/$asset');
    await player!.play();
    player!.dispose();
  }
}