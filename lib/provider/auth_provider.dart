import 'package:flutter/material.dart';
import 'package:project_ebs_wms/model/empresas.dart';
import 'package:project_ebs_wms/provider/sidemenu_provider.dart';
import 'package:project_ebs_wms/router/router.dart';
import 'package:project_ebs_wms/services/local_storage.dart';
import 'package:project_ebs_wms/api/solicitud_api.dart';
import 'package:project_ebs_wms/services/navigation_service.dart';
import 'package:project_ebs_wms/services/notifications_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  final _api = SolicitudApi();
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  Future<List<Empresas>> login(String email, String password) async {
    /* List<Empresa> lista */
    final authResponse = await _api.accessLogin(email, password);
    if (authResponse != null) {
      authStatus = AuthStatus.authenticated;
      LocalStorage.prefs.setString('token', authResponse.token);
      LocalStorage.prefs.setString('usuario', authResponse.usuario.toJson());
      return authResponse.empresas;
    } else {
      NotificationsService.showSnackbarError('Usuario / Password no válidos');
      return [];
    }
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');
    final codEmp = LocalStorage.prefs.getString('emp');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      authStatus = AuthStatus.authenticated;
      loadingParams(codEmp!);
      notifyListeners();
      return true;
    } catch (e) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  logout() {
    /* LIMPIAR STORAGE */
    LocalStorage.prefs.remove('token');
    LocalStorage.prefs.remove('dni');
    LocalStorage.prefs.remove('emp');
    LocalStorage.prefs.remove('idModule');
    LocalStorage.prefs.remove('nomEmp');
    /* CAMBIAR ESTADO DE AUTENTICACION */
    authStatus = AuthStatus.notAuthenticated;
    notifyListeners();
  }

  loadingParams(String codEmp) async {
    final token = LocalStorage.prefs.getString('token');
    try {
      //verificar token
      //token
      NavigationService.replaceTo(Flurorouter.dashboardRoute);
    } catch (e) {
      NavigationService.replaceTo("/contabilidad/notfound/$e");
      SideMenuProvider.enableItems = false;
    }

    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }
}
