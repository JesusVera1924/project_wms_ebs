import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:project_ebs_wms/colors/custom_colors.dart';
import 'package:project_ebs_wms/model/http/menu_response.dart';
import 'package:project_ebs_wms/provider/sidemenu_provider.dart';
import 'package:project_ebs_wms/services/local_storage.dart';
import 'package:project_ebs_wms/services/navigation_service.dart';
import 'package:project_ebs_wms/ui/cards/white_card.dart';
import 'package:project_ebs_wms/utils/response.dart';
import 'package:project_ebs_wms/utils/util_view.dart';

import 'package:provider/provider.dart';

class DefaultView extends StatefulWidget {
  const DefaultView({Key? key}) : super(key: key);

  @override
  State<DefaultView> createState() => _DefaultViewState();
}

class _DefaultViewState extends State<DefaultView> {
  @override
  void initState() {
    Provider.of<SideMenuProvider>(context, listen: false).updateModel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sideMenuProvider = Provider.of<SideMenuProvider>(context);
    final idModulo = LocalStorage.prefs.getString('idModule');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          WhiteCard(
            title: 'MENÚ',
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    for (var item in sideMenuProvider.menusubList.where(
                        (element) =>
                            element.codPry.substring(0, 2) == idModulo)) ...[
                      sideMenuProvider.item
                                  .where((element) =>
                                      element.codPry.startsWith(item.codPry))
                                  .length <=
                              1
                          ? Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: InkWell(
                                onTap: () =>
                                    NavigationService.replaceTo(item.rtxPry),
                                child: Column(
                                  children: [
                                    Container(
                                      height: !Responsive.isMobile(context)
                                          ? 200
                                          : 150,
                                      width: !Responsive.isMobile(context)
                                          ? 200
                                          : 150,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: UtilView.convertColor(
                                              item.clxPry)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Icon(
                                          IconData(
                                              UtilView.convertInteger(
                                                  item.l02Pry),
                                              fontFamily: 'MaterialIcons'),
                                          size: !Responsive.isMobile(context)
                                              ? 120
                                              : 80,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Container(
                                        padding: const EdgeInsets.all(8.0),
                                        constraints:
                                            const BoxConstraints(maxWidth: 200),
                                        child: Text(
                                          item.nomPry,
                                          textAlign: TextAlign.center,
                                          maxLines: 3,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  !Responsive.isMobile(context)
                                                      ? 16
                                                      : 12),
                                        ))
                                  ],
                                ),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 50),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton2<MenuItem>(
                                  isExpanded: true,
                                  customButton: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: !Responsive.isMobile(context)
                                            ? 200
                                            : 150,
                                        width: !Responsive.isMobile(context)
                                            ? 200
                                            : 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: UtilView.convertColor(
                                                item.clxPry)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Icon(
                                            IconData(
                                                UtilView.convertInteger(
                                                    item.l02Pry),
                                                fontFamily: 'MaterialIcons'),
                                            size: 120,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8.0),
                                          constraints: const BoxConstraints(
                                              maxWidth: 200),
                                          child: Text(
                                            item.nomPry,
                                            textAlign: TextAlign.center,
                                            maxLines: 3,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: !Responsive.isMobile(
                                                        context)
                                                    ? 16
                                                    : 12),
                                          ))
                                    ],
                                  ),
                                  items: [
                                    ...MenuItems(
                                            item.codPry, sideMenuProvider.item)
                                        .firstTesteo
                                        .map(
                                          (item) => DropdownMenuItem<MenuItem>(
                                            value: item,
                                            child: MenuItems.buildItem(item),
                                          ),
                                        ),
                                  ],
                                  onChanged: (value) {
                                    MenuItem obj = value as MenuItem;
                                    NavigationService.replaceTo(obj.url);
                                  },
                                  buttonStyleData: ButtonStyleData(
                                    height: 50,
                                    width: 160,
                                    padding: const EdgeInsets.only(
                                        left: 14, right: 14),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      border: Border.all(
                                        color: Colors.black26,
                                      ),
                                      color: Colors.redAccent,
                                    ),
                                    elevation: 2,
                                  ),
                                  dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      width: 200,
                                      padding: null,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.redAccent,
                                      ),
                                      elevation: 8,
                                      offset: const Offset(-20, 0),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(40),
                                        thickness: MaterialStateProperty.all(6),
                                        thumbVisibility:
                                            MaterialStateProperty.all(true),
                                      )),
                                  iconStyleData: const IconStyleData(
                                      icon: Icon(
                                          Icons.arrow_forward_ios_outlined),
                                      iconSize: 8,
                                      iconEnabledColor: Colors.yellow,
                                      iconDisabledColor: Colors.grey,
                                      openMenuIcon: Icon(Icons.delete)),
                                  menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14)),
                                  /* icon: const Icon(
                                      Icons.arrow_forward_ios_outlined),
                                  iconSize: 8,
                                  itemHeight: 40,
                                  itemPadding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  dropdownMaxHeight: 200,
                                  dropdownWidth: 200,
                                  dropdownPadding: null,
                                  dropdownDecoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: CustomColors.azulCielo,
                                  ),
                                  dropdownElevation: 8,
                                  scrollbarRadius: const Radius.circular(40),
                                  scrollbarThickness: 6,
                                  scrollbarAlwaysShow: true,
                                  offset: const Offset(-20, 0), */
                                ),
                              ),
                            )
                    ],
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
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
          text: e.nomPry, icon: Icons.assistant_direction, url: e.rtxPry);
    }).toList();
  }

  List<MenuResponse> menuResponse = [];
  List<MenuItem> firstTesteo = [];
  String opcion;

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(
          item.icon,
          color: Colors.white,
          size: 18,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

/*   static onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.like:
        // logica de onPressed de cada opciones del modulo
        break;
      case MenuItems.share:
        // logica de onPressed de cada opciones del modulo
        break;
      case MenuItems.download:
        // logica de onPressed de cada opciones del modulo
        break;
      case MenuItems.cancel:
        // logica de onPressed de cada opciones del modulo
        break;
    }
  } */
}
