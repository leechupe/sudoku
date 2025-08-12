import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'settings_controller.dart';

class SettingsPage extends StatelessWidget {
  final SettingsController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('settings'.tr)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // 音效
            GetBuilder<SettingsController>(
              id: 'sound',
              builder: (_) => SwitchListTile(
                title: Text('sound'.tr),
                value: _.soundOn,
                onChanged: _.toggleSound,
              ),
            ),
            // 背景音樂
            GetBuilder<SettingsController>(
              id: 'music',
              builder: (_) => SwitchListTile(
                title: Text('music'.tr),
                value: _.musicOn,
                onChanged: _.toggleMusic,
              ),
            ),
            // 主題切換
            GetBuilder<SettingsController>(
              id: 'theme',
              builder: (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('theme'.tr, style: Theme.of(context).textTheme.titleMedium),
                  Wrap(
                    spacing: 8,
                    children: List.generate(5, (i) => ChoiceChip(
                      label: Text('Theme $i'),
                      selected: _.selectedTheme == i,
                      onSelected: (_) => c.changeTheme(i),
                    )),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: c.save,
              child: Text('save'.tr),
            )
          ],
        ),
      ),
    );
  }
}
