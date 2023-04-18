// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'check_sms_code_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckSmsCodeResponseData _$CheckSmsCodeResponseDataFromJson(
        Map<String, dynamic> json) =>
    CheckSmsCodeResponseData(
      tokens: (json['tokens'] as List<dynamic>)
          .map((e) => Token.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckSmsCodeResponseDataToJson(
        CheckSmsCodeResponseData instance) =>
    <String, dynamic>{
      'tokens': instance.tokens,
    };
