import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'core/app_settings_service.dart';
import 'features/settings/presentaion/settings_controller.dart';
import 'routes/app_routes.dart';
import 'routes/app_pages.dart';
import 'shared/themes.dart';
import 'l10n/translations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 初始化 SettingsController 與核心抽象服務
  final settingsCtrl = Get.put(SettingsController());
  final appSettingsService = _AppSettingsServiceImpl(settingsCtrl);
  appSettingsService.syncFromController();
  Get.put<AppSettingsService>(appSettingsService);

  runApp(MyApp());
}

class _AppSettingsServiceImpl implements AppSettingsService {
  final SettingsController _settings;

  _AppSettingsServiceImpl(this._settings);

  @override
  final RxBool soundOnObs = false.obs;

  @override
  final RxBool musicOnObs = false.obs;

  @override
  void syncFromController() {
    soundOnObs.value = _settings.soundOn;
    musicOnObs.value = _settings.musicOn;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      id: 'theme',
      builder: (_) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sudoku',
        theme: AppThemes.themes[_.selectedTheme],
        translations: AppTranslations(),
        locale: Locale('zh'),
        fallbackLocale: Locale('en'),
        initialRoute: AppRoutes.splash,
        getPages: AppPages.pages,
      ),
    );
  }
}
