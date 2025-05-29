class ErrorData {
  final String? status;
  final int code;
  final String? message;

  ErrorData({this.status, required this.code, this.message});

  factory ErrorData.fromJson(Map<String, dynamic> json) {
    return ErrorData(
      status: json['status'] as String?,
      code: json['code'] as int? ?? 400,
      message: json['message'] as String?,
    );
  }
}
