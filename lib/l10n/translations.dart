import 'package:get/get.dart';

class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en': {
      'title': 'Sudoku',
      'play': 'Play',
      'settings': 'Settings',
      'sound': 'Sound',
      'music': 'Music',
      'theme': 'Theme',
      'save': 'Save',
      'hint': 'Hint',
      'exit_game': 'Do you want to exit the game?',
      'yes': 'Yes',
      'no': 'No',
      'record_broken': 'New Record!',
      'time_taken': 'Time used: ',
    },
    'zh': {
      'title': '數獨',
      'play': '進入遊戲',
      'settings': '設定',
      'sound': '音效',
      'music': '背景音樂',
      'theme': '主題',
      'save': '儲存',
      'hint': '提示',
      'exit_game': '是否離開遊戲？',
      'yes': '是',
      'no': '否',
      'record_broken': '破紀錄！',
      'time_taken': '耗時：',
    }
  };
}
