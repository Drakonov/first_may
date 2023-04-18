import 'package:json_annotation/json_annotation.dart';

part 'theta_check_status_result.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaCheckStatusResult {
  ThetaCheckStatusResult({
    required this.fileUrl,
  });

  String fileUrl;

  factory ThetaCheckStatusResult.fromJson(Map<String, dynamic> json) => _$ThetaCheckStatusResultFromJson(json);

  Map<String, dynamic> toJson() => _$ThetaCheckStatusResultToJson(this);
}
