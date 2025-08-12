import 'package:get/get.dart';
import 'presentation/main_menu_controller.dart';

class MainMenuModule extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainMenuController());
  }
}
