import 'package:flutter/material.dart';
import 'package:project_ebs_wms/colors/custom_colors.dart';
import 'package:project_ebs_wms/datatable/recepcion_datasouces.dart';
import 'package:project_ebs_wms/model/http/karmov_response.dart';
import 'package:project_ebs_wms/utils/response.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:project_ebs_wms/ui/cards/black_card.dart';
import 'package:project_ebs_wms/ui/shared/navbar.dart';

class RecepcionView extends StatelessWidget {
  const RecepcionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keyTable = GlobalKey<SfDataGridState>();

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
                  data:
                      SfDataGridThemeData(headerColor: CustomColors.azulCielo),
                  child: SfDataGrid(
                      key: keyTable,
                      rowHeight: 40,
                      //columnWidthMode: ColumnWidthMode.none,
                      headerRowHeight: 40,
                      source: RecepcionDataSource([
                        KarmovResponse(
                            codEmp: "01",
                            codPto: "01",
                            numMov: "000000001",
                            codMov: "CI",
                            codRef: "1763",
                            nomRef: "Jesus alberto vera",
                            fecMov: DateTime.now(),
                            lin: 20,
                            rev: 15,
                            pro: (15 * 100) / 20,
                            estado: 1)
                      ], context),
                      columns: [
                        GridColumn(
                          columnName: 'punto',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('PUNTO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: 'numero',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 150 : 90,
                            alignment: Alignment.center,
                            child: const Text('MOVIMIENTO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: 'movimiento',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 150 : 90,
                            alignment: Alignment.center,
                            child: const Text('TIPO.M',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: 'proveedor',
                          columnWidthMode: ColumnWidthMode.fill,
                          //width: Responsive.isDesktop(context) ? 320 : 90,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.centerLeft,
                            child: const Text('PROVEEDOR',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: 'fechaIngreso',
                          columnWidthMode: ColumnWidthMode.none,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('F.INGRESO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: 'lin',
                          columnWidthMode: ColumnWidthMode.none,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('LIN',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: 'rev',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('REV',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: 'proceso',
                          //columnWidthMode: ColumnWidthMode.fitByCellValue,
                          width: Responsive.isDesktop(context) ? 150 : 100,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('PROGRESO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: 'acciones',
                          //columnWidthMode: ColumnWidthMode.fitByCellValue,
                          width: Responsive.isDesktop(context) ? 180 : 100,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
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
