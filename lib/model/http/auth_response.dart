import 'dart:convert';
import 'package:project_ebs_wms/model/empresas.dart';
import 'package:project_ebs_wms/model/usuario.dart';

class AuthResponse {
  AuthResponse({
    required this.usuario,
    required this.token,
    required this.empresas,
  });

  Usuario usuario;
  String token;
  List<Empresas> empresas;

  factory AuthResponse.fromJson(String str) =>
      AuthResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponse.fromMap(Map<String, dynamic> json) => AuthResponse(
        usuario: Usuario.fromMap(json["usuario"]),
        token: json["token"],
        empresas: List<Empresas>.from(
            json["empresas"].map((x) => Empresas.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "usuario": usuario.toMap(),
        "token": token,
        "empresas": List<dynamic>.from(empresas.map((x) => x.toMap())),
      };
}
