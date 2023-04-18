import 'package:json_annotation/json_annotation.dart';

import 'request_object.dart';

part 'theta_session_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaSessionRequest extends RequestObject {
  ThetaSessionRequest({
    required this.timeout,
  });

  int timeout;

  factory ThetaSessionRequest.fromJson(Map<String, dynamic> json) => _$ThetaSessionRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ThetaSessionRequestToJson(this);
}
