import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
        appBar: AppBar(
            backgroundColor: Color.fromRGBO(226, 248, 243, 1),
            leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            
            children: [
              SizedBox(width: 40),
              AutoSizeText(
                'Doação',
                minFontSize: 36,
                maxFontSize: 40,
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  color: Color.fromRGBO(19, 42, 68, 1),
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(width: 20),
               AutoSizeText(
                'QUALQUER VALOR PODE FAZER A \n DIFERENÇA NA VIDA DE UM BICHINHO',
                minFontSize: 14,
                maxFontSize: 20,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Cardo',
                  color: Color.fromRGBO(19, 42, 68, 1),
                ),
              ),
              SizedBox(height: 40),
              TextFormField(
                decoration: InputDecoration(label: Text('Nome Completo:')),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    label: Text('CPF'), hintText: '000.000.000-00'),
                keyboardType: TextInputType.number,
                maxLength: 11,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                    label: Text('Email'), hintText: 'nome@gmail.com'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Informe o Valor'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
                    child: Text(
                      "Doar",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 204, 83, 131),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(226, 248, 243, 1),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
