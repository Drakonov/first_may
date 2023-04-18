enum Status {
  error,
  success,
  ok;

  String toJson() => name;

  static Status fromJson(String json) => values.byName(json);
}
