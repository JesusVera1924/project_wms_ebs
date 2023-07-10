class UtilService {
  static String status(String cadena) {
    switch (cadena) {
      case 'Exception: 400':
        return 'Sintáxis inválida';
      case 'Exception: 404':
        return 'Valores no encontrados';
      case 'Exception: 500':
        return 'No hay conexión disponible a internet';
      default:
        return cadena;
    }
  }
}
