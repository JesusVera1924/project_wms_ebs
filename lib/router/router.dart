import 'package:fluro/fluro.dart';
import 'package:project_ebs_wms/router/admin_handlers.dart';
import 'package:project_ebs_wms/router/dashboard_handlers.dart';
import 'package:project_ebs_wms/router/no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';

  // Auth Router
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  //pantalla de modelo
  static String blankRoute = '/dashboard/blank';
  /* Nuevas rutas */

  /* GRUPO */
  // Dashboard --> tiene que pasar hacer la pantalla de la generacion de los modulos del grupo
  static String dashboardRoute = '/dashboard';
  static String wms = '/wms';

  static String contabilidad = '/contabilidad';
  static String seguridad = '/seguridad';

  /*URL MODULO SEGURIDAD */
  static String seguridadUsuario = '/seguridad/usuario';
  //MODULO DE PAGINA NO ENCONTRADA
  static String notFound = '/contabilidad/notfound/:view';
  //MODULO DE WMS RECPCION
  static String wmsRecepcionRouter = '/wms/recepcion';
  static String wmsRecepcionChequearRouter = '/wms/recepcion/chequear';
  static String wmsRecepcionTareasRouter = '/wms/recepcion/tareas';
  static String wmsRecepcionDetalleRouter = '/wms/recepcion/detalles';

  //MODULO DE WMS PICKING
  static String wmsPickingRoute = '/wms/picking';
  static String wmsPickingRouter = '/wms/picking/view';

  static void configureRoutes() {
    // Auth Routes
    router.define(rootRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute,
        handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute,
        handler: AdminHandlers.register, transitionType: TransitionType.none);

    router.define(notFound,
        handler: DashboardHandlers.notFound,
        transitionType: TransitionType.fadeIn);
    // Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);

    router.define(blankRoute,
        handler: DashboardHandlers.blank,
        transitionType: TransitionType.fadeIn);
    //WMS
    router.define(wms,
        handler: DashboardHandlers.wmsEbs,
        transitionType: TransitionType.fadeIn);
    //MODULOS DE RECEPCION - WMS
    router.define(wmsRecepcionRouter,
        handler: DashboardHandlers.recepcionPrincipal,
        transitionType: TransitionType.fadeIn);
    router.define(wmsRecepcionChequearRouter,
        handler: DashboardHandlers.recepcionChequear,
        transitionType: TransitionType.fadeIn);
    router.define(wmsRecepcionTareasRouter,
        handler: DashboardHandlers.recepcionTarea,
        transitionType: TransitionType.fadeIn);
    router.define(wmsRecepcionDetalleRouter,
        handler: DashboardHandlers.recepcionDetalle,
        transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
