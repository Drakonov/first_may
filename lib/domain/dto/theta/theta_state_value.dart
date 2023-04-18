import 'package:json_annotation/json_annotation.dart';

part 'theta_state_value.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaStateValue {
  ThetaStateValue({
    required this.sessionId,
    required this.batteryLevel,
    required this.storageChanged,
    required this.storageUri,
    required this.captureStatus,
    required this.recordedTime,
    required this.recordableTime,
    required this.compositeShootingElapsedTime,
    required this.latestFileUri,
    required this.batteryState,
    required this.apiVersion,
  });

  String? sessionId;
  double batteryLevel;
  bool? storageChanged;
  String storageUri;
  @JsonKey(name: '_captureStatus')
  String captureStatus;
  @JsonKey(name: '_recordedTime')
  int recordedTime;
  @JsonKey(name: '_recordableTime')
  int recordableTime;
  @JsonKey(name: '_compositeShootingElapsedTime')
  int? compositeShootingElapsedTime;
  @JsonKey(name: '_latestFileUri')
  String latestFileUri;
  @JsonKey(name: '_batteryState')
  String batteryState;
  @JsonKey(name: '_apiVersion')
  int apiVersion;

  factory ThetaStateValue.fromJson(Map<String, dynamic> json) => _$ThetaStateValueFromJson(json);

  Map<String, dynamic> toJson() => _$ThetaStateValueToJson(this);
}
