// To parse this JSON data, do
//
//     final persons = personsFromJson(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final persons = personsFromJson(jsonString);

import 'dart:convert';

class Person {
  final int idPerson;
  final int serviceNumber;
  final String fullName;
  final DateTime dateStart;
  final DateTime dateEnd;
  final int rating;
  final bool isProduction;
  final int age;
  final int idWorkshop;

  Person({
    required this.idPerson,
    required this.serviceNumber,
    required this.fullName,
    required this.dateStart,
    required this.dateEnd,
    required this.rating,
    required this.isProduction,
    required this.age,
    required this.idWorkshop,
  });

  factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    idPerson: json["idPerson"],
    serviceNumber: json["serviceNumber"],
    fullName: json["fullName"],
    dateStart: DateTime.parse(json["dateStart"]),
    dateEnd: DateTime.parse(json["dateEnd"]),
    rating: json["rating"],
    isProduction: json["isProduction"],
    age: json["age"],
    idWorkshop: json["idWorkshop"],
  );

  Map<String, dynamic> toJson() => {
    "idPerson": idPerson,
    "serviceNumber": serviceNumber,
    "fullName": fullName,
    "dateStart": dateStart.toIso8601String(),
    "dateEnd": dateEnd.toIso8601String(),
    "rating": rating,
    "isProduction": isProduction,
    "age": age,
    "idWorkshop": idWorkshop,
  };
}

