import 'package:flutter/material.dart';
import 'package:project_ebs_wms/model/ig0201.dart';
import 'package:project_ebs_wms/provider/embarque_provider.dart';
import 'package:project_ebs_wms/utils/util_view.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class Ig0201DTS extends DataGridSource {
  final BuildContext context;
  final EmbarqueProvider provider;
  List<DataGridRow> _dataGridRows = [];
  final txtCantidad = TextEditingController();

  Ig0201DTS(this.context, this.provider) {
    buildDataGridRows();
  }

  void buildDataGridRows() {
    _dataGridRows = provider.listEmbarques.map<DataGridRow>((Ig0201 team) {
      return DataGridRow(cells: <DataGridCell>[
        DataGridCell<String>(columnName: '1-numero', value: team.numPed.trim()),
        DataGridCell<String>(
            columnName: '2-fecha',
            value: UtilView.convertDateToString(team.fecPed)),
        DataGridCell<String>(
            columnName: '3-proveedor',
            value: "${team.codPrv} - ${team.obsPed}"),
        DataGridCell<String>(columnName: '4-tipo', value: team.tipEmb),
        DataGridCell<String>(columnName: '5-cub', value: "${team.cubEmb}"),
        DataGridCell<String>(columnName: '6-pso', value: "${team.psoEmb}"),
        DataGridCell<String>(columnName: '7-marca', value: team.ptoZar),
        DataGridCell<String>(columnName: '8-info', value: team.vapZar),
        DataGridCell<String>(
            columnName: '9-zarpar',
            value: UtilView.convertDateToString(team.fecZar)),
        DataGridCell<String>(
            columnName: '10-arribo',
            value: UtilView.convertDateToString(team.fecArr)),
        DataGridCell<Ig0201>(columnName: '11-acciones', value: team),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: _buildDataGridForDts(row));
  }

  List<Widget> _buildDataGridForDts(DataGridRow row) {
    List<Widget> list = [
      Container(
          padding: const EdgeInsets.all(4.0),
          constraints: const BoxConstraints(maxWidth: 100, minHeight: 50),
          alignment: Alignment.centerLeft,
          child: Tooltip(
            message: row.getCells()[0].value,
            child: Text(row.getCells()[0].value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12)),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[1].value,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.centerLeft,
          child: Tooltip(
            message: row.getCells()[2].value,
            child: Text(row.getCells()[2].value,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12)),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[3].value,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[4].value,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.centerRight,
          child: Text(row.getCells()[5].value,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[6].value,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[7].value,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[8].value,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[9].value,
              style: const TextStyle(fontSize: 12))),
    ];

    return list;
  }
}
