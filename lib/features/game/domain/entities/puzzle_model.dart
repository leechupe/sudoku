class PuzzleModel {
  final int id;
  final List<int?> board;
  final List<int> solution;

  PuzzleModel({
    required this.id,
    required this.board,
    required this.solution,
  });

  factory PuzzleModel.fromJson(Map<String, dynamic> json) {
    return PuzzleModel(
      id: json['id'],
      board: (json['board'] as List<dynamic>)
          .map((e) => e == 0 ? null : e as int)
          .toList(),
      solution: (json['solution'] as List<dynamic>)
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'board': board.map((e) => e ?? 0).toList(),
    'solution': solution,
  };
}
