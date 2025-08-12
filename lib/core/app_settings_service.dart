import 'package:get/get.dart';

abstract class AppSettingsService {
  RxBool get soundOnObs;
  RxBool get musicOnObs;

  void syncFromController();
}
