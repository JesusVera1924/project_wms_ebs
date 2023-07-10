class Validate {
  /* FUNCIONES ESTATICAS PARA EL USO DEL PROGRAMA EN GENERAL */

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
