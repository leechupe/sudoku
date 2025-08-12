import 'package:json_annotation/json_annotation.dart';
import '../../domain/entitles/settings_entity.dart';

part 'settings_dto.g.dart';

@JsonSerializable()
class SettingsDto {
  final bool soundOn;
  final bool musicOn;
  final int selectedTheme;

  SettingsDto({
    required this.soundOn,
    required this.musicOn,
    required this.selectedTheme,
  });

  factory SettingsDto.fromJson(Map<String, dynamic> json) => _$SettingsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsDtoToJson(this);

  factory SettingsDto.fromEntity(SettingsEntity entity) => SettingsDto(
    soundOn: entity.soundOn,
    musicOn: entity.musicOn,
    selectedTheme: entity.selectedTheme,
  );

  SettingsEntity toEntity() => SettingsEntity(
    soundOn: soundOn,
    musicOn: musicOn,
    selectedTheme: selectedTheme,
  );
}
