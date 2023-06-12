import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  const PrincipalPage({super.key});

  @override
  State<PrincipalPage> createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromRGBO(247, 247, 247, 24),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(226, 248, 243, 24)
          ),        
        body: Column(
          children: [Text('\nHelp4Paws\n',
          style: TextStyle(fontSize: 30,fontFamily: 'Quicksand', color: Color.fromRGBO(19, 42, 68, 24)),),
           Card(
            color: Color.fromRGBO(205, 80, 133, 24),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: ListTile(
                title: Padding(padding: EdgeInsets.fromLTRB(1.5, 2, 2, 1.5),
                child: Text('Bem-vindo(a)!\n', textAlign: TextAlign.center, style: TextStyle(fontSize: 15, color: Color.fromRGBO(247, 247, 247, 24), fontFamily: 'Quicksand'))),
                subtitle: Text(' O Help4Paws é um aplicativo inovador dedicado a resgatar animais de rua e proporcionar-lhes uma vida digna. Com um simples toque na tela, você pode reportar animais em situação de vulnerabilidade, permitindo que nossa equipe de resgate entre em ação imediatamente. Nossa rede de voluntários comprometidos e abrigos parceiros trabalha incansavelmente para resgatar, fornecer cuidados médicos e encontrar lares amorosos para esses animais. Junte-se a nós e faça a diferença na vida dos animais, tornando-se parte dessa causa nobre.', textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12.0, fontFamily: 'Quicksand', color: Color.fromRGBO(247, 247, 247, 24),
              ),
            ),
          ),
        ),
           )
        ]//Dai tu bota teu código aqui e tal, qualquer coisa lembra do modelo que te mandei no email, pode copiar e colar ele aqui se quiser
      )
      )
    );
  }
}