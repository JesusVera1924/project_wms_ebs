import 'package:flutter/material.dart';
import 'package:project_ebs_wms/colors/custom_colors.dart';
import 'package:project_ebs_wms/datatable/ig0201_datasource.dart';
import 'package:project_ebs_wms/provider/embarque_provider.dart';
import 'package:project_ebs_wms/utils/response.dart';
import 'package:project_ebs_wms/utils/util_view.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:project_ebs_wms/ui/cards/black_card.dart';
import 'package:project_ebs_wms/ui/shared/navbar.dart';

class EmbarqueView extends StatefulWidget {
  const EmbarqueView({Key? key}) : super(key: key);

  @override
  State<EmbarqueView> createState() => _EmbarqueViewState();
}

class _EmbarqueViewState extends State<EmbarqueView> {
  String mensaje = "";

  @override
  void initState() {
    Provider.of<EmbarqueProvider>(context, listen: false).initzializar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EmbarqueProvider>(context);
    final keyTable = GlobalKey<SfDataGridState>();
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
                    onTap: () async {
                      UtilView.buildShowDialog(context);
                      mensaje = await provider.saveInitEmbarque();
                      // ignore: use_build_context_synchronously
                      Navigator.of(context).pop();
                      UtilView.messageAccess(mensaje);
                      dataGridController.selectedRow = null;
                    },
                    child: const Tooltip(
                      message: "Generar RecepciÓn",
                      child:
                          Icon(Icons.upload, size: 22, color: Colors.blueGrey),
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
                  data:
                      SfDataGridThemeData(headerColor: CustomColors.azulCielo),
                  child: SfDataGrid(
                      key: keyTable,
                      rowHeight: 40,
                      //columnWidthMode: ColumnWidthMode.none,
                      headerRowHeight: 40,
                      showCheckboxColumn: true,
                      selectionMode: SelectionMode.multiple,
                      controller: dataGridController,
                      onSelectionChanged: (addedRows, removedRows) {
                        provider.selectItem(addedRows, removedRows);
                      },
                      source: Ig0201DTS(context, provider),
                      columns: [
                        GridColumn(
                          columnName: '1-numero',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.centerLeft,
                            child: const Text('NUMERO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '2-fecha',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 150 : 90,
                            alignment: Alignment.centerLeft,
                            child: const Text('FECHA.I',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '3-proveedor',
                          columnWidthMode: ColumnWidthMode.fill,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 150 : 90,
                            alignment: Alignment.center,
                            child: const Text('PROVEEDOR',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '4-tipo',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          //width: Responsive.isDesktop(context) ? 320 : 90,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.centerLeft,
                            child: const Text('TIPO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '5-cub',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          //width: Responsive.isDesktop(context) ? 320 : 90,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.centerLeft,
                            child: const Text('CUB',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '6-pso',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          //width: Responsive.isDesktop(context) ? 320 : 90,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.centerLeft,
                            child: const Text('PESO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '7-marca',
                          columnWidthMode: ColumnWidthMode.fill,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.centerLeft,
                            child: const Text('MARCA',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '8-info',
                          columnWidthMode: ColumnWidthMode.fill,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.centerLeft,
                            child: const Text('INFO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '9-zarpar',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 150 : 90,
                            alignment: Alignment.center,
                            child: const Text('F.ZARPE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '10-arribo',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 150 : 90,
                            alignment: Alignment.center,
                            child: const Text('F.ARRIBO',
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
