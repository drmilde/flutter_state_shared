// To parse this JSON data, do
//
//     final kind = kindFromJson(jsonString);

import 'dart:convert';

Kind kindFromJson(String str) => Kind.fromJson(json.decode(str));

String kindToJson(Kind data) => json.encode(data.toJson());

class Kind {
  String name;
  int alter;

  Kind({
    this.name = "",
    this.alter = 0,
  });


  factory Kind.fromJson(Map<String, dynamic> json) => Kind(
    name: json["name"],
    alter: json["alter"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "alter": alter,
  };
}
