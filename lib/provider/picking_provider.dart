import 'package:flutter/material.dart';
import 'package:project_ebs_wms/api/solicitud_api.dart';
import 'package:project_ebs_wms/model/http/menu_response.dart';
import 'package:project_ebs_wms/model/ig0040.dart';
import 'package:project_ebs_wms/model/karmov.dart';
import 'package:project_ebs_wms/utils/util_view.dart';

class PickingProvider extends ChangeNotifier {
  final api = SolicitudApi();
  List<Ig0040Y> listPendient = [];
  List<Karmov> listDetailPend = [];

  List<MenuResponse> item = [
    MenuResponse(
        codPry: "0",
        nomPry: "SURTIDO",
        clsPry: "I",
        clxPry: "0xD9b22222",
        urlPry: "/inventario/bodega/picking/transferencia",
        desPry: "ITEM INV-BOD-PIC-SUR",
        stsPry: "A",
        iconPry: "list.png",
        perAcc: "AIPBCMEX"),
    MenuResponse(
        codPry: "1",
        nomPry: "VENTA",
        clsPry: "I",
        clxPry: "0xD9b22222",
        urlPry: "/inventario/bodega/picking/venta",
        desPry: "ITEM INV-BOD-PIC-VEN",
        stsPry: "A",
        iconPry: "list.png",
        perAcc: "AIPBCMEX")
  ];

  Future initzializar() async {
    var respuesta = await api.getIg0040yPend("01", "01", "SYS1", "P", "02");
    if (respuesta != null) {
      listPendient = respuesta;
      notifyListeners();
    }
  }

  Future<String> voidDocument(Ig0040Y dato, String tipo) async {
    return await api.anularIg0040y(dato, tipo);
  }

  Future searchDetail(Ig0040Y objeto) async {
    var respuesta = await api.getKarmovDetailPend(
        objeto.codEmp,
        objeto.codPto,
        objeto.codMov,
        objeto.numMov,
        UtilView.convertDateToStringDMYHM2(objeto.fecMov));
    if (respuesta != null) {
      listDetailPend = respuesta;
      notifyListeners();
    }
  }

  selectStateKarmov(String uid, bool estado, int cantidad) {
    for (var element in listDetailPend) {
      if (element.codPro.trim() == uid) {
        element.isSelect = estado;
        element.canMov = cantidad;
      }
    }
  }
}
