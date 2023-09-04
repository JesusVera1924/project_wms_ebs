import 'package:flutter/material.dart';
import 'package:project_ebs_wms/colors/custom_colors.dart';
import 'package:project_ebs_wms/datatable/picking_datasource.dart';
import 'package:project_ebs_wms/provider/picking_provider.dart';
import 'package:project_ebs_wms/ui/cards/black_card.dart';
import 'package:project_ebs_wms/ui/shared/navbar.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PickingVentaView extends StatefulWidget {
  const PickingVentaView({Key? key}) : super(key: key);

  @override
  State<PickingVentaView> createState() => _PickingVentaViewState();
}

class _PickingVentaViewState extends State<PickingVentaView> {
  @override
  void initState() {
    Provider.of<PickingProvider>(context, listen: false).initzializar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final keyTable = GlobalKey<SfDataGridState>();
    final provider = Provider.of<PickingProvider>(context);
    final dataGridController = DataGridController();

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
                      message: "Nuevo",
                      child: Icon(Icons.assignment,
                          size: 22, color: Colors.blueGrey),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () async {},
                    child: const Tooltip(
                      message: "Buscar",
                      child:
                          Icon(Icons.search, size: 22, color: Colors.blueGrey),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () {},
                    child: const Tooltip(
                      message: "Salir",
                      child: Icon(Icons.exit_to_app,
                          size: 22, color: Color(0xD9b22222)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlackCard(
              child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                height: 700,
                child: SfDataGridTheme(
                  data: SfDataGridThemeData(
                      filterIconColor: Colors.white,
                      filterIconHoverColor: Colors.red,
                      headerColor: CustomColors.azulCielo),
                  child: SfDataGrid(
                      key: keyTable,
                      rowHeight: 40,
                      headerRowHeight: 40,
                      controller: dataGridController,
                      allowFiltering: true,
                      selectionMode: SelectionMode.single,
                      source: PickingDTS(context, provider),
                      columns: [
                        GridColumn(
                          columnName: '1-tp',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          allowFiltering: false,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('TP',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '2-numero',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          filterPopupMenuOptions: const FilterPopupMenuOptions(
                              canShowSortingOptions: false,
                              showColumnName: false,
                              canShowClearFilterOption: false),
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.centerLeft,
                            child: const Text('NUMERO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '3-fecha',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          filterPopupMenuOptions: const FilterPopupMenuOptions(
                              canShowSortingOptions: false,
                              showColumnName: false,
                              canShowClearFilterOption: false),
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('INGRESO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '4-cliente',
                          columnWidthMode: ColumnWidthMode.fill,
                          filterPopupMenuOptions: const FilterPopupMenuOptions(
                              canShowSortingOptions: false,
                              showColumnName: false,
                              canShowClearFilterOption: false),
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('CLIENTE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '5-transporte',
                          columnWidthMode: ColumnWidthMode.fill,
                          filterPopupMenuOptions: const FilterPopupMenuOptions(
                              canShowSortingOptions: false,
                              showColumnName: false,
                              canShowClearFilterOption: false),
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('TRANSPORTE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '6-destino',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          filterPopupMenuOptions: const FilterPopupMenuOptions(
                              canShowSortingOptions: false,
                              showColumnName: false,
                              canShowClearFilterOption: false),
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('DESTINO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '7-items',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          allowFiltering: false,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('CANT',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '8-est',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          allowFiltering: false,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('ESTADOS',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '9-acciones',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          allowFiltering: false,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('ACCIONES',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                      ]),
                ),
              )
            ],
          ))
        ],
      ),
    );
  }
}
