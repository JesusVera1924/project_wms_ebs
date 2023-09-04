import 'package:flutter/material.dart';
import 'package:project_ebs_wms/model/http/menu_response.dart';
import 'package:project_ebs_wms/provider/picking_provider.dart';
import 'package:project_ebs_wms/services/navigation_service.dart';
import 'package:project_ebs_wms/ui/shared/navbar.dart';
import 'package:project_ebs_wms/utils/response.dart';
import 'package:project_ebs_wms/utils/util_view.dart';
import 'package:provider/provider.dart';

class PickingView extends StatefulWidget {
  const PickingView({Key? key}) : super(key: key);

  @override
  State<PickingView> createState() => _PickingViewState();
}

class _PickingViewState extends State<PickingView> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PickingProvider>(context);
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Navbar(
                listW: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: InkWell(
                      onTap: () {},
                      child: const Tooltip(
                          message: "Salir",
                          child: Icon(Icons.exit_to_app,
                              size: 22, color: Color(0xD9b22222))),
                    ),
                  ),
                ],
              ),
            ),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 20,
              runSpacing: 20,
              children: [
                for (var item in provider.item) ...[
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: InkWell(
                      onTap: () {
                        NavigationService.replaceTo(item.urlPry);
                      },
                      child: Column(
                        children: [
                          Container(
                            height: !Responsive.isMobile(context) ? 200 : 150,
                            width: !Responsive.isMobile(context) ? 200 : 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: UtilView.convertColor(item.clxPry)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.block,
                                size: !Responsive.isMobile(context) ? 120 : 80,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Container(
                              padding: const EdgeInsets.all(8.0),
                              constraints: const BoxConstraints(maxWidth: 200),
                              child: Text(
                                item.nomPry,
                                textAlign: TextAlign.center,
                                maxLines: 3,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: !Responsive.isMobile(context)
                                        ? 16
                                        : 12),
                              ))
                        ],
                      ),
                    ),
                  )
                ],
              ],
            ),
          ],
        ));
  }
}

class MenuItem {
  final String text;
  final String url;
  final IconData icon;

  const MenuItem({required this.text, required this.icon, required this.url});
}

class MenuItems {
  MenuItems(this.opcion, this.menuResponse) {
    firstTesteo = menuResponse
        .where((element) => element.codPry.startsWith(opcion))
        .map((e) {
      return MenuItem(
          text: e.nomPry, icon: Icons.assistant_direction, url: e.urlPry);
    }).toList();
  }

  List<MenuResponse> menuResponse = [];
  List<MenuItem> firstTesteo = [];
  String opcion;

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 18),
        const SizedBox(width: 10),
        Text(
          item.text,
          maxLines: 2,
          style: const TextStyle(
              fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}
