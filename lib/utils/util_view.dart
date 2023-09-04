// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:project_ebs_wms/colors/custom_colors.dart'; // <- required or firstWhereOrNull is not defined

class UtilView {
  static String cadenaMenu(String cadena) {
    cadena.lastIndexOf(' ');
    int count = 0;
    for (var i = 0; i < cadena.length; i++) {
      count = count + (cadena[i] == ' ' ? 1 : 0);
    }
    return '';
  }

  static String verifyDate(String? cadena) {
    try {
      DateTime date = DateTime.parse(cadena!);
    } catch (e) {
      var split1 = cadena!.split(' ');

      cadena = split1[0]
              .split('/')
              .reversed
              .toString()
              .replaceAll(RegExp(r'[(-)]'), '')
              .replaceAll(', ', '-') +
          ' ' +
          split1[1];
    }
    return cadena.replaceAll('T', ' ');
  }

  static String splitCharacter(String cadena, int index) {
    return cadena.split(' -')[index];
  }

  static String convertDateToString(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  static String convertDateToStringDMYHM(DateTime date) {
    DateFormat dateFormat = DateFormat("dd-MM-yyyy HH:mm:ss");
    return dateFormat.format(date);
  }

  static String convertDateToStringDMYHM2(DateTime date) {
    DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
    return dateFormat.format(date);
  }

  static DateTime convertStringToDate(String cadena) {
    return DateFormat("dd/MM/yyyy").parse(cadena).add(const Duration(hours: 5));
  }

  static String dateFormatDMY(String cadena) {
    DateTime date = DateTime.parse(cadena);
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  static String dateSumDay(int day) {
    DateTime date = DateTime.now().add(Duration(days: day));
    return '${date.day.toString().padLeft(2, '0')}/${date.month.toString().padLeft(2, '0')}/${date.year}';
  }

  static bool dateRange(String inicio, String fin, int value) {
    DateTime dateInicio = DateFormat("dd/MM/yyyy").parse(inicio);
    DateTime dateFin = DateFormat("dd/MM/yyyy").parse(fin);
    return (dateFin.year >= dateInicio.year) &&
        (dateFin.month - dateInicio.month == value);
  }

  static messageDanger(String _message) {
    Fluttertoast.showToast(
      msg: _message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 4,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 17.0,
      webPosition: "center",
      webBgColor: "red",
    );
  }

  static messageAccess(String _message) {
    Fluttertoast.showToast(
      msg: _message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 2,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 17.0,
      webPosition: "center",
      webBgColor: 'rgb(46,64,83)',
    );
  }

  static messageWarning(String _message) {
    Fluttertoast.showToast(
      msg: _message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 17.0,
      webPosition: "center",
      webBgColor: "orange",
    );
  }

  static buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  static Map<int, String> meses = {
    1: "ENERO",
    2: "FEBRERO",
    3: "MARZO",
    4: "ABRIL",
    5: "MAYO",
    6: "JUNIO",
    7: "JULIO",
    8: "AGOSTO",
    9: "SEPTIEMBRE",
    10: "OCTUBRE",
    11: "NOVIEMBRE",
    12: "DICIEMBRE"
  };

  static List<int> anios(int anio) {
    List<int> list = [];
    for (var i = 2000; i <= anio; i++) {
      list.add(i);
    }
    return list;
  }

  static String getSecuenceString(String numero, int log) {
    int fix = numero.length; //tamaño del numero
    String resp = ""; // nuevo String a devolver
    String nuevo = "${int.parse(numero) + 1}";
    if (fix <= log) {
      resp = nuevo.padLeft(log, '0');
    }
    return resp;
  }

  static Color convertColor(String color) {
    Color colorPrimario = CustomColors.azulCielo;
    if (color != "") {
      final colorF = color.replaceAll("#", "0xFF");
      return colorPrimario = Color(int.parse(colorF.toUpperCase()));
    }
    return colorPrimario;
  }

  static int convertInteger(String color) {
    int colorPrimario = int.parse(color != "" ? color : "0xee29");
    return colorPrimario;
  }

  static bool isNumeric(String cadena) {
    bool resultado;
    try {
      int.parse(cadena);
      resultado = true;
    } catch (e) {
      resultado = false;
    }
    return resultado;
  }

  static String formattDate(String cadena) {
    ///12122021
    ///20211212
    ///20212121
    DateTime dateActual = DateTime.now();
    String dia = cadena.substring(0, 2);
    String mes = cadena.substring(2, 4);
    String anio = cadena.substring(4, 8);

    if (int.parse(anio) < 1950 || int.parse(anio) > dateActual.year) {
      return "";
    } else if (int.parse(mes) < 1 || int.parse(mes) > 12) {
      return "";
    } else if (int.parse(dia) < 1 || int.parse(dia) > 30) {
      return "";
    }

    return "$dia-$mes-$anio";
  }
}
