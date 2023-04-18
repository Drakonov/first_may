import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';

@JsonSerializable()
class Token {
  Token({
    required this.name,
    required this.value,
    required this.expires,
    required this.domain,
  });

  String name;
  String value;
  int expires;
  String domain;

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);
}
