import '../repositories/record_repository.dart';

class SaveRecordUseCase {
  final RecordRepository repo;
  SaveRecordUseCase(this.repo);

  Future<bool> call(int level, int seconds) async {
    final best = await repo.getBestTime(level);
    if (best == null || seconds < best) {
      await repo.saveBestTime(level, seconds);
      return true; // 表示破紀錄
    }
    return false;
  }
}
