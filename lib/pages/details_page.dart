import 'package:flutter/material.dart';
class DetailsPage extends StatefulWidget {
  final String image;
  final String name;
  final String desc;
  final String email;
  final String number;
  final String street;
  final String descAdr;
  const DetailsPage({Key? key, required this.image, required this.name, required this.desc, required this.email, required this.number, required this.street, required this.descAdr}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(226, 248, 243, 1),
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
            child: Center(child: Icon(Icons.business_center)),
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
      height: MediaQuery.of(context).size.height - kToolbarHeight - 70,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CircleAvatar(backgroundImage: NetworkImage('$image'), radius: 100,),
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
          Text(
            '$desc',
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'Cardo',
              color: Color.fromRGBO(19, 42, 68, 1),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  "Contato: \n$email \n$number",
                  style: TextStyle(
                    color: Color.fromRGBO(156, 24, 24, 1),
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Flexible(
                child: Text(
                  "Endereço: \n$street \n$descAdr",
                  style: TextStyle(
                    color: Color.fromRGBO(156, 24, 24, 1),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
              child: Text(
                "Contato",
                style: TextStyle(
                  fontSize: 30,
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
          ElevatedButton(
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 70),
              child: Text(
                "Doar",
                style: TextStyle(
                  fontSize: 30,
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
          )
        ],
      ),
    );
  }
}
