import '../entitles/settings_entity.dart';
import '../repositories/settings_repository.dart';

class SaveSettingsUseCase {
  final SettingsRepository repository;
  SaveSettingsUseCase(this.repository);

  Future<void> call(SettingsEntity settings) => repository.saveSettings(settings);
}
