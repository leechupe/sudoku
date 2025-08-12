import 'package:audioplayers/audioplayers.dart';

class AudioService {
  static final AudioPlayer _musicPlayer = AudioPlayer();
  static final AudioPlayer _fxPlayer = AudioPlayer();

  static Future<void> playMusic() async {
    await _musicPlayer.setReleaseMode(ReleaseMode.loop);
    await _musicPlayer.play(AssetSource('audio/bg.mp3'));
  }

  static Future<void> stopMusic() async {
    await _musicPlayer.stop();
  }

  static Future<void> playClick() async {
    await _fxPlayer.play(AssetSource('audio/click.mp3'));
  }

  static Future<void> playSuccess() async {
    await _fxPlayer.play(AssetSource('audio/success.mp3'));
  }
}
