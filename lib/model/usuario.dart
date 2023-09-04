// To parse this JSON data, do
//
//     final usuario = usuarioFromMap(jsonString);

import 'dart:convert';

class Usuario {
  String codEmp;
  String codUsr;
  String nomUsr;
  String clvUsr;
  String ctaUsr;
  String nicUsr;
  String corUsr;
  String celUsr;
  String rolUsr;
  String clsUsr;
  DateTime fexUsr;
  String stsUsr;

  Usuario({
    required this.codEmp,
    required this.codUsr,
    required this.nomUsr,
    required this.clvUsr,
    required this.ctaUsr,
    required this.nicUsr,
    required this.corUsr,
    required this.celUsr,
    required this.rolUsr,
    required this.clsUsr,
    required this.fexUsr,
    required this.stsUsr,
  });

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        codEmp: json["codEmp"],
        codUsr: json["codUsr"],
        nomUsr: json["nomUsr"],
        clvUsr: json["clvUsr"],
        ctaUsr: json["ctaUsr"],
        nicUsr: json["nicUsr"],
        corUsr: json["corUsr"],
        celUsr: json["celUsr"],
        rolUsr: json["rolUsr"],
        clsUsr: json["clsUsr"],
        fexUsr: DateTime.parse(json["fexUsr"]),
        stsUsr: json["stsUsr"],
      );

  Map<String, dynamic> toMap() => {
        "codEmp": codEmp,
        "codUsr": codUsr,
        "nomUsr": nomUsr,
        "clvUsr": clvUsr,
        "ctaUsr": ctaUsr,
        "nicUsr": nicUsr,
        "corUsr": corUsr,
        "celUsr": celUsr,
        "rolUsr": rolUsr,
        "clsUsr": clsUsr,
        "fexUsr": fexUsr.toIso8601String(),
        "stsUsr": stsUsr,
      };
}
