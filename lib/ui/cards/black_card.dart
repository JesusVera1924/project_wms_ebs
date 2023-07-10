import 'package:flutter/material.dart';

class BlackCard extends StatelessWidget {
  final String? title;
  final Widget child;
  final double? width;

  const BlackCard({
    Key? key,
    required this.child,
    this.title,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(10),
      decoration: buildBoxDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* if (title != null) ...[
            Row(
              children: [
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text(
                    title!,
                    style: GoogleFonts.roboto(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () => funcion(),
                    child: const Tooltip(
                      message: "Nuevo",
                      child: Icon(
                        Icons.assignment_outlined,
                        size: 22,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () => funcion2(),
                    child: const Tooltip(
                      message: "Buscar",
                      child: Icon(
                        Icons.search,
                        size: 22,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                  ),
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  child: InkWell(
                    onTap: () => funcion3(),
                    child: const Tooltip(
                      message: "Salir formularuio",
                      child: Icon(
                        Icons.exit_to_app,
                        size: 22,
                        color: Color(0xD9b22222),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Divider()
          ], */
          child
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)
          ]);
}
