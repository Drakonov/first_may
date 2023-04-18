// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Token _$TokenFromJson(Map<String, dynamic> json) => Token(
      name: json['name'] as String,
      value: json['value'] as String,
      expires: json['expires'] as int,
      domain: json['domain'] as String,
    );

Map<String, dynamic> _$TokenToJson(Token instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
      'expires': instance.expires,
      'domain': instance.domain,
    };
