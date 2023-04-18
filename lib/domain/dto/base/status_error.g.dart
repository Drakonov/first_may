// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusError _$StatusErrorFromJson(Map<String, dynamic> json) => StatusError(
      code: json['code'] as int,
      errorMessage: json['errorMessage'] as String,
    );

Map<String, dynamic> _$StatusErrorToJson(StatusError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'errorMessage': instance.errorMessage,
    };
