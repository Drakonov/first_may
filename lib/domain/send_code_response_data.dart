import 'package:first_may/domain/enums/auth_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_code_response_data.g.dart';

@JsonSerializable()
class SendCodeResponseData {
  SendCodeResponseData({
    required this.status,
    required this.success,
    required this.type,
    required this.callFrom,
    required this.byEmail,
    required this.contact,
  });

  String status;
  bool success;
  AuthType type;
  String callFrom;
  bool byEmail;
  String? contact;

  factory SendCodeResponseData.fromJson(Map<String, dynamic> json) => _$SendCodeResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$SendCodeResponseDataToJson(this);
}
