
import 'dart:convert';

class MenuResponse {
  MenuResponse({
    required this.codPry,
    required this.nomPry,
    required this.clsPry,
    required this.hpvPry,
    required this.clxPry,
    required this.idxPry,
    required this.rtxPry,
    required this.l01Pry,
    required this.l02Pry,
    required this.stsPry,
    required this.perCcc,
  });

  String codPry;
  String nomPry;
  String clsPry;
  String hpvPry;
  String clxPry;
  int idxPry;
  String rtxPry;
  String l01Pry;
  String l02Pry;
  String stsPry;
  String perCcc;

  factory MenuResponse.fromJson(String str) =>
      MenuResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MenuResponse.fromMap(Map<String, dynamic> json) => MenuResponse(
        codPry: json["cod_pry"],
        nomPry: json["nom_pry"],
        clsPry: json["cls_pry"],
        hpvPry: json["hpv_pry"],
        clxPry: json["clx_pry"],
        idxPry: json["idx_pry"],
        rtxPry: json["rtx_pry"],
        l01Pry: json["l01_pry"],
        l02Pry: json["l02_pry"],
        stsPry: json["sts_pry"],
        perCcc: json["per_ccc"],
      );

  Map<String, dynamic> toMap() => {
        "cod_pry": codPry,
        "nom_pry": nomPry,
        "cls_pry": clsPry,
        "hpv_pry": hpvPry,
        "clx_pry": clxPry,
        "idx_pry": idxPry,
        "rtx_pry": rtxPry,
        "l01_pry": l01Pry,
        "l02_pry": l02Pry,
        "sts_pry": stsPry,
        "per_ccc": perCcc,
      };
}
