import 'package:get/get.dart';
import 'presentation/game_controller.dart';

class GameModule extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameController());
  }
}
