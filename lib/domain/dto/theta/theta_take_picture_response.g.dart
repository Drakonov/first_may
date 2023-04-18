// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theta_take_picture_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThetaTakePictureResponse _$ThetaTakePictureResponseFromJson(
        Map<String, dynamic> json) =>
    ThetaTakePictureResponse(
      name: json['name'] as String,
      progress:
          ThetaProgress.fromJson(json['progress'] as Map<String, dynamic>),
      id: json['id'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$ThetaTakePictureResponseToJson(
        ThetaTakePictureResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'progress': instance.progress,
      'id': instance.id,
      'state': instance.state,
    };
