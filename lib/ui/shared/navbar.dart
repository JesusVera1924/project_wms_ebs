import 'package:flutter/material.dart';
import 'package:project_ebs_wms/provider/sidemenu_provider.dart';

import 'package:provider/provider.dart';

class Navbar extends StatelessWidget {
  final List<Widget> listW;

  const Navbar({Key? key, required this.listW}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sideMenu = Provider.of<SideMenuProvider>(context);
    return Container(
      width: double.infinity,
      height: 50,
      decoration: buildBoxDecoration(),
      child: Row(
        children: [
          if (size.width <= 700)
            IconButton(
                icon: const Icon(Icons.menu_outlined),
                onPressed: () => SideMenuProvider.openMenu()),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),
            child: Text(sideMenu.textMenu,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          const Spacer(),
          /*    const SizedBox(width: 15), */
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 250),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (var item in listW) ...[item]
              ],
            ),
          ),
          const SizedBox(width: 5),
          // Search input
/*           if (size.width > 390)
           

          const Spacer(), */
/* 
          const NotificationsIndicator(), */
          /*   GestureDetector(
            onTap: () {
              print('object');
            },
            child: const Text(
              'Usuario: Jesusvera1924',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 10),
          NavbarAvatar(),
          const SizedBox(width: 10) */
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      color: Colors.white,
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]);
}
