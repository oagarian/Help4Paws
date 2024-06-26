import 'package:flutter/material.dart';
import 'package:help4paws/pages/details_page.dart';

class AssociatedsContainer extends StatelessWidget {
  const AssociatedsContainer({
    Key? key,
    required this.image,
    required this.name,
    required this.desc,
    required this.email,
    required this.number,
    required this.street,
    required this.descAdr,
    required this.pix,
  }) : super(key: key);

  final String name;
  final String desc;
  final String email;
  final String number;
  final String image;
  final String street;
  final String descAdr;
  final String pix;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: 75,
              ),
              Expanded(
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(19, 42, 68, 1),
                        ),
                      ),
                    ),
                    Text(
                      desc,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(19, 42, 68, 1),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Contato: \n$email \n$number",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(156, 24, 24, 1),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Flexible(
                child: Text(
                  "Endereço: \n$street \n$descAdr",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromRGBO(156, 24, 24, 1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    image: image,
                    name: name,
                    desc: desc,
                    email: email,
                    number: number,
                    street: street,
                    descAdr: descAdr,
                    pix: pix,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
              child: Text(
                "Saiba Mais",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(19, 42, 68, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
