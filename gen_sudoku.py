import json
from sudoku import Sudoku  # 來自 py-sudoku 3x3 sub-block

def generate_puzzles(count=100, difficulty=0.1):
    levels = []
    i = 1
    while i <= count:
        puzzle = Sudoku(3).difficulty(difficulty)  # difficulty: 0 到 1
        flat = [n for row in puzzle.board for n in row]
        levels.append({'id': i, 'board': [n if n is not None else 0 for n in flat]})
        i += 1
    return levels

if __name__ == '__main__':
    # 安裝庫：pip install py-sudoku
    levels = generate_puzzles(100, difficulty=0.5)
    with open('sudoku_levels.json', 'w', encoding='utf-8') as f:
        json.dump({'levels': levels}, f, indent=2)
    print('生成 100 道本地 Sudoku 題庫成功！')
