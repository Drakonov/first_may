// To parse this JSON data, do
//
//     final persons = personsFromJson(jsonString);

import 'dart:convert';

Map<String, dynamic> testData = {
  "persons": [
    {
      "fullname": "Василий Головикин Юрьевич",
      "summ": 1250.5,
      "date": "2000-01-23T01:23:45.678+09:00",
    },
    {
      "fullname": "Василий Головикин Юрьевич",
      "summ": 10.5,
      "date": "2000-01-23T01:23:45.678+09:00",
    },
    {
      "fullname": "Василий Головикин Юрьевич",
      "summ": 250.6,
      "date": "2000-01-23T01:23:45.678+09:00",
    },
    {
      "fullname": "Михаил Юрьевич Лопатин",
      "summ": 250.5,
      "date": "2000-01-23T01:23:45.678+09:00",
    },
  ]
};

class Sells {
  Sells({
    required this.sells,
  });

  final List<Sell> sells;

  factory Sells.fromRawJson(String str) => Sells.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sells.fromJson(Map<String, dynamic> json) => Sells(
        sells: List<Sell>.from(json["persons"].map((x) => Sell.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "persons": List<dynamic>.from(sells.map((x) => x.toJson())),
      };
}

class Sell {
  Sell({
    required this.fullname,
    required this.summ,
    required this.date,
  });

  final String fullname;
  final double summ;
  final DateTime date;

  factory Sell.fromRawJson(String str) => Sell.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sell.fromJson(Map<String, dynamic> json) => Sell(
        fullname: json["fullname"],
        summ: json["summ"]?.toDouble(),
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
        "summ": summ,
        "date": date.toIso8601String(),
      };
}
