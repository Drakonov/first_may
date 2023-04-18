import 'package:json_annotation/json_annotation.dart';

part 'theta_session_response.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaSessionResponse {
  ThetaSessionResponse({
    required this.sessionId,
  });

  String sessionId;

  factory ThetaSessionResponse.fromJson(Map<String, dynamic> json) => _$ThetaSessionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ThetaSessionResponseToJson(this);
}
