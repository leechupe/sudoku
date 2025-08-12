abstract class RecordRepository {
  Future<int?> getBestTime(int level);
  Future<void> saveBestTime(int level, int seconds);
}
