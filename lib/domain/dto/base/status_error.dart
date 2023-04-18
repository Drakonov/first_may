import 'package:json_annotation/json_annotation.dart';

part 'status_error.g.dart';

@JsonSerializable()
class StatusError {
  StatusError({
    required this.code,
    required this.errorMessage,
  });

  int code;
  String errorMessage;

  factory StatusError.fromJson(Map<String, dynamic> json) => _$StatusErrorFromJson(json);

  Map<String, dynamic> toJson() => _$StatusErrorToJson(this);
}
