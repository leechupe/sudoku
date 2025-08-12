import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:sudoku_app/features/game/domain/entities/puzzle_model.dart';

class PuzzleLoader {
  static Future<List<PuzzleModel>> loadAll() async {
    final data = await rootBundle.loadString('assets/sudoku_levels.json');
    final json = jsonDecode(data)['levels'] as List;
    return json.map((j) => PuzzleModel.fromJson(j)).toList();
  }
}
