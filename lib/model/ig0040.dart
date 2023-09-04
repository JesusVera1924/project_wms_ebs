import 'dart:convert';

class Ig0040Y {
  final String codEmp;
  final String codPto;
  final String codMov;
  final String numMov;
  final DateTime fecMov;
  final String codRef;
  final String nomRef;
  final String codCop;
  final String nomCop;
  final String dstCop;
  final dynamic alertar;
  final String pwaCop;
  final String pwaBod;
  final String codBod;
  final String uduMov;
  final dynamic obsMov;
  final String ucrMov;
  final DateTime fcrMov;
  final String stsIbs;
  final dynamic usrIbs;
  final dynamic fytIbs;
  final String stsFbs;
  final dynamic usrFbs;
  final dynamic fytFbs;
  final String stsLbs;
  final dynamic usrLbs;
  final dynamic fytLbs;
  final int cn1Mov;
  final int cn2Mov;
  final dynamic codGvt;

  Ig0040Y({
    required this.codEmp,
    required this.codPto,
    required this.codMov,
    required this.numMov,
    required this.fecMov,
    required this.codRef,
    required this.nomRef,
    required this.codCop,
    required this.nomCop,
    required this.dstCop,
    required this.alertar,
    required this.pwaCop,
    required this.pwaBod,
    required this.codBod,
    required this.uduMov,
    required this.obsMov,
    required this.ucrMov,
    required this.fcrMov,
    required this.stsIbs,
    required this.usrIbs,
    required this.fytIbs,
    required this.stsFbs,
    required this.usrFbs,
    required this.fytFbs,
    required this.stsLbs,
    required this.usrLbs,
    required this.fytLbs,
    required this.cn1Mov,
    required this.cn2Mov,
    required this.codGvt,
  });

  factory Ig0040Y.fromJson(String str) => Ig0040Y.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ig0040Y.fromMap(Map<String, dynamic> json) => Ig0040Y(
        codEmp: json["codEmp"],
        codPto: json["codPto"],
        codMov: json["codMov"],
        numMov: json["numMov"],
        fecMov: DateTime.parse(json["fecMov"]),
        codRef: json["codRef"],
        nomRef: json["nomRef"],
        codCop: json["codCop"],
        nomCop: json["nomCop"],
        dstCop: json["dstCop"],
        alertar: json["alertar"],
        pwaCop: json["pwaCop"],
        pwaBod: json["pwaBod"],
        codBod: json["codBod"],
        uduMov: json["uduMov"],
        obsMov: json["obsMov"],
        ucrMov: json["ucrMov"],
        fcrMov: DateTime.parse(json["fcrMov"]),
        stsIbs: json["stsIbs"],
        usrIbs: json["usrIbs"],
        fytIbs: json["fytIbs"],
        stsFbs: json["stsFbs"],
        usrFbs: json["usrFbs"],
        fytFbs: json["fytFbs"],
        stsLbs: json["stsLbs"],
        usrLbs: json["usrLbs"],
        fytLbs: json["fytLbs"],
        cn1Mov: json["cn1Mov"],
        cn2Mov: json["cn2Mov"],
        codGvt: json["codGvt"],
      );

  Map<String, dynamic> toMap() => {
        "codEmp": codEmp,
        "codPto": codPto,
        "codMov": codMov,
        "numMov": numMov,
        "fecMov": fecMov.toIso8601String(),
        "codRef": codRef,
        "nomRef": nomRef,
        "codCop": codCop,
        "nomCop": nomCop,
        "dstCop": dstCop,
        "alertar": alertar,
        "pwaCop": pwaCop,
        "pwaBod": pwaBod,
        "codBod": codBod,
        "uduMov": uduMov,
        "obsMov": obsMov,
        "ucrMov": ucrMov,
        "fcrMov": fcrMov.toIso8601String(),
        "stsIbs": stsIbs,
        "usrIbs": usrIbs,
        "fytIbs": fytIbs,
        "stsFbs": stsFbs,
        "usrFbs": usrFbs,
        "fytFbs": fytFbs,
        "stsLbs": stsLbs,
        "usrLbs": usrLbs,
        "fytLbs": fytLbs,
        "cn1Mov": cn1Mov,
        "cn2Mov": cn2Mov,
        "codGvt": codGvt,
      };
}
