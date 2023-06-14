import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../pages/details_page.dart';

class AssociatedsContainer extends StatelessWidget {
  const AssociatedsContainer({
    super.key,
    required this.context,
    required this.image,
    required this.name,
    required this.desc,
    required this.email,
    required this.number,
    required this.street,
    required this.descAdr,
    required this.pix,
  });

  final BuildContext context;
  final name;
  final desc;
  final email;
  final number;
  final image;
  final street;
  final descAdr;
  final pix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage('$image'),
                  radius: 75,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Center(
                        child: AutoSizeText(
                          "$name",
                          minFontSize: 20,
                          maxFontSize: 25,
                          style: TextStyle(
                            color: Color.fromRGBO(19, 42, 68, 1),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      AutoSizeText(
                        "$desc",
                        minFontSize: 16,
                        maxFontSize: 20,
                        style: TextStyle(
                          color: Color.fromRGBO(19, 42, 68, 1),
                          overflow: TextOverflow.clip,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AutoSizeText(
                  "Contato: \n$email \n$number",
                  minFontSize: 16,
                  maxFontSize: 20,
                  style: TextStyle(
                    color: Color.fromRGBO(156, 24, 24, 1),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: AutoSizeText(
                  "Endereço: \n$street \n$descAdr",
                  minFontSize: 16,
                  maxFontSize: 20,
                  style: TextStyle(
                    color: Color.fromRGBO(156, 24, 24, 1),
                  ),
                ),
              ),
            ],
          ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(
                  image: image,
                  name: name,
                  desc: desc,
                  email: email,
                  number: number,
                  street: street,
                  descAdr: descAdr,
                  pix: pix,
                )));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                child: Text(
                  "Saiba Mais",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(19, 42, 68, 1),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}