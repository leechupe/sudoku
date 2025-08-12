class SettingsEntity {
  final bool soundOn;
  final bool musicOn;
  final int selectedTheme;

  SettingsEntity({
    required this.soundOn,
    required this.musicOn,
    required this.selectedTheme,
  });

  factory SettingsEntity.empty() => SettingsEntity(soundOn: true, musicOn: true, selectedTheme: 0);
}
