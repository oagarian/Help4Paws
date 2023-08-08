import 'package:flutter/material.dart';
import 'package:help4paws/pages/details_page.dart';

class PrincipalContainer extends StatelessWidget {
  const PrincipalContainer({
    Key? key,
    required this.context,
    required this.titulo,
    required this.data,
    required this.tituloNoticia,
    required this.descricao,
  }) : super(key: key);

  final BuildContext context;
  final String titulo;
  final String data;
  final String tituloNoticia;
  final String descricao;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color.fromRGBO(255, 201, 203, 1),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              Icon(
                Icons.newspaper,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              Container(
                child: Text(
                  "$titulo",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(19, 42, 68, 1),
                  ),
                ),
              ),
            ]),
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [                  
                  SizedBox(height: 20),
                  Text(
                    "$data",
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(7, 63, 128, 1)),
                        
                  ),
                  Text(
                    "$tituloNoticia",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(19, 42, 68, 1)),
                  ),
                  Text("$descricao",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                          color: Color.fromRGBO(123, 124, 123, 1)))
                ],
              ),
            )
          ],
        ));
  }
}
