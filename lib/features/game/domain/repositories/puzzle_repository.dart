
import 'package:sudoku_app/features/game/domain/entities/puzzle_model.dart';

import '../entities/puzzle_entity.dart';

//為什麼不能一起坐在puzzleRepository，要分開呢?
//Clean Architecture 的核心設計原則：「單一職責原則 (SRP)」與「關注點分離 (Separation of Concerns)」。
//為什麼 PuzzleRepository 和 RecordRepository 應分開？
//| Repository         | 負責內容                      |
// | ------------------ | ------------------------- |
// | `PuzzleRepository` | 提供數獨「題目資料」讀取（來源是 JSON）    |
// | `RecordRepository` | 管理「使用者最佳紀錄」資料（來源是 SQLite） |
//Puzzle 是靜態資料（題庫）
//
// Record 是動態資料（使用者互動產生）

abstract class PuzzleRepository {
  Future<PuzzleModel> getPuzzle(int level);
}
