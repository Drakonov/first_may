// To parse this JSON data, do
//
//     final persons = personsFromJson(jsonString);

import 'dart:convert';

class Persons {
  Persons({
    required this.persons,
  });

  final List<Person> persons;

  factory Persons.fromRawJson(String str) => Persons.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Persons.fromJson(Map<String, dynamic> json) => Persons(
        persons: List<Person>.from(json["persons"].map((x) => Person.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "persons": List<dynamic>.from(persons.map((x) => x.toJson())),
      };
}

class Person {
  Person({
    required this.fullname,
  });

  final String fullname;

  factory Person.fromRawJson(String str) => Person.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "fullname": fullname,
      };
}
