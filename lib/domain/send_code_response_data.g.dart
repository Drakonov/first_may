// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_code_response_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendCodeResponseData _$SendCodeResponseDataFromJson(
        Map<String, dynamic> json) =>
    SendCodeResponseData(
      status: json['status'] as String,
      success: json['success'] as bool,
      type: $enumDecode(_$AuthTypeEnumMap, json['type']),
      callFrom: json['callFrom'] as String,
      byEmail: json['byEmail'] as bool,
      contact: json['contact'] as String?,
    );

Map<String, dynamic> _$SendCodeResponseDataToJson(
        SendCodeResponseData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'success': instance.success,
      'type': instance.type,
      'callFrom': instance.callFrom,
      'byEmail': instance.byEmail,
      'contact': instance.contact,
    };

const _$AuthTypeEnumMap = {
  AuthType.call: 'call',
  AuthType.sms: 'sms',
  AuthType.mail: 'mail',
};
