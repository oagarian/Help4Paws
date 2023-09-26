import 'package:flutter/material.dart';

import '../domain/notices.dart';

class NoticesContainer extends StatefulWidget {
  final Notices notices;

  const NoticesContainer({Key? key, required this.notices}) : super(key: key);

  State<NoticesContainer> createState() => _NoticesContainerState();
}

class _NoticesContainerState extends State<NoticesContainer> {
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
                    widget.notices.titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(19, 42, 68, 1),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.notices.descricao,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: 'Quicksand',
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(19, 42, 68, 1)),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        widget.notices.data,
                        style: const TextStyle(
                            fontSize: 11,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                            color: Color.fromRGBO(38, 75, 117, 1)),
                      ),
                      const SizedBox(width: 10),
                      const Text(" - "),
                      const SizedBox(width: 10),
                      Text(
                        widget.notices.fonte,
                        style: const TextStyle(
                            fontSize: 12,
                            fontFamily: 'Quicksand',
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