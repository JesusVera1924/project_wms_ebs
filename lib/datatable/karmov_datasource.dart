import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_ebs_wms/model/karmov.dart';
import 'package:project_ebs_wms/provider/picking_provider.dart';
import 'package:project_ebs_wms/ui/inputs/custom_inputs.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class KarmovDTS extends DataGridSource {
  final BuildContext context;
  final PickingProvider provider;
  List<DataGridRow> _dataGridRows = [];
  final txtCantidad = TextEditingController();

  KarmovDTS(this.context, this.provider) {
    buildDataGridRows();
  }

  void buildDataGridRows() {
    _dataGridRows = provider.listDetailPend.map<DataGridRow>((Karmov team) {
      return DataGridRow(cells: <DataGridCell>[
        DataGridCell<String>(columnName: '1-codigo', value: team.codPro.trim()),
        DataGridCell<String>(
            columnName: '2-producto', value: team.nomPro.trim()),
        DataGridCell<String>(columnName: '3-marca', value: team.nomDg2.trim()),
        DataGridCell<String>(
            columnName: '4-percha',
            value: team.percha1.trim() +
                team.percha2.trim() +
                team.percha3.trim()),
        DataGridCell<String>(columnName: '5-cant', value: "${team.canMov}"),
        DataGridCell<String>(columnName: '6-est', value: team.uduMov ?? 'S/E'),
        DataGridCell<Karmov>(columnName: '7-acciones', value: team),
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
          child: Tooltip(
            message: row.getCells()[1].value,
            child: Text(row.getCells()[1].value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 12)),
          )),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[2].value,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.centerLeft,
          child: Text(row.getCells()[3].value,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: const TextStyle(fontSize: 12))),
      row.getCells()[6].value.isSelect
          ? Container(
              padding: const EdgeInsets.all(4.0),
              alignment: Alignment.center,
              child: TextFormField(
                textAlign: TextAlign.right,
                onEditingComplete: () async {
                  provider.selectStateKarmov(row.getCells()[0].value, false,
                      int.parse(txtCantidad.text));
                  notifyDataSourceListeners();
                },
                controller: txtCantidad,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^(?:\+|-)?\d+$')),
                  LengthLimitingTextInputFormatter(4),
                ],
                style: const TextStyle(fontSize: 13),
                decoration: CustomInputs.dialogInputDecoration(),
              ),
            )
          : Container(
              padding: const EdgeInsets.all(4.0),
              alignment: Alignment.centerRight,
              child: Text("${row.getCells()[6].value.canMov}",
                  style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(4.0),
          alignment: Alignment.center,
          child: Text(row.getCells()[5].value,
              style: const TextStyle(fontSize: 12))),
      Container(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              row.getCells()[6].value.isSelect
                  ? InkWell(
                      onTap: () async {
                        //PROCESO DE CAMBIAR CANTIDAD
                        provider.selectStateKarmov(row.getCells()[0].value,
                            false, int.parse(txtCantidad.text));
                        notifyDataSourceListeners();
                      },
                      child: Tooltip(
                        message: "Confirmar cantidad",
                        textAlign: TextAlign.center,
                        child: Icon(Icons.save_as_rounded,
                            color: Colors.green[700]),
                      ),
                    )
                  : InkWell(
                      onTap: () async {
                        provider.selectStateKarmov(row.getCells()[0].value,
                            true, int.parse(row.getCells()[4].value));
                        txtCantidad.text = row.getCells()[4].value;
                        notifyDataSourceListeners();
                      },
                      child: Tooltip(
                        message: "Ajustar Cantidad",
                        textAlign: TextAlign.center,
                        child: Icon(Icons.edit_document,
                            color: Colors.blueGrey[700]),
                      ),
                    ),
              InkWell(
                onTap: () {},
                child: Tooltip(
                  message: "Anular linea",
                  textAlign: TextAlign.center,
                  child: Icon(Icons.remove_circle_outline_rounded,
                      color: Colors.red[800]),
                ),
              )
            ],
          )),
    ];

    return list;
  }
}
