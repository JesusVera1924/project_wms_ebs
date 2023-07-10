import 'dart:convert';
import 'package:project_ebs_wms/model/usuario.dart';

class AuthResponse {
  AuthResponse({
    required this.usuario,
    required this.token,
    required this.empresa,
  });

  Usuario usuario;
  String token;
  List<Empresa> empresa;

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
        empresa:
            List<Empresa>.from(json["empresa"].map((x) => Empresa.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
        "empresa": List<dynamic>.from(empresa.map((x) => x.toMap())),
      };
}

class Empresa {
  Empresa({
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
  });

  String codEmp;
  String nomEmp;
  String numRuc;
  String cl1Emp;
  String cl2Emp;
  String cl3Emp;
  String cl4Emp;
  String cl5Emp;
  String fexEmp;
  String uiaEmp;

  factory Empresa.fromJson(String str) => Empresa.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Empresa.fromMap(Map<String, dynamic> json) => Empresa(
        codEmp: json["cod_emp"],
        nomEmp: json["nom_emp"],
        numRuc: json["num_ruc"],
        cl1Emp: json["cl1_emp"],
        cl2Emp: json["cl2_emp"],
        cl3Emp: json["cl3_emp"],
        cl4Emp: json["cl4_emp"],
        cl5Emp: json["cl5_emp"],
        fexEmp: json["fex_emp"],
        uiaEmp: json["uia_emp"],
      );

  Map<String, dynamic> toMap() => {
        "cod_emp": codEmp,
        "nom_emp": nomEmp,
        "num_ruc": numRuc,
        "cl1_emp": cl1Emp,
        "cl2_emp": cl2Emp,
        "cl3_emp": cl3Emp,
        "cl4_emp": cl4Emp,
        "cl5_emp": cl5Emp,
        "fex_emp": fexEmp,
        "uia_emp": uiaEmp,
      };
}
