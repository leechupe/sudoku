// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsDto _$SettingsDtoFromJson(Map<String, dynamic> json) => SettingsDto(
      soundOn: json['soundOn'] as bool,
      musicOn: json['musicOn'] as bool,
      selectedTheme: (json['selectedTheme'] as num).toInt(),
    );

Map<String, dynamic> _$SettingsDtoToJson(SettingsDto instance) =>
    <String, dynamic>{
      'soundOn': instance.soundOn,
      'musicOn': instance.musicOn,
      'selectedTheme': instance.selectedTheme,
    };
