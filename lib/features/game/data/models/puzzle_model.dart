
//跟Entity的區別？
//差異總結
// 特性         Entity               Model
// 所在層級      Domain 層            Data 層
// 用途         表現業務邏輯           處理資料來源的資料
// 依賴性        與框架或資料來源無關    與資料來源（如 API、資料庫）相關
// 轉換          不需要轉換            需要轉換為 Entity
//
// 在串接 API 時，處理 API 的請求和回覆所創建的類別應該屬於 Model，而不是 Entity。
// 原因：
// Model：
// 負責與外部資料來源（如 API）進行交互。
// 用於序列化（將物件轉換為 JSON）和反序列化（將 JSON 轉換為物件）。
// 與資料來源緊密相關，通常包含 API 回應的結構。
// Entity：
// 屬於 Domain 層，代表核心業務邏輯。
// 與外部資料來源無關，專注於應用內的業務規則。
// Model 通常需要轉換為 Entity，才能傳遞到 Domain 層。
class PuzzleModel {
  final int id;
  final List<int?> cells;

  PuzzleModel({required this.id, required this.cells});

  factory PuzzleModel.fromJson(Map<String, dynamic> json) => PuzzleModel(
    id: json['id'],
    cells: (json['board'] as List).map((e) => e == 0 ? null : e as int).toList(),
  );

  PuzzleModel toEntity() => PuzzleModel(id: id, cells: cells);
}
