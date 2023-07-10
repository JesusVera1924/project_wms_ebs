import 'package:flutter/material.dart';
import 'package:project_ebs_wms/provider/auth_provider.dart';
import 'package:project_ebs_wms/provider/sidemenu_provider.dart';
import 'package:project_ebs_wms/router/router.dart';
import 'package:project_ebs_wms/services/local_storage.dart';
import 'package:project_ebs_wms/services/navigation_service.dart';
import 'package:project_ebs_wms/ui/shared/widgets/logo.dart';
import 'package:project_ebs_wms/ui/shared/widgets/menu_item.dart';
import 'package:project_ebs_wms/ui/shared/widgets/text_separator.dart';
import 'package:provider/provider.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  void navigateTo(String routeName, {String module = ''}) {
    LocalStorage.prefs.setString('idModule', module);
    NavigationService.replaceTo(routeName);
    SideMenuProvider.closeMenu();
  }

  @override
  void initState() {
    //INIZIALIZAR CONSULTA DEL MENU
    Provider.of<SideMenuProvider>(context, listen: false).initList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 230,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          const SizedBox(height: 50),
          const TextSeparator(text: 'main'),
          //GENERACION DEL MENU
          MenuItems(
            text: 'Dashboard'.toUpperCase(),
            icon: Icons.compass_calibration_outlined,
            onPressed: () => navigateTo(Flurorouter.dashboardRoute),
            isActive: SideMenuProvider.enableItems
                ? sideMenuProvider.currentPage == Flurorouter.dashboardRoute
                : false,
          ),
          for (var item in sideMenuProvider.menuList) ...[
            MenuItems(
              text: item.nomPry,
              icon: Icons.compass_calibration_outlined,
              onPressed: () => navigateTo(item.rtxPry, module: item.codPry),
              isActive: SideMenuProvider.enableItems
                  ? sideMenuProvider.currentPage == item.rtxPry
                  : false,
            ),
          ],
          const SizedBox(height: 40),
          const TextSeparator(text: 'Salir'),
          MenuItems(
              text: 'Cerrar Sesion',
              icon: Icons.exit_to_app_outlined,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      gradient: LinearGradient(colors: [
        Color(0xff092044),
        Color(0xff092048),
      ]),
      boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)]);
}
