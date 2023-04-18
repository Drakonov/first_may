import 'package:first_may/domain/dto/theta/theta_options.dart';
import 'package:json_annotation/json_annotation.dart';

import 'request_object.dart';

part 'theta_set_options_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.none)
class ThetaSetOptionsRequest extends RequestObject {
  ThetaSetOptionsRequest({
    required this.sessionId,
    required this.options,
  });

  String sessionId;
  ThetaOptions options;

  factory ThetaSetOptionsRequest.fromJson(Map<String, dynamic> json) => _$ThetaSetOptionsRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ThetaSetOptionsRequestToJson(this);
}
