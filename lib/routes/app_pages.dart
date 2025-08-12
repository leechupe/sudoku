import 'package:get/get.dart';
import '../features/settings/presentaion/settings_page.dart';
import '../features/splash/presentaion/splash_page.dart';
import '../features/splash/splash_module.dart';
import '../features/main_menu/presentation/main_menu_page.dart';
import '../features/main_menu/main_menu_module.dart';
import '../features/settings/settings_module.dart';
import '../features/game/presentation/game_page.dart';
import '../features/game/game_module.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
      binding: SplashModule(),
    ),
    GetPage(
      name: AppRoutes.mainMenu,
      page: () => MainMenuPage(),
      binding: MainMenuModule(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsPage(),
      binding: SettingsModule(),
    ),
    GetPage(
      name: AppRoutes.game,
      page: () => GamePage(),
      binding: GameModule(),
    ),
  ];
}
