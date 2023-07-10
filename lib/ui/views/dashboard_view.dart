import 'package:flutter/material.dart';
import 'package:project_ebs_wms/ui/buttons/custom_icon_button.dart';
import 'package:project_ebs_wms/ui/cards/white_card.dart';
import 'package:project_ebs_wms/ui/shared/navbar.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Navbar(listW: []),
          WhiteCard(
              title: 'Bienvenidos al sistema',
              child: CustomIconButton(
                  onPressed: () {},
                  text: 'Get Start',
                  icon: Icons.live_help_sharp))
        ],
      ),
    );
  }
}
