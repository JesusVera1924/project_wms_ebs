import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoPageFoundPView extends StatelessWidget {
  final String mensaje;

  const NoPageFoundPView({Key? key, this.mensaje = "404-NO ENCONTRADO"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Tooltip(
              showDuration: const Duration(seconds: 3),
              textStyle: GoogleFonts.montserratAlternates(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              height: 150,
              margin: const EdgeInsets.symmetric(horizontal: 200),
              message: mensaje,
              child: Image.asset('assets/error.gif')),
          SizedBox(
            width: double.infinity,
            child: Text(
              "Comunicarse con el Administrador..",
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.montserratAlternates(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
