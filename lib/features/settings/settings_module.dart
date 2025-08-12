import 'package:get/get.dart';
import 'package:sudoku_app/features/settings/presentaion/settings_controller.dart';

class SettingsModule extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
