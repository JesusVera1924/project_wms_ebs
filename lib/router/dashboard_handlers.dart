import 'package:fluro/fluro.dart';
import 'package:project_ebs_wms/provider/auth_provider.dart';
import 'package:project_ebs_wms/provider/sidemenu_provider.dart';
import 'package:project_ebs_wms/router/router.dart';
import 'package:project_ebs_wms/ui/views/blank_view.dart';
import 'package:project_ebs_wms/ui/views/dashboard_view.dart';
import 'package:project_ebs_wms/ui/views/default_view.dart';
import 'package:project_ebs_wms/ui/views/login_view.dart';
import 'package:project_ebs_wms/ui/views/no_page_found_p_view.dart';
import 'package:project_ebs_wms/ui/views/picking/picking_venta_view.dart';
import 'package:project_ebs_wms/ui/views/picking/picking_view.dart';
import 'package:project_ebs_wms/ui/views/recepcion/recepcion_chequear_view.dart';
import 'package:project_ebs_wms/ui/views/recepcion/recepcion_view.dart';
import 'package:provider/provider.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(
        Flurorouter.dashboardRoute, "Dashboard".toUpperCase());

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const DashboardView();
    } else {
      return const LoginView();
    }
  });

  static Handler blank = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);
    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.blankRoute, '');

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const BlankView();
    } else {
      return const LoginView();
    }
  });

  static Handler wmsEbs = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.contabilidad, "wms_Ebs".toUpperCase());

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const DefaultView();
    } else {
      return const LoginView();
    }
  });
//-----------------------------------------RECEPCION---------------------------------------------------------
  static Handler recepcionPrincipal = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(
        Flurorouter.wmsRecepcionRouter,
        "Recepcion vista principal".toUpperCase());

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const RecepcionView();
    } else {
      return const LoginView();
    }
  });
  static Handler recepcionChequear = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(
        Flurorouter.wmsRecepcionChequearRouter,
        "Chequear embarque".toUpperCase());

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const RecepcionChequearView();
    } else {
      return const LoginView();
    }
  });
  static Handler recepcionTarea = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(
        Flurorouter.wmsRecepcionTareasRouter, "Generar Tareas".toUpperCase());

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const RecepcionView();
    } else {
      return const LoginView();
    }
  });
  static Handler recepcionDetalle = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(
        Flurorouter.wmsRecepcionDetalleRouter,
        "Detalle del embarque".toUpperCase());

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const RecepcionView();
    } else {
      return const LoginView();
    }
  });

  //-----------------------------------------PICKING---------------------------------------------------------
  static Handler pickingPrincipal = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(
        Flurorouter.wmsPickingRoute, "Picking vista principal".toUpperCase());

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const PickingView();
    } else {
      return const LoginView();
    }
  });

  static Handler pickingVenta = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false).setCurrentPageUrl(
        Flurorouter.wmsPickingRoute, "Picking Venta".toUpperCase());

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const PickingVentaView();
    } else {
      return const LoginView();
    }
  });

  //--------------------------------------------------------------------------------------------------
  static Handler notFound = Handler(handlerFunc: (context, params) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SideMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.notFound, "".toUpperCase());

    if (authProvider.authStatus == AuthStatus.authenticated) {
      if (params['view']!.first.isNotEmpty) {
        return NoPageFoundPView(
          mensaje: params['view']!.first,
        );
      } else {
        return const DashboardView();
      }
    } else {
      return const LoginView();
    }
  });
}
