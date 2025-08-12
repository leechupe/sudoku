
import 'package:sudoku_app/features/game/domain/entities/puzzle_model.dart';

import '../repositories/puzzle_repository.dart';

class GetPuzzleUseCase {
  final PuzzleRepository repo;
  GetPuzzleUseCase(this.repo);

  Future<PuzzleModel> call(int level) => repo.getPuzzle(level);
}
