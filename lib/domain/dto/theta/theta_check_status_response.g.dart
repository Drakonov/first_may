// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theta_check_status_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThetaCheckStatusResponse _$ThetaCheckStatusResponseFromJson(
        Map<String, dynamic> json) =>
    ThetaCheckStatusResponse(
      state: json['state'] as String,
      results: json['results'] == null
          ? null
          : ThetaCheckStatusResult.fromJson(
              json['results'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThetaCheckStatusResponseToJson(
        ThetaCheckStatusResponse instance) =>
    <String, dynamic>{
      'state': instance.state,
      'results': instance.results,
    };
