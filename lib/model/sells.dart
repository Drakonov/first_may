// To parse this JSON data, do
//
//     final persons = personsFromJson(jsonString);

import 'dart:convert';

import 'package:first_may/model/person.dart';

class Sell {
  final int? id;
  final int? idSell;
  final double sum;
  final DateTime dateSell;
  final bool? isPrimary;
  final int? primarySellId;
  final Person person;

  Sell({
    this.id,
    this.idSell,
    required this.sum,
    required this.dateSell,
    this.isPrimary,
    this.primarySellId,
    required this.person,
  });

  factory Sell.fromRawJson(String str) => Sell.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sell.fromJson(Map<String, dynamic> json) => Sell(
        id: json["id"],
        idSell: json["idSell"],
        sum: json["sum"],
        dateSell: DateTime.parse(json["dateSell"]),
        isPrimary: json["isPrimary"],
        primarySellId: json["primarySellId"],
        person: Person.fromJson(json["person"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "idSell": idSell,
        "sum": sum,
        "dateSell": dateSell.toIso8601String(),
        "isPrimary": isPrimary,
        "primarySellId": primarySellId,
        "person": person.toJson(),
      };
}
