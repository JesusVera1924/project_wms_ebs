import 'package:fluro/fluro.dart';
import 'package:project_ebs_wms/provider/auth_provider.dart';
import 'package:project_ebs_wms/ui/views/dashboard_view.dart';
import 'package:project_ebs_wms/ui/views/login_view.dart';

import 'package:provider/provider.dart';

class AdminHandlers {
  static Handler login = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const LoginView();
    } else {
      return const DashboardView();
    }
  });

  static Handler register = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const DashboardView();
    } else {
      return const DashboardView();
    }
  });
}
