import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:help4paws/services/notices_dao.dart';
import 'package:help4paws/widgets/notices_widget.dart';
import '../services/database_connect.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  bool isLoading = true;
  List<dynamic> noticesList = [];

  @override
  void initState() {
    super.initState();
    _loadNotices();
  }

  Future<void> _loadNotices() async {
    try {
      final conn = await DatabaseConnect.connect();
      final noticesDAO = NoticesDAO(conn);
      final results = await noticesDAO.getNotices(5);
      setState(() {
        noticesList = results;
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
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
            decoration: const BoxDecoration(
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
                            Navigator.pushNamed(context, '/donations');
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
        backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(226, 248, 243, 1),
        ),
        body: ListView(
          children: [
            const Center(
              child: Text(
                '\nHelp 4 Paws',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Quicksand',
                  color: Color.fromRGBO(19, 42, 68, 1),
                ),
              ),
            ),
            const Center(
              child: Text(
                'DA VIDA DAS RUAS À DOCE VIDA\n',
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Cardo',
                  color: Color.fromRGBO(19, 42, 68, 1),
                ),
              ),
            ),
            Card(
              color: const Color.fromRGBO(205, 80, 133, 1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              margin: const EdgeInsets.all(20),
              elevation: 6,
              child: const SizedBox(
                height: 350,
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
                      '\n\n O Help4Paws é um aplicativo inovador dedicado a resgatar animais de rua e proporcionar-lhes uma vida digna. Com um simples toque na tela, você pode reportar animais em situação de vulnerabilidade, permitindo que nossa equipe de resgate entre em ação imediatamente. Nossa rede de voluntários comprometidos e abrigos parceiros trabalha incansavelmente para resgatar, fornecer cuidados médicos e encontrar lares amorosos para esses animais. Junte-se a nós e faça a diferença na vida dos animais, tornando-se parte dessa causa nobre.',
                      textAlign: TextAlign.center,
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
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                 Icon(
                  Icons.newspaper,
                  color: Color.fromARGB(255, 22, 23, 85),
                  size: 25,
                ),
                 AutoSizeText('NOTÍCIAS DO MUNDO ANIMAL',
                    minFontSize: 25,
                    maxFontSize: 80,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(19, 42, 68, 1),
                    )),
              ],
            ),
            isLoading
                ? Column(
                    children: const [
                       SizedBox(height: 20),
                       CircularProgressIndicator(),
                    ],
                  )
                : Column(
                    children: noticesList.map((notice) {
                      return NoticesContainer(
                        context: context,
                        titulo: notice[1],
                        data: notice[2],
                        descricaoNoticia: notice[3],
                        fonte: notice[4],
                      );
                    }).toList(),
                  ),
          ],
        
        ),
      ),
    );
  }
}
