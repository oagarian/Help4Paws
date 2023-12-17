import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:help4paws/services/notices_dao.dart';
import 'package:help4paws/widgets/loading_widget.dart';
import 'package:help4paws/widgets/notices_widget.dart';
import '../domain/notices.dart';
import '../services/shared_preferences.dart';

class PrincipalPage extends StatefulWidget {
  final bool isWhite;
  const PrincipalPage({Key? key, required this.isWhite}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  late bool atualTheme;
  Future<List<Notices>> futureNotice = NoticesDAO().getNotices();
  Color mediumGrey = Color.fromRGBO(66, 60, 73, 1);
  Color darkGrey = Color.fromRGBO(34, 36, 39, 1);
  Color golden = Color.fromRGBO(231, 167, 29, 1);
  Color darkBlue = Color.fromARGB(255, 22, 49, 90);
  Color pink = Color.fromARGB(255, 204, 83, 131);

  
  @override
  void initState() {
    super.initState();
    atualTheme = widget.isWhite;
  }

  void turnIcon() {
    setState(() {
      atualTheme = !atualTheme;
      SharedPrefs().setTheme(atualTheme);
    });
  }

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
              color: atualTheme ? Color.fromARGB(255, 204, 83, 131) : mediumGrey,
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
                          icon: const Icon(
                            Icons.business_center,
                            size: 50,
                            color: Color.fromRGBO(19, 42, 68, 1),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/associateds');
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            size: 50,
                            color: Color.fromRGBO(19, 42, 68, 1),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/cases');
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.pets,
                            size: 50,
                            color: Color.fromRGBO(19, 42, 68, 1),
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.people,
                            size: 50,
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
        backgroundColor: atualTheme ? Color.fromRGBO(247, 247, 247, 1) : darkGrey,
        appBar: AppBar(
            backgroundColor: atualTheme ? const Color.fromRGBO(226, 248, 243, 1) : darkBlue,
            actions: [
              IconButton(
                icon: Icon(atualTheme ? Icons.wb_sunny : Icons.nightlight_round),
                color: atualTheme
                    ? Colors.yellow
                    : Color.fromARGB(255, 185, 185, 185),
                onPressed: () {
                  turnIcon();
                },
              ),
            ]),
        body: ListView(
          children: [
            Center(
              child: Text(
                '\nHelp 4 Paws',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Quicksand',
                  color: atualTheme ? Color.fromRGBO(19, 42, 68, 1) : golden,
                ),
              ),
            ),
             Center(
              child: Text(
                'DA VIDA DAS RUAS À DOCE VIDA\n',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Cardo',
                  color: atualTheme ? Color.fromRGBO(19, 42, 68, 1) : golden,
                ),
              ),
            ),
            Card(
              color: atualTheme ? pink : mediumGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              margin: const EdgeInsets.all(20),
              elevation: 6,
              child: const SizedBox(
                height: 380,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                      child: Text(
                        'Bem-vindo(a)!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color.fromRGBO(247, 247, 247, 1),
                          fontFamily: 'Quicksand',
                        ),
                      ),
                    ),
                    subtitle: AutoSizeText(
                      '\n O Help4Paws é um aplicativo inovador dedicado a resgatar animais de rua e proporcionar-lhes uma vida digna. Com um simples toque na tela, você pode reportar animais em situação de vulnerabilidade, permitindo que nossa equipe de resgate entre em ação. Nossa rede de voluntários comprometidos e abrigos parceiros trabalham incansavelmente para resgatar, fornecer cuidados médicos e encontrar lares amorosos. Junte-se a nós e faça a diferença na vida dos animais, tornando-se parte dessa causa nobre.',
                      textAlign: TextAlign.justify,
                      minFontSize: 16,
                      maxFontSize: 60,
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        color: Color.fromRGBO(247, 247, 247, 1),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //N.A.
            Card(
              margin: const EdgeInsets.all(20),
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              color: const Color.fromRGBO(248, 217, 218, 1),
              child: Column(children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.newspaper,
                        color: Color.fromRGBO(19, 42, 68, 1),
                        size: 25,
                      ),
                      Text(
                        ' Notícias do mundo animal',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color.fromRGBO(19, 42, 68, 1),
                          fontFamily: 'Quicksand',
                        ),
                      )
                    ],
                  ),
                ),
                FutureBuilder<List<Notices>>(
                    future: futureNotice,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var lista = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: lista.length,
                          itemBuilder: (context, index) {
                            return NoticesContainer(notices: lista[index]);
                          },
                        );
                      }
                      return const Padding(
                        padding: EdgeInsets.all(20),
                        child: Center(child: LoadingCat()),
                      );
                    })
              ]),
            )
          ],
        ),
      ),
    );
  }
}