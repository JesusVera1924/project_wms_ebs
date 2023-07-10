import 'dart:convert';

class KarmovResponse {
  KarmovResponse({
    required this.codEmp,
    required this.codPto,
    required this.numMov,
    required this.codMov,
    required this.codRef,
    required this.nomRef,
    required this.fecMov,
    required this.lin,
    required this.rev,
    required this.pro,
    required this.estado,
  });

  String codEmp;
  String codPto;
  String numMov;
  String codMov;
  String codRef;
  String nomRef;
  DateTime fecMov;
  int lin;
  int rev;
  double pro;
  int estado;

  factory KarmovResponse.fromJson(String str) =>
      KarmovResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory KarmovResponse.fromMap(Map<String, dynamic> json) => KarmovResponse(
        codEmp: json["cod_emp"],
        codPto: json["cod_pto"],
        numMov: json["num_mov"],
        codMov: json["cod_mov"],
        codRef: json["cod_ref"],
        nomRef: json["nom_ref"],
        fecMov: DateTime.parse(json["fec_mov"]),
        lin: json["lin"],
        rev: json["rev"],
        pro: json["pro"]?.toDouble(),
        estado: json["estado"],
      );

  Map<String, dynamic> toMap() => {
        "cod_emp": codEmp,
        "cod_pto": codPto,
        "num_mov": numMov,
        "cod_mov": codMov,
        "cod_ref": codRef,
        "nom_ref": nomRef,
        "fec_mov": fecMov.toIso8601String(),
        "lin": lin,
        "rev": rev,
        "pro": pro,
        "estado": estado,
      };
}
