import 'dart:convert';

class Karmov {
  String codEmp;
  String codPto;
  String codMov;
  String numMov;
  DateTime fecMov;
  dynamic cx1Mov;
  dynamic nx1Mov;
  dynamic fx1Mov;
  dynamic cx2Mov;
  dynamic nx2Mov;
  dynamic fx2Mov;
  String codRef;
  String nomRef;
  dynamic codFb1;
  dynamic codFb2;
  dynamic codFb3;
  int canQx1;
  int canQx2;
  int canQx3;
  String nomDg1;
  String nomDg2;
  String nomDg3;
  String codPro;
  String nomPro;
  String codAl1;
  String codAl2;
  String codAl3;
  String percha1;
  String percha2;
  String percha3;
  String codBod;
  int canMov;
  dynamic stsMov;
  dynamic obsMov;
  int cdsMov;
  dynamic sdsMov;
  dynamic odsMov;
  dynamic adaMov;
  int cdaMov;
  dynamic sdaMov;
  dynamic odaMov;
  dynamic bodMov;
  dynamic auxilia;
  int secMov;
  dynamic uduMov;
  DateTime fytMov;
  bool isSelect;

  Karmov(
      {required this.codEmp,
      required this.codPto,
      required this.codMov,
      required this.numMov,
      required this.fecMov,
      required this.cx1Mov,
      required this.nx1Mov,
      required this.fx1Mov,
      required this.cx2Mov,
      required this.nx2Mov,
      required this.fx2Mov,
      required this.codRef,
      required this.nomRef,
      required this.codFb1,
      required this.codFb2,
      required this.codFb3,
      required this.canQx1,
      required this.canQx2,
      required this.canQx3,
      required this.nomDg1,
      required this.nomDg2,
      required this.nomDg3,
      required this.codPro,
      required this.nomPro,
      required this.codAl1,
      required this.codAl2,
      required this.codAl3,
      required this.percha1,
      required this.percha2,
      required this.percha3,
      required this.codBod,
      required this.canMov,
      required this.stsMov,
      required this.obsMov,
      required this.cdsMov,
      required this.sdsMov,
      required this.odsMov,
      required this.adaMov,
      required this.cdaMov,
      required this.sdaMov,
      required this.odaMov,
      required this.bodMov,
      required this.auxilia,
      required this.secMov,
      required this.uduMov,
      required this.fytMov,
      this.isSelect = false});

  factory Karmov.fromJson(String str) => Karmov.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Karmov.fromMap(Map<String, dynamic> json) => Karmov(
        codEmp: json["cod_emp"],
        codPto: json["cod_pto"],
        codMov: json["cod_mov"],
        numMov: json["num_mov"],
        fecMov: DateTime.parse(json["fec_mov"]),
        cx1Mov: json["cx1_mov"],
        nx1Mov: json["nx1_mov"],
        fx1Mov: json["fx1_mov"],
        cx2Mov: json["cx2_mov"],
        nx2Mov: json["nx2_mov"],
        fx2Mov: json["fx2_mov"],
        codRef: json["cod_ref"],
        nomRef: json["nom_ref"],
        codFb1: json["cod_fb1"],
        codFb2: json["cod_fb2"],
        codFb3: json["cod_fb3"],
        canQx1: json["can_qx1"],
        canQx2: json["can_qx2"],
        canQx3: json["can_qx3"],
        nomDg1: json["nom_dg1"],
        nomDg2: json["nom_dg2"],
        nomDg3: json["nom_dg3"],
        codPro: json["cod_pro"],
        nomPro: json["nom_pro"],
        codAl1: json["cod_al1"] ?? "",
        codAl2: json["cod_al2"] ?? "",
        codAl3: json["cod_al3"] ?? "",
        percha1: json["percha1"] ?? "",
        percha2: json["percha2"] ?? "",
        percha3: json["percha3"] ?? "",
        codBod: json["cod_bod"],
        canMov: json["can_mov"],
        stsMov: json["sts_mov"],
        obsMov: json["obs_mov"],
        cdsMov: json["cds_mov"],
        sdsMov: json["sds_mov"],
        odsMov: json["ods_mov"],
        adaMov: json["ada_mov"],
        cdaMov: json["cda_mov"],
        sdaMov: json["sda_mov"],
        odaMov: json["oda_mov"],
        bodMov: json["bod_mov"],
        auxilia: json["auxilia"],
        secMov: json["sec_mov"],
        uduMov: json["udu_mov"],
        fytMov: DateTime.parse(json["fyt_mov"]),
      );

  Map<String, dynamic> toMap() => {
        "cod_emp": codEmp,
        "cod_pto": codPto,
        "cod_mov": codMov,
        "num_mov": numMov,
        "fec_mov": fecMov.toIso8601String(),
        "cx1_mov": cx1Mov,
        "nx1_mov": nx1Mov,
        "fx1_mov": fx1Mov,
        "cx2_mov": cx2Mov,
        "nx2_mov": nx2Mov,
        "fx2_mov": fx2Mov,
        "cod_ref": codRef,
        "nom_ref": nomRef,
        "cod_fb1": codFb1,
        "cod_fb2": codFb2,
        "cod_fb3": codFb3,
        "can_qx1": canQx1,
        "can_qx2": canQx2,
        "can_qx3": canQx3,
        "nom_dg1": nomDg1,
        "nom_dg2": nomDg2,
        "nom_dg3": nomDg3,
        "cod_pro": codPro,
        "nom_pro": nomPro,
        "cod_al1": codAl1,
        "cod_al2": codAl2,
        "cod_al3": codAl3,
        "percha1": percha1,
        "percha2": percha2,
        "percha3": percha3,
        "cod_bod": codBod,
        "can_mov": canMov,
        "sts_mov": stsMov,
        "obs_mov": obsMov,
        "cds_mov": cdsMov,
        "sds_mov": sdsMov,
        "ods_mov": odsMov,
        "ada_mov": adaMov,
        "cda_mov": cdaMov,
        "sda_mov": sdaMov,
        "oda_mov": odaMov,
        "bod_mov": bodMov,
        "auxilia": auxilia,
        "sec_mov": secMov,
        "udu_mov": uduMov,
        "fyt_mov": fytMov.toIso8601String(),
      };
}
