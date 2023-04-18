import 'package:first_may/domain/dto/device.dart';
import 'package:json_annotation/json_annotation.dart';

part 'check_sms_code_body.g.dart';

@JsonSerializable()
class CheckSmsCodeBody {
  CheckSmsCodeBody({
    required this.phone,
    required this.code,
    required this.device,
  });

  String phone;
  String code;
  Device device;

  factory CheckSmsCodeBody.fromJson(Map<String, dynamic> json) => _$CheckSmsCodeBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CheckSmsCodeBodyToJson(this);
}
