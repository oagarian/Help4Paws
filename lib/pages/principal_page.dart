import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
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
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.business_center,
                            size: 38,
                            color: Color.fromRGBO(19, 42, 68, 1),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/associateds');
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite,
                            size: 38,
                            color: Color.fromRGBO(19, 42, 68, 1),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, 'donations');
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.pets,
                            size: 38,
                            color: Color.fromRGBO(19, 42, 68, 1),
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.people,
                            size: 38,
                            color: Color.fromRGBO(19, 42, 68, 1),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/founders');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(226, 248, 243, 1),
        ),
        body: Column(
          children: [
            Text(
              '\nHelp 4 Paws',
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'Quicksand',
                color: Color.fromRGBO(19, 42, 68, 1),
              ),
            ),
            Text(
              'DA VIDA DAS RUAS À DOCE VIDA\n',
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Cardo',
                color: Color.fromRGBO(19, 42, 68, 1),
              ),
            ),
            Flexible(
              child: Card(
                color: Color.fromRGBO(205, 80, 133, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                margin: EdgeInsets.all(15),
                elevation: 6,
                child: Container(
                  height: 500,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: ListTile(
                      title: Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                        child: Text(
                          'Bem-vindo(a)!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 22,
                            color: Color.fromRGBO(247, 247, 247, 1),
                            fontFamily: 'Quicksand',
                          ),
                        ),
                      ),
                      subtitle: AutoSizeText(
                        '\n\n O Help4Paws é um aplicativo inovador dedicado a resgatar animais de rua e proporcionar-lhes uma vida digna. Com um simples toque na tela, você pode reportar animais em situação de vulnerabilidade, permitindo que nossa equipe de resgate entre em ação imediatamente. Nossa rede de voluntários comprometidos e abrigos parceiros trabalha incansavelmente para resgatar, fornecer cuidados médicos e encontrar lares amorosos para esses animais. Junte-se a nós e faça a diferença na vida dos animais, tornando-se parte dessa causa nobre.',
                        textAlign: TextAlign.center,
                        minFontSize: 16,
                        maxFontSize: 20,
                        style: TextStyle(
                          fontFamily: 'Quicksand',
                          color: Color.fromRGBO(247, 247, 247, 1),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
