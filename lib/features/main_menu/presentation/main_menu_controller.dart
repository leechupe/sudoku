import 'package:get/get.dart';
import '../../../routes/app_routes.dart';

class MainMenuController extends GetxController {
  void goToGame() => Get.toNamed(AppRoutes.game);
  void goToSettings() => Get.toNamed(AppRoutes.settings);
}
