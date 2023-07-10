import 'package:flutter/material.dart';

Future<String> dialogReturnString(BuildContext context, String text,String cadena) async {

  await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        //final provider = Provider.of<ComprobanteProvider>(context);

        return AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          title: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                  color: Colors.grey, fontWeight: FontWeight.bold),
            ),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width / 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  initialValue: cadena,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.3)))),
                  onChanged: (value) => cadena = value,
                  maxLines: 4,
                  maxLength: 255,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        style: ButtonStyle(backgroundColor:
                            MaterialStateProperty.resolveWith<Color>(
                                (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.black12;
                          }
                          return Colors.transparent;
                        })),
                        onPressed: () {
                          
                          Navigator.of(context).pop();
                        },
                        child: const Text('Aceptar',
                            style: TextStyle(fontSize: 12))),
                  ],
                )
              ],
            ),
          ),
        );
      });
  return cadena;
}
