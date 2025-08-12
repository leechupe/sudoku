import 'package:sudoku_app/features/game/domain/entities/puzzle_model.dart';

import '../../domain/entities/puzzle_entity.dart';
import '../../domain/repositories/puzzle_repository.dart';
import '../datasources/puzzle_loader.dart';

class PuzzleRepositoryImpl implements PuzzleRepository {
  List<PuzzleModel>? _cache;

  @override
  Future<PuzzleModel> getPuzzle(int level) async {
    _cache ??= (await PuzzleLoader.loadAll());
    return _cache![level - 1];
  }
}
