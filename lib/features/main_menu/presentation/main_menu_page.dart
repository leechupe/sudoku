import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'main_menu_controller.dart';

class MainMenuPage extends StatelessWidget {
  final MainMenuController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('title'.tr)),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: c.goToGame,
              child: Text('play'.tr),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: c.goToSettings,
              child: Text('settings'.tr),
            ),
          ],
        ),
      ),
    );
  }
}
