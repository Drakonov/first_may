// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_sms_code_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckSmsCodeBody _$CheckSmsCodeBodyFromJson(Map<String, dynamic> json) =>
    CheckSmsCodeBody(
      phone: json['phone'] as String,
      code: json['code'] as String,
      device: Device.fromJson(json['device'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckSmsCodeBodyToJson(CheckSmsCodeBody instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
      'device': instance.device,
    };
