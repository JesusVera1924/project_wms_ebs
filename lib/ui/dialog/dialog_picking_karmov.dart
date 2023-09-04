import 'package:flutter/material.dart';
import 'package:project_ebs_wms/colors/custom_colors.dart';
import 'package:project_ebs_wms/datatable/karmov_datasource.dart';
import 'package:project_ebs_wms/provider/picking_provider.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

Future<bool> dialogPickingKarmov(BuildContext context, PickingProvider provider,
    String titulo, String subTitulo) async {
  bool op = false;

  await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.assignment,
                        color: CustomColors.customPrimaryColors, size: 30),
                    Text(
                      titulo,
                      style: TextStyle(
                          color: CustomColors.customPrimaryColors,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Text(
                  subTitulo.toUpperCase(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SfDataGridTheme(
                  data: SfDataGridThemeData(
                      filterIconColor: Colors.white,
                      filterIconHoverColor: Colors.red,
                      headerColor: CustomColors.azulCielo),
                  child: SfDataGrid(
                      //key: keyTable,
                      rowHeight: 40,
                      headerRowHeight: 40,
                      //controller: dataGridController,
                      allowFiltering: true,
                      selectionMode: SelectionMode.single,
                      source: KarmovDTS(context, provider),
                      columns: [
                        GridColumn(
                          columnName: '1-codigo',
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                          allowFiltering: false,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.center,
                            child: const Text('CODIGO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '2-nombre',
                          columnWidthMode: ColumnWidthMode.fill,
                          filterPopupMenuOptions: const FilterPopupMenuOptions(
                              canShowSortingOptions: false,
                              showColumnName: false,
                              canShowClearFilterOption: false),
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            alignment: Alignment.centerLeft,
                            child: const Text('PRODUCTO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '3-marca',
                          columnWidthMode: ColumnWidthMode.fill,
                          allowFiltering: false,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('MARCA',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '4-percha',
                          allowFiltering: false,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('PERCHA',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '5-cant',
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
                          columnName: '6-est',
                          columnWidthMode: ColumnWidthMode.fitByColumnName,
                          allowFiltering: false,
                          label: Container(
                            padding: const EdgeInsets.all(8.0),
                            //width: Responsive.isDesktop(context) ? 100 : 80,
                            alignment: Alignment.center,
                            child: const Text('EST',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        GridColumn(
                          columnName: '7-acciones',
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
              ],
            ),
          ),
          actions: [
            TextButton(
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.black12;
                  }
                  return Colors.transparent;
                })),
                onPressed: () {
                  op = true;
                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar', style: TextStyle(fontSize: 14))),
            TextButton(
                style: ButtonStyle(backgroundColor:
                    MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                  if (states.contains(MaterialState.hovered)) {
                    return Colors.black12;
                  }
                  return Colors.transparent;
                })),
                onPressed: () {
                  op = false;
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar', style: TextStyle(fontSize: 14))),
          ],
        );
      });
  return op;
}
