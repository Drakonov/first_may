import 'package:json_annotation/json_annotation.dart';

part 'theta_options.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaOptions {
  ThetaOptions({
    required this.clientVersion,
    required this.captureMode,
  });

  int clientVersion;
  String captureMode;

  factory ThetaOptions.fromJson(Map<String, dynamic> json) => _$ThetaOptionsFromJson(json);

  Map<String, dynamic> toJson() => _$ThetaOptionsToJson(this);
}
