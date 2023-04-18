import 'package:first_may/domain/dto/token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_sms_code_response_data.g.dart';

@JsonSerializable()
class CheckSmsCodeResponseData {
  CheckSmsCodeResponseData({
    required this.tokens,
  });

  List<Token> tokens;

  factory CheckSmsCodeResponseData.fromJson(Map<String, dynamic> json) => _$CheckSmsCodeResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$CheckSmsCodeResponseDataToJson(this);
}
