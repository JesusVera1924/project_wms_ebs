import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project_ebs_wms/model/http/karmov_response.dart';
import 'package:project_ebs_wms/router/router.dart';
import 'package:project_ebs_wms/services/navigation_service.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class RecepcionDataSource extends DataGridSource {
  final List<KarmovResponse> listRecepciones;
  final BuildContext context;
  List<DataGridRow> _dataGridRows = [];

  RecepcionDataSource(this.listRecepciones, this.context) {
    buildDataGridRows();
  }

  void buildDataGridRows() {
    _dataGridRows = listRecepciones.map<DataGridRow>((KarmovResponse team) {
      return DataGridRow(cells: <DataGridCell>[
        DataGridCell<String>(columnName: 'punto', value: team.codPto),
        DataGridCell<String>(columnName: 'numero', value: team.numMov),
        DataGridCell<String>(columnName: 'movimiento', value: team.codMov),
        DataGridCell<String>(
            columnName: 'proveedor', value: "${team.codRef} - ${team.nomRef}"),
        DataGridCell<String>(
            columnName: 'fechaIngreso',
            value: DateFormat('dd-MM-yyyy').format(team.fecMov)),
        DataGridCell<String>(columnName: 'lin', value: "${team.lin}"),
        DataGridCell<String>(columnName: 'rev', value: "${team.rev}"),
        DataGridCell<double>(columnName: 'pro', value: team.pro),
        DataGridCell<KarmovResponse>(columnName: 'acciones', value: team),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: <Widget>[
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[0].value.toString())),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[1].value.toString())),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[2].value.toString())),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[3].value.toString().toUpperCase())),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[4].value.toString())),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[5].value.toString())),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[6].value.toString())),
      Container(
        height: 15,
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: FAProgressBar(
            currentValue: double.parse(row.getCells()[7].value.toString()),
            size: 25,
            maxValue: 100,
            changeColorValue: 100,
            changeProgressColor: Colors.pink,
            backgroundColor: Colors.grey,
            progressColor: Colors.lightBlue,
            animatedDuration: const Duration(milliseconds: 1000),
            direction: Axis.horizontal,
            verticalDirection: VerticalDirection.up,
            displayText: '%',
            formatValueFixed: 2),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => NavigationService.replaceTo(
                Flurorouter.wmsRecepcionChequearRouter),
            child: const Tooltip(
                message: "Revisión",
                child: Icon(Icons.playlist_add_check, color: Colors.blueGrey)),
          ),
          const SizedBox(width: 5),
          Tooltip(
              message: "Generar Tareas",
              child: Icon(Icons.task, color: Colors.blueGrey)),
          const SizedBox(width: 5),
          Tooltip(
              message: "Detalle",
              child: Icon(Icons.remove_red_eye, color: Colors.blueGrey)),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {},
            child: const Tooltip(
                message: "Autorización",
                child: Icon(Icons.brightness_auto_rounded,
                    color: Colors.blueGrey)),
          ),
          const SizedBox(width: 5),
          InkWell(
            onTap: () {},
            child: const Tooltip(
                message: "Cerrar",
                child: Icon(Icons.close_rounded, color: Colors.red)),
          ),
        ],
      )
    ]);
  }
}
