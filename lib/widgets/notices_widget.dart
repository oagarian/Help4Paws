import 'package:flutter/material.dart';

class NoticesContainer extends StatelessWidget {
  const NoticesContainer({
    Key? key,
    required this.titulo,
    required this.data,
    required this.descricaoNoticia,
    required this.fonte,
  }) : super(key: key);

  final String titulo;
  final String data;
  final String descricaoNoticia;
  final String fonte;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 201, 203, 1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(19, 42, 68, 1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    descricaoNoticia,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(19, 42, 68, 1)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        data,
                        style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(38, 75, 117, 1)),
                      ),
                      const SizedBox(width: 10),
                      const Text(" - "),
                      const SizedBox(width: 10),
                      Text(
                        fonte,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(38, 75, 117, 1)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
