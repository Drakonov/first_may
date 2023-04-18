enum AuthType {
  call,
  sms,
  mail;

  String toJson() => name;

  static AuthType fromJson(String json) => values.byName(json);
}
