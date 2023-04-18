import 'package:json_annotation/json_annotation.dart';

part 'theta_check_status_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaCheckStatusRequest {
  ThetaCheckStatusRequest({
    required this.id,
  });

  String id;

  factory ThetaCheckStatusRequest.fromJson(Map<String, dynamic> json) => _$ThetaCheckStatusRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ThetaCheckStatusRequestToJson(this);
}
