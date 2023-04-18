import 'package:first_may/domain/dto/base/status.dart';
import 'package:first_may/domain/dto/base/status_error.dart';

class BaseResponse<M> {
  BaseResponse({
    required this.status,
    this.data,
    this.error,
  });

  M? data;
  StatusError? error;
  Status? status;

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    String key = 'response';
    dynamic status = json['status_result'];
    dynamic error = json['status'];

    return BaseResponse(
      data: _dataFromJson(json[key], M),
      status: status != null ? Status.fromJson(status) : null,
      error: error != null ? StatusError.fromJson(error) : null,
    );
  }

  static I? _dataFromJson<I>(json, Type type) {
    if (json == null) {
      return null;
    }
    return json as I;
  }
}
