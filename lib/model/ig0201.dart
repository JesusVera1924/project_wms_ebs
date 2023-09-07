import 'dart:convert';

class Ig0201 {
  final String codEmp;
  final String codPto;
  final String numPed;
  final DateTime fecPed;
  final dynamic obsPed;
  final String numSug;
  final String ncrSug;
  final String codPrv;
  final String divCtz;
  final double valCtz;
  final dynamic numCtz;
  final DateTime fecCtz;
  final int vigCtz;
  final dynamic obsCtz;
  final String obsNeg;
  final String pagNeg;
  final String tipEmb;
  final double cubEmb;
  final double psoEmb;
  final int ctnEmb;
  final String ptoZar;
  final String vapZar;
  final DateTime fecZar;
  final dynamic logZar;
  final String ptoArr;
  final DateTime fecArr;
  final dynamic obsArr;
  final String nm1Arr;
  final String nm2Arr;
  final dynamic nm3Arr;
  final String obsBod;
  final String codBod;
  final String divLis;
  final double valLis;
  final double facCos;
  final double facVta;
  final String s1SPed;
  final String s2SPed;
  final String stsPed;

  Ig0201({
    required this.codEmp,
    required this.codPto,
    required this.numPed,
    required this.fecPed,
    required this.obsPed,
    required this.numSug,
    required this.ncrSug,
    required this.codPrv,
    required this.divCtz,
    required this.valCtz,
    required this.numCtz,
    required this.fecCtz,
    required this.vigCtz,
    required this.obsCtz,
    required this.obsNeg,
    required this.pagNeg,
    required this.tipEmb,
    required this.cubEmb,
    required this.psoEmb,
    required this.ctnEmb,
    required this.ptoZar,
    required this.vapZar,
    required this.fecZar,
    required this.logZar,
    required this.ptoArr,
    required this.fecArr,
    required this.obsArr,
    required this.nm1Arr,
    required this.nm2Arr,
    required this.nm3Arr,
    required this.obsBod,
    required this.codBod,
    required this.divLis,
    required this.valLis,
    required this.facCos,
    required this.facVta,
    required this.s1SPed,
    required this.s2SPed,
    required this.stsPed,
  });

  factory Ig0201.fromJson(String str) => Ig0201.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Ig0201.fromMap(Map<String, dynamic> json) => Ig0201(
        codEmp: json["codEmp"] ?? "",
        codPto: json["codPto"] ?? "",
        numPed: json["numPed"] ?? "",
        fecPed: DateTime.parse(json["fecPed"]),
        obsPed: json["obsPed"] ?? "",
        numSug: json["numSug"] ?? "",
        ncrSug: json["ncrSug"] ?? "",
        codPrv: json["codPrv"] ?? "",
        divCtz: json["divCtz"] ?? "",
        valCtz: json["valCtz"].toDouble() ?? 0,
        numCtz: json["numCtz"] ?? "",
        fecCtz: json["fecCtz"] == null
            ? DateTime.now()
            : DateTime.parse(json["fecCtz"]),
        vigCtz: json["vigCtz"] ?? "",
        obsCtz: json["obsCtz"] ?? "",
        obsNeg: json["obsNeg"] ?? "",
        pagNeg: json["pagNeg"] ?? "",
        tipEmb: json["tipEmb"] ?? "",
        cubEmb: json["cubEmb"].toDouble() ?? 0,
        psoEmb: json["psoEmb"].toDouble() ?? 0,
        ctnEmb: json["ctnEmb"] ?? "",
        ptoZar: json["ptoZar"] ?? "",
        vapZar: json["vapZar"] ?? "",
        fecZar: DateTime.parse(json["fecZar"]),
        logZar: json["logZar"] ?? "",
        ptoArr: json["ptoArr"] ?? "",
        fecArr: DateTime.parse(json["fecArr"]),
        obsArr: json["obsArr"] ?? "",
        nm1Arr: json["nm1Arr"] ?? "",
        nm2Arr: json["nm2Arr"] ?? "",
        nm3Arr: json["nm3Arr"] ?? "",
        obsBod: json["obsBod"] ?? "",
        codBod: json["codBod"] ?? "",
        divLis: json["divLis"] ?? "",
        valLis: json["valLis"].toDouble() ?? 0,
        facCos: json["facCos"].toDouble() ?? 0,
        facVta: json["facVta"].toDouble() ?? 0,
        s1SPed: json["s1sPed"] ?? "",
        s2SPed: json["s2sPed"] ?? "",
        stsPed: json["stsPed"] ?? "",
      );

  Map<String, dynamic> toMap() => {
        "codEmp": codEmp,
        "codPto": codPto,
        "numPed": numPed,
        "fecPed":
            "${fecPed.year.toString().padLeft(4, '0')}-${fecPed.month.toString().padLeft(2, '0')}-${fecPed.day.toString().padLeft(2, '0')}",
        "obsPed": obsPed,
        "numSug": numSug,
        "ncrSug": ncrSug,
        "codPrv": codPrv,
        "divCtz": divCtz,
        "valCtz": valCtz,
        "numCtz": numCtz,
        "fecCtz":
            "${fecCtz.year.toString().padLeft(4, '0')}-${fecCtz.month.toString().padLeft(2, '0')}-${fecCtz.day.toString().padLeft(2, '0')}",
        "vigCtz": vigCtz,
        "obsCtz": obsCtz,
        "obsNeg": obsNeg,
        "pagNeg": pagNeg,
        "tipEmb": tipEmb,
        "cubEmb": cubEmb,
        "psoEmb": psoEmb,
        "ctnEmb": ctnEmb,
        "ptoZar": ptoZar,
        "vapZar": vapZar,
        "fecZar":
            "${fecZar.year.toString().padLeft(4, '0')}-${fecZar.month.toString().padLeft(2, '0')}-${fecZar.day.toString().padLeft(2, '0')}",
        "logZar": logZar,
        "ptoArr": ptoArr,
        "fecArr":
            "${fecArr.year.toString().padLeft(4, '0')}-${fecArr.month.toString().padLeft(2, '0')}-${fecArr.day.toString().padLeft(2, '0')}",
        "obsArr": obsArr,
        "nm1Arr": nm1Arr,
        "nm2Arr": nm2Arr,
        "nm3Arr": nm3Arr,
        "obsBod": obsBod,
        "codBod": codBod,
        "divLis": divLis,
        "valLis": valLis,
        "facCos": facCos,
        "facVta": facVta,
        "s1sPed": s1SPed,
        "s2sPed": s2SPed,
        "stsPed": stsPed,
      };
}
