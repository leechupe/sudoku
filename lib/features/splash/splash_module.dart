import 'package:get/get.dart';
import 'package:sudoku_app/features/splash/presentaion/splash_controller.dart';

class SplashModule extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
