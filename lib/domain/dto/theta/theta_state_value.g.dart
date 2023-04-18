// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theta_state_value.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThetaStateValue _$ThetaStateValueFromJson(Map<String, dynamic> json) =>
    ThetaStateValue(
      sessionId: json['sessionId'] as String?,
      batteryLevel: (json['batteryLevel'] as num).toDouble(),
      storageChanged: json['storageChanged'] as bool?,
      storageUri: json['storageUri'] as String,
      captureStatus: json['_captureStatus'] as String,
      recordedTime: json['_recordedTime'] as int,
      recordableTime: json['_recordableTime'] as int,
      compositeShootingElapsedTime:
          json['_compositeShootingElapsedTime'] as int?,
      latestFileUri: json['_latestFileUri'] as String,
      batteryState: json['_batteryState'] as String,
      apiVersion: json['_apiVersion'] as int,
    );

Map<String, dynamic> _$ThetaStateValueToJson(ThetaStateValue instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'batteryLevel': instance.batteryLevel,
      'storageChanged': instance.storageChanged,
      'storageUri': instance.storageUri,
      '_captureStatus': instance.captureStatus,
      '_recordedTime': instance.recordedTime,
      '_recordableTime': instance.recordableTime,
      '_compositeShootingElapsedTime': instance.compositeShootingElapsedTime,
      '_latestFileUri': instance.latestFileUri,
      '_batteryState': instance.batteryState,
      '_apiVersion': instance.apiVersion,
    };
