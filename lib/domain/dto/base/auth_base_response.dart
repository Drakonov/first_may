import 'package:first_may/domain/dto/base/status.dart';
import 'package:first_may/domain/dto/check_sms_code_response_data.dart';
import 'package:first_may/domain/send_code_response_data.dart';

class AuthBaseResponse<M> {
  AuthBaseResponse({
    required this.code,
    this.status,
    this.data,
    this.error,
  });

  int code;
  Status? status;
  M? data;
  String? error;

  factory AuthBaseResponse.fromJson(Map<String, dynamic> json) {
    String key = 'data';
    dynamic status = json['status'];

    return AuthBaseResponse(
      code: json['code'],
      status: status != null ? Status.fromJson(status) : null,
      data: _dataFromJson(json[key] ?? {}, M),
      error: json['error'],
    );
  }

  static I _dataFromJson<I>(json, Type type) {
    if (type == SendCodeResponseData) {
      return SendCodeResponseData.fromJson(json) as I;
    }
    if (type == CheckSmsCodeResponseData) {
      return CheckSmsCodeResponseData.fromJson(json) as I;
    }

    return json as I;
  }
}
