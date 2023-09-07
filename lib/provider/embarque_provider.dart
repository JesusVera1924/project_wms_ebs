import 'package:flutter/material.dart';
import 'package:project_ebs_wms/api/solicitud_api.dart';
import 'package:project_ebs_wms/model/ig0201.dart';

import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class EmbarqueProvider extends ChangeNotifier {
  final api = SolicitudApi();
  List<Ig0201> listEmbarques = [];
  List<Ig0201> listSelect = [];

  Future initzializar() async {
    var respuesta = await api.getIg0201Pend("01", "01", "01");
    if (respuesta != null) {
      listEmbarques = respuesta;
      notifyListeners();
    }
  }

  void selectItem(List<DataGridRow> x, List<DataGridRow> y) {
    // x --> lista para agregar
    // y --> lista para remover
    if (x.isNotEmpty) {
      for (var element in x) {
        var objeto = element.getCells()[10].value;
        listSelect.add(objeto);
      }
    }

    if (y.isNotEmpty) {
      for (var element in y) {
        var objeto = element.getCells()[10].value;
        listSelect.remove(objeto);
      }
    }
  }

  Future<String> saveInitEmbarque() async {
    var respuesta = await api.generarEmbarque(listSelect);
    for (var element in listSelect) {
      listEmbarques.remove(element);
    }
    listSelect.clear();
    notifyListeners();
    return respuesta;
  }
}
