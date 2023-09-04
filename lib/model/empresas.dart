// To parse this JSON data, do
//
//     final usuario = usuarioFromMap(jsonString);

import 'dart:convert';

class Empresas {
  String codEmp;
  String nomEmp;
  String numRuc;
  String cl1Emp;
  String cl2Emp;
  String cl3Emp;
  String cl4Emp;
  String cl5Emp;
  DateTime fexEmp;
  String uiaEmp;
  int nlpWms;
  String prkWms;

  Empresas({
    required this.codEmp,
    required this.nomEmp,
    required this.numRuc,
    required this.cl1Emp,
    required this.cl2Emp,
    required this.cl3Emp,
    required this.cl4Emp,
    required this.cl5Emp,
    required this.fexEmp,
    required this.uiaEmp,
    required this.nlpWms,
    required this.prkWms,
  });

  factory Empresas.fromJson(String str) => Empresas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Empresas.fromMap(Map<String, dynamic> json) => Empresas(
        codEmp: json["codEmp"],
        nomEmp: json["nomEmp"],
        numRuc: json["numRuc"],
        cl1Emp: json["cl1Emp"],
        cl2Emp: json["cl2Emp"],
        cl3Emp: json["cl3Emp"],
        cl4Emp: json["cl4Emp"],
        cl5Emp: json["cl5Emp"],
        fexEmp: DateTime.parse(json["fexEmp"]),
        uiaEmp: json["uiaEmp"],
        nlpWms: json["nlpWms"],
        prkWms: json["prkWms"],
      );

  Map<String, dynamic> toMap() => {
        "codEmp": codEmp,
        "nomEmp": nomEmp,
        "numRuc": numRuc,
        "cl1Emp": cl1Emp,
        "cl2Emp": cl2Emp,
        "cl3Emp": cl3Emp,
        "cl4Emp": cl4Emp,
        "cl5Emp": cl5Emp,
        "fexEmp":
            "${fexEmp.year.toString().padLeft(4, '0')}-${fexEmp.month.toString().padLeft(2, '0')}-${fexEmp.day.toString().padLeft(2, '0')}",
        "uiaEmp": uiaEmp,
        "nlpWms": nlpWms,
        "prkWms": prkWms,
      };
}
