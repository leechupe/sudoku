
import '../entitles/settings_entity.dart';

abstract class SettingsRepository
{
  bool get soundOn;
  bool get musicOn;

  Future<SettingsEntity> getSettings();
  Future<void> saveSettings(SettingsEntity settings);
}
