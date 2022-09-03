class StatusModel {
  final String tStamp;
  final int errorCode;
  final String errorMessage;
  final int elapsed;
  final int CreditCount;
  final String notice;
  final totalCount;

  StatusModel(
      {required this.tStamp,
      required this.errorCode,
      required this.errorMessage,
      required this.elapsed,
      required this.CreditCount,
      required this.notice,
      required this.totalCount});
  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return StatusModel(
        tStamp: json["timestamp"],
        errorCode: json["error_code"],
        errorMessage: json["error_message"] ?? "",
        elapsed: json["elapsed"],
        CreditCount: json["credit_count"],
        notice: json["notice"] ?? "",
        totalCount: json["total_count"]);
  }
}
