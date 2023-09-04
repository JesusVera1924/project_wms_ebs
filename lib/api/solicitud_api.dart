import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_ebs_wms/model/http/auth_response.dart';
import 'package:project_ebs_wms/model/http/menu_response.dart';
import 'package:project_ebs_wms/model/ig0040.dart';
import 'package:project_ebs_wms/model/karmov.dart';
import 'package:project_ebs_wms/model/repuesta.dart';

class SolicitudApi {
  final String defaultMessage = 'COMUNICARSE CON EL ADMINISTRADOR';
  static String baseUrl = "http://192.168.3.60:8080/ebs_wms";
  //final String _token = LocalStorage.prefs.getString('token') ?? '';

  Future<AuthResponse?> accessLogin(String email, String pass) async {
    var url = Uri.parse("$baseUrl/auth/login?email=$email&password=$pass");
    try {
      final respuesta = await http.get(url);
      if (respuesta.statusCode == 200) {
        final dao = Respuesta.fromJson(utf8.decode(respuesta.bodyBytes));
        if (dao.code == 200) {
          print(dao.data.toString());
          return AuthResponse.fromMap(dao.data);
        }
      } else {
        throw Exception(respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('$e');
    }
    return null;
  }

//#Enlace con menu
  Future<List<MenuResponse>?> getMenuUser(
      String emp, String usuario, String token, String ambiente) async {
    var url = Uri.parse(
        "$baseUrl/auth/permisos?cod_emp=$emp&cod_user=$usuario&ambiente=$ambiente");

    print(url.toString());

    try {
      http.Response respuesta = await http.get(url);

      if (respuesta.statusCode == 200) {
        final dao = Respuesta.fromJson(utf8.decode(respuesta.bodyBytes));
        if (dao.code == 200) {
          return dao.data
              .map<MenuResponse>((json) => MenuResponse.fromMap(json))
              .toList();
        }
      } else {
        throw Exception(respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('$e');
    }
    return null;
  }
  //#endregion

//#Enlace lista de pendiente
  Future<List<Ig0040Y>?> getIg0040yPend(
      String codEmp, String codPto, String user, String tipo) async {
    var url = Uri.parse(
        "$baseUrl/bodega/getAllPedPend?codEmp=$codEmp&codPto=$codPto&user=$user&tipo=$tipo&codBod=02");

    print(url.toString());

    try {
      http.Response respuesta = await http.get(url);

      if (respuesta.statusCode == 200) {
        final dao = Respuesta.fromJson(utf8.decode(respuesta.bodyBytes));
        if (dao.code == 200) {
          return dao.data
              .map<Ig0040Y>((json) => Ig0040Y.fromMap(json))
              .toList();
        }
      } else {
        throw Exception(respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('$e');
    }
    return null;
  }
  //#endregion

//#Enlace lista de pendiente detalle
  Future<List<Karmov>?> getKarmovDetailPend(String codEmp, String codPto,
      String codMov, String numMov, String fecMov) async {
    var url = Uri.parse(
        "$baseUrl/karmov/getAll?cod_emp=$codEmp&cod_pto=$codPto&cod_mov=$codMov&num_mov=$numMov&fec_mov=$fecMov");

    print(url.toString());

    try {
      http.Response respuesta = await http.get(url);

      if (respuesta.statusCode == 200) {
        final dao = Respuesta.fromJson(utf8.decode(respuesta.bodyBytes));
        if (dao.code == 200) {
          return dao.data.map<Karmov>((json) => Karmov.fromMap(json)).toList();
        }
      } else {
        throw Exception(respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('$e');
    }
    return null;
  }

  //#endregion
//#ANULAR PEDIDO
  Future<String> anularIg0040y(Ig0040Y datos, String tipo) async {
    var url = Uri.parse("$baseUrl/picking/annulPicking?tipo=$tipo");
    var objetoJson = datos.toJson();
    var resp = "";
    //----
    print(url.toString());
    print(objetoJson);

    try {
      http.Response respuesta = await http.post(url,
          body: objetoJson,
          headers: {"Content-type": "application/json;charset=UTF-8"});

      if (respuesta.statusCode == 200) {
        final dao = Respuesta.fromJson(utf8.decode(respuesta.bodyBytes));
        if (dao.code == 200 || dao.code == 204) {
          resp = dao.msg;
        }
      } else {
        throw Exception(respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('$e');
    }
    return resp;
  }
  //#endregion
}
