// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theta_set_options_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThetaSetOptionsRequest _$ThetaSetOptionsRequestFromJson(
        Map<String, dynamic> json) =>
    ThetaSetOptionsRequest(
      sessionId: json['sessionId'] as String,
      options: ThetaOptions.fromJson(json['options'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThetaSetOptionsRequestToJson(
        ThetaSetOptionsRequest instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'options': instance.options,
    };
