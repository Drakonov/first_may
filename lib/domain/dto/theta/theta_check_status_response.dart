import 'package:first_may/domain/dto/theta/theta_check_status_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'theta_check_status_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaCheckStatusResponse {
  ThetaCheckStatusResponse({
    required this.state,
    this.results,
  });

  String state;
  ThetaCheckStatusResult? results;

  factory ThetaCheckStatusResponse.fromJson(Map<String, dynamic> json) => _$ThetaCheckStatusResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThetaCheckStatusResponseToJson(this);
}
