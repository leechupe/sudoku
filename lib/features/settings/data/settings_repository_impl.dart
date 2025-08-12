import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../data/models/settings_dto.dart';
import '../domain/entitles/settings_entity.dart';
import '../domain/repositories/settings_repository.dart';


class SettingsRepositoryImpl implements SettingsRepository
{
  final _key = 'settings';

  @override
  bool get soundOn => soundOn;

  @override
  bool get musicOn => musicOn;

  @override
  Future<SettingsEntity> getSettings() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString(_key);
    if (jsonStr == null) return SettingsEntity.empty();

    final map = jsonDecode(jsonStr);
    return SettingsDto.fromJson(map).toEntity();
  }

  @override
  Future<void> saveSettings(SettingsEntity settings) async {
    final prefs = await SharedPreferences.getInstance();
    final dto = SettingsDto.fromEntity(settings);
    final jsonStr = jsonEncode(dto.toJson());
    await prefs.setString(_key, jsonStr);
  }
}
