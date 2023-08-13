import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:help4paws/pages/donations_page.dart';

class DetailsPage extends StatefulWidget {
  final String image;
  final String name;
  final String desc;
  final String email;
  final String number;
  final String street;
  final String descAdr;
  final String pix;
  const DetailsPage(
      {Key? key,
      required this.image,
      required this.name,
      required this.desc,
      required this.email,
      required this.number,
      required this.street,
      required this.descAdr,
      required this.pix})
      : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(226, 248, 243, 1),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            width: double.infinity,
            height: 70,
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Color.fromARGB(255, 204, 83, 131),
            ),
            child: Center(child: Icon(Icons.business_center, size: 50)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 252, 252, 252),
        body: Hero(
          tag: 'transitionToMainPage',
          child: buildDetailsContainer(
            image: widget.image,
            name: widget.name,
            desc: widget.desc,
            email: widget.email,
            number: widget.number,
            street: widget.street,
            descAdr: widget.descAdr,
          ),
        ),
      ),
    );
  }

  Container buildDetailsContainer({
    required image,
    required name,
    required desc,
    required email,
    required number,
    required street,
    required descAdr,
  }) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage('$image'),
            radius: 100,
          ),
          SizedBox(height: 15),
          Text(
            '$name\n',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cardo',
              color: Color.fromRGBO(19, 42, 68, 1),
            ),
          ),
          AutoSizeText(
            '$desc',
            minFontSize: 14,
            maxFontSize: 26,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Cardo',
              color: Color.fromRGBO(19, 42, 68, 1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: AutoSizeText(
                  "Contato: \n$email \n$number",
                  minFontSize: 12,
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
                  minFontSize: 12,
                  maxFontSize: 20,
                  style: TextStyle(
                    color: Color.fromRGBO(156, 24, 24, 1),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Flexible(
            child: ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                child: AutoSizeText(
                  "Contato",
                  maxFontSize: 30,
                  minFontSize: 24,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(19, 42, 68, 1),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 221, 221, 221),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Flexible(
              child: SizedBox(
            height: 20,
          )),
          Flexible(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DonationPage(
                              pix: widget.pix,
                              sended: true,
                              cidade: widget.descAdr,
                            )));
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                child: AutoSizeText(
                  "Doar",
                  maxFontSize: 30,
                  minFontSize: 24,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(19, 42, 68, 1),
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 221, 221, 221),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
