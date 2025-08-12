import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sudoku_app/features/game/data/repositories_impl/puzzle_repository_impl.dart';
import 'package:sudoku_app/features/game/data/repositories_impl/record_repository_impl.dart';
import 'package:sudoku_app/features/game/domain/usercases/get_puzzle_usecase.dart';
import 'package:sudoku_app/features/game/domain/usercases/save_record_usecase.dart';
import '../../../core/app_settings_service.dart';
import '../../../shared/services/audio_service.dart';

class GameController extends GetxController with GetTickerProviderStateMixin {
  late final AppSettingsService _settings;
  late final GetPuzzleUseCase _getPuzzle;
  late final SaveRecordUseCase _saveRecord;

  int level = 1;
  int seconds = 0;
  Timer? _timer;
  List<List<int?>> board = List.generate(9, (_) => List.filled(9, null));
  List<List<int?>> original = List.generate(9, (_) => List.filled(9, null));
  List<int?> solution = List.filled(81, null);
  int? selectedRow, selectedCol;
  bool showSuccessAnim = false;
  late AnimationController animController;

  @override
  void onInit() {
    _settings = Get.find<AppSettingsService>();
    _getPuzzle = GetPuzzleUseCase(PuzzleRepositoryImpl());
    _saveRecord = SaveRecordUseCase(RecordRepositoryImpl());

    animController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    loadLevel();

    _settings.soundOnObs.listen((enabled) {
      if (!enabled) {
        print('🔇 玩家關閉音效');
      }
    });

    super.onInit();
  }

  Future<void> loadLevel() async {
    seconds = 0;
    _timer?.cancel();

    final puzzle = await _getPuzzle(level);

    solution = puzzle.solution;

    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        final idx = r * 9 + c;
        final val = puzzle.board[idx];
        if (val != null) {
          board[r][c] = val;
          original[r][c] = val;
        } else {
          board[r][c] = null;
          original[r][c] = null;
        }
      }
    }

    _startTimer();
    update(['board', 'timer']);
  }


  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      seconds++;
      update(['timer']);
    });
  }

  void selectCell(int row, int col) {
    if (original[row][col] != null) return;
    selectedRow = row;
    selectedCol = col;
    if (_settings.soundOnObs.value) AudioService.playClick();
    update(['board']);
  }

  void inputNumber(int n) {
    if (selectedRow == null || selectedCol == null) return;
    board[selectedRow!][selectedCol!] = n;
    if (_settings.soundOnObs.value) AudioService.playClick();
    update(['board']);
    _checkComplete();
  }

  void showHint() {
    if (_settings.soundOnObs.value) AudioService.playClick();
    for (int i = 0; i < 81; i++) {
      final r = i ~/ 9, c = i % 9;
      if (board[r][c] == null) {
        board[r][c] = solution[i];
        update(['board']);
        return;
      }
    }
  }

  void _checkComplete() {
    bool failed = false;
    for (int r = 0; r < 9; r++) {
      for (int c = 0; c < 9; c++) {
        int idx = r * 9 + c;
        final current = board[r][c];
        final expect = solution[idx];
        if (current != expect) {
          print("❌ Fail at ($r,$c): current=$current expected=$expect");
          failed = true;
          break;
        }
      }
      if (failed) break;
    }
    if (!failed) {
      print("✅ All matched — calling _onWin()");
      _timer?.cancel();
      _onWin();
    }
  }


  void _onWin() async {
    if (_settings.soundOnObs.value) {
      AudioService.playSuccess();
    }

    showSuccessAnim = true;
    update(['success']);

    await animController.forward();
    await Future.delayed(Duration(milliseconds: 300));
    animController.reset();

    showSuccessAnim = false;
    update(['success']);

    final broke = await _saveRecord(level, seconds);

    if (broke) {
      // 顯示破紀錄 Dialog，並在按下確定後跳下一關
      Get.defaultDialog(
        title: 'record_broken'.tr,
        middleText: '${'time_taken'.tr}$seconds s',
        barrierDismissible: false,
        confirm: TextButton(
          onPressed: () {
            Get.back(); // 關閉 dialog
            _nextLevel(); // 然後進入下一關
          },
          child: Text('OK'),
        ),
      );
    } else {
      _nextLevel();
    }
  }


  void _nextLevel() {
    level++;
    selectedRow = selectedCol = null;
    loadLevel();
  }

  void askExit() {
    Get.defaultDialog(
      title: 'exit_game'.tr,
      confirm: TextButton(onPressed: () => Get.back(result: true), child: Text('yes'.tr)),
      cancel: TextButton(onPressed: () => Get.back(), child: Text('no'.tr)),
    ).then((res) {
      if (res == true) Get.back();
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    animController.dispose();
    super.onClose();
  }
}
