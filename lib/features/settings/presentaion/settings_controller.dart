import 'package:get/get.dart';
import 'package:sudoku_app/shared/services/audio_service.dart';

import '../data/settings_repository_impl.dart';
import '../domain/entitles/settings_entity.dart';
import '../domain/usecases/get_settings_usercase.dart';
import '../domain/usecases/save_settings_usecase.dart';

class SettingsController extends GetxController {
  late final GetSettingsUseCase _getSettings;
  late final SaveSettingsUseCase _saveSettings;

  bool soundOn = true;
  bool musicOn = true;
  int selectedTheme = 0;

  @override
  void onInit() {
    final repo = SettingsRepositoryImpl();
    _getSettings = GetSettingsUseCase(repo);
    _saveSettings = SaveSettingsUseCase(repo);
    _load();
    super.onInit();
  }

  Future<void> _load() async {
    final settings = await _getSettings();
    soundOn = settings.soundOn;
    musicOn = settings.musicOn;
    selectedTheme = settings.selectedTheme;
    update(['sound', 'music', 'theme']);
  }

  void toggleSound(bool value) {
    soundOn = value;
    update(['sound']);
  }

  void toggleMusic(bool value){
    musicOn = value;
    update(['music']);
  }

  void changeTheme(int index) {
    selectedTheme = index;
    update(['theme']);
  }

  void save() async {
    final settings = SettingsEntity(
      soundOn: soundOn,
      musicOn: musicOn,
      selectedTheme: selectedTheme,
    );
    await _saveSettings(settings);
    update(['sound', 'music', 'theme']);

    if (musicOn) {
      await AudioService.playMusic();
    } else {
      await AudioService.stopMusic();
    }

  }
}
