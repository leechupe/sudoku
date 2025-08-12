import '../repositories/settings_repository.dart';
import '../entitles/settings_entity.dart';

class GetSettingsUseCase
{
  final SettingsRepository repository;
  GetSettingsUseCase(this.repository);

  Future<SettingsEntity> call() => repository.getSettings();
}
