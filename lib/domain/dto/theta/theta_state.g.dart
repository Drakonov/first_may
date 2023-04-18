// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theta_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThetaState _$ThetaStateFromJson(Map<String, dynamic> json) => ThetaState(
      fingerprint: json['fingerprint'] as String,
      state: ThetaStateValue.fromJson(json['state'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThetaStateToJson(ThetaState instance) =>
    <String, dynamic>{
      'fingerprint': instance.fingerprint,
      'state': instance.state,
    };
