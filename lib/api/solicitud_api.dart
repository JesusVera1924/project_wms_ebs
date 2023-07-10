import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_ebs_wms/model/http/auth_response.dart';
import 'package:project_ebs_wms/model/http/menu_response.dart';

class SolicitudApi {
  // "https://www.cojapan.com.ec/cg"; COJAPAN
  //http://localhost:8080/cg //LOCAL
  //http://181.198.194.102:8088/cg DISTRIMIA

  static String baseUrl = "http://192.168.3.4:8082/cg";
  //final String _token = LocalStorage.prefs.getString('token') ?? '';
  //final String _defaultMessage = 'COMUNICARSE CON EL ADMINISTRADOR';

  Future<AuthResponse?> getFindUser(String email, String pass) async {
    var url = Uri.parse("$baseUrl/auth/login?email=$email&password=$pass");
    try {
      final respuesta = await http.post(url);
      if (respuesta.statusCode == 200) {
        return utf8.decode(respuesta.bodyBytes) != ""
            ? AuthResponse.fromJson(utf8.decode(respuesta.bodyBytes))
            : null;
      } else {
        throw Exception(respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('$e');
    }
  }

//#Enlace con menu
  Future<List<MenuResponse>> getMenuUser(emp, usuario, token) async {
    var url =
        Uri.parse("$baseUrl/5300ga/permisos?cod_emp=$emp&cod_user=$usuario");

    try {
      http.Response respuesta =
          await http.get(url, headers: {"Authorization": token});

      if (respuesta.statusCode == 200) {
        return parseListMenu(utf8.decode(respuesta.bodyBytes));
      } else {
        throw Exception(respuesta.statusCode.toString());
      }
    } catch (e) {
      throw ('$e');
    }
  }

  //#endregion

  ///Metodos para parser el Json en lista
  List<MenuResponse> parseListMenu(String respuesta) {
    final parseo = jsonDecode(respuesta);
    return parseo
        .map<MenuResponse>((json) => MenuResponse.fromMap(json))
        .toList();
  }
}
