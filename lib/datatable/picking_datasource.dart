// ignore_for_file: use_build_context_synchronously, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:project_ebs_wms/model/ig0040.dart';
import 'package:project_ebs_wms/provider/picking_provider.dart';
import 'package:project_ebs_wms/ui/dialog/dialog_acep_canc.dart';
import 'package:project_ebs_wms/ui/dialog/dialog_picking_karmov.dart';
import 'package:project_ebs_wms/ui/dialog/dialog_simple.dart';
import 'package:project_ebs_wms/utils/util_view.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PickingDTS extends DataGridSource {
  final BuildContext context;
  final PickingProvider provider;
  List<DataGridRow> _dataGridRows = [];

  PickingDTS(this.context, this.provider) {
    buildDataGridRows();
  }

  void buildDataGridRows() {
    _dataGridRows = provider.listPendient.map<DataGridRow>((Ig0040Y team) {
      return DataGridRow(cells: <DataGridCell>[
        DataGridCell<String>(columnName: '1-tp', value: team.codMov),
        DataGridCell<String>(columnName: '2-numero', value: team.numMov),
        DataGridCell<String>(
            columnName: '3-fecha',
            value: UtilView.convertDateToString(team.fecMov)),
        DataGridCell<String>(
            columnName: '4-cliente', value: "${team.codRef} - ${team.nomRef}"),
        DataGridCell<String>(
            columnName: '5-transporte',
            value: "${team.codCop} - ${team.nomCop}"),
        DataGridCell<String>(columnName: '6-destino', value: team.dstCop),
        DataGridCell<String>(columnName: '7-items', value: "${team.cn1Mov}"),
        DataGridCell<Ig0040Y>(columnName: '8-objeto', value: team),
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
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[0].value,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[1].value,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[2].value,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[3].value,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[4].value,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[5].value,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerRight,
          child: Text(row.getCells()[6].value,
              style:
                  const TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(row.getCells()[7].value.uduMov.trim(),
                    style: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
              ),
              Text(
                  "${" " + row.getCells()[7].value.stsIbs.trim() + " " + row.getCells()[7].value.stsFbs.trim()} " +
                      row.getCells()[7].value.stsLbs.trim(),
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          )),
      Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.centerLeft,
          child: Row(
            children: [
              InkWell(
                onTap: () async {
                  bool resp = await dialogAcepCanc(
                      context,
                      "Estas seguro de anular ¿?",
                      Text(
                          'PF: [${row.getCells()[1].value}]\nCliente: ${row.getCells()[3].value}\nTransporte: ${row.getCells()[4].value}'),
                      Icons.warning_amber_rounded,
                      Colors.amber[800]!);
                  if (resp) {
                    String respuesta = await provider.voidDocument(
                        row.getCells()[7].value, "");
                    if (respuesta != "") {
                      dialogSimple(context, "Información", Text(respuesta),
                          Icons.info_outline, Colors.blueGrey);
                    }
                    /*      if (obj.uduMov.substring(0, 1) == "*" &&
                        obj.stsIbs.trim() == "*") {
                      print("ok"); // IG0040Y EM UDU_MOV [1] = 'A'
                    } else {
                      //NO SE PUEDE ANULAR PORQUE EL DOCUMENTO SE ENCUENTRA EN PROCESO
                      // UDU_MOV -> *  IBS -> C
                      // BUSCAR EN KARMOW Y KARMOV
                      /**
                       * tipo ""
                       * for karmov dond udu C
                       * for karmow
                       * percha1 codpro
                       * tiene actualizar wms022- enviar exa
                       */

                      print("fail");
                    } */
                  }
                },
                child: Tooltip(
                    message: "Anular\nDocumento",
                    textAlign: TextAlign.center,
                    child:
                        Icon(Icons.hdr_auto_sharp, color: Colors.amber[800])),
              ),
              InkWell(
                onTap: () {},
                child: Tooltip(
                  message: "Anulación\nParcial",
                  textAlign: TextAlign.center,
                  child: Icon(Icons.edit_document, color: Colors.blueGrey[700]),
                ),
              ),
              InkWell(
                onTap: () async {
                  await provider.searchDetail(row.getCells()[7].value);
                  dialogPickingKarmov(
                      context,
                      provider,
                      // ignore: prefer_interpolation_to_compose_strings
                      "${"Detalle del registro [ " + row.getCells()[1].value} ]",
                      "Cliente: ${row.getCells()[3].value}\nTransporte: ${row.getCells()[4].value}");
                },
                child: Tooltip(
                  message: "Ver\nDetalle",
                  textAlign: TextAlign.center,
                  child: Icon(Icons.remove_red_eye_sharp,
                      color: Colors.green[800]),
                ),
              )
            ],
          )),
    ];

    return list;
  }
}
