import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
        bottomNavigationBar: 
                  BottomAppBar(
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      alignment: Alignment.topCenter, 
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                        color: Color.fromARGB(255, 204, 83, 131),
                      ),
                       child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.business_center, size: 35, color: Color.fromRGBO(19, 42, 68, 24),),
              onPressed: () {},),
              Text('Associados', 
              style: TextStyle(
                fontSize: 10, 
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand', 
                color: Color.fromRGBO(19, 42, 68, 24)),),
              ],
              ),
              Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.favorite, size: 35, color: Color.fromRGBO(19, 42, 68, 24),),
              onPressed: () {},),
              Text('Doações', 
              style: TextStyle(
                fontSize: 10, 
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand', 
                color: Color.fromRGBO(19, 42, 68, 24)),),
              ],
              ),
              Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.account_circle_rounded, size: 35, color: Color.fromRGBO(19, 42, 68, 24),),
              onPressed: () {},),
              Text('Cadastrar', 
              style: TextStyle(
                fontSize: 10, 
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand', 
                color: Color.fromRGBO(19, 42, 68, 24)),),
              ],
              ),
              Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.pets, size: 35, color: Color.fromRGBO(19, 42, 68, 24),),
              onPressed: () {},),
              Text('Casos', 
              style: TextStyle(
                fontSize: 10, 
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand', 
                color: Color.fromRGBO(19, 42, 68, 24)),),
              ],
              ),
              Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Icons.people, size: 35, color: Color.fromRGBO(19, 42, 68, 24),),
              onPressed: () {},),
              Text('Fundadores', 
              style: TextStyle(
                fontSize: 10, 
                fontWeight: FontWeight.bold,
                fontFamily: 'Quicksand', 
                color: Color.fromRGBO(19, 42, 68, 24)),),
              ],
              ),
      ],
    ),
                    ),
                    
                  ),
        backgroundColor: const Color.fromRGBO(247, 247, 247, 24),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(226, 248, 243, 24)
          ),
          body: 
          const Column(
            children: [
              Text('\nHelp 4 Paws', 
              style: TextStyle(
                fontSize: 30, 
                fontFamily: 'Quicksand', 
                color: Color.fromRGBO(19, 42, 68, 24)
                ),
              ),
              Text('DA VIDA DAS RUAS À DOCE VIDA\n',
              style: TextStyle(
                fontSize: 10,
                fontFamily: 'Cardo',
                color: Color.fromRGBO(19, 42, 68, 24)
              ),),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), //Ta dando erro
                ),
                margin: EdgeInsets.all(15),                           
                color: Color.fromRGBO(205, 80, 133, 24),
                elevation: 6,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListTile(
                    title: Padding(
                      padding: EdgeInsets.fromLTRB(0, 2, 00, 2),
                      child: Text('Bem-vindo(a)!', 
                      textAlign: TextAlign.center, 
                      style: TextStyle(
                        fontSize: 15, 
                        color: Color.fromRGBO(247, 247, 247, 24), 
                        fontFamily: 'Quicksand'))
                        ),
                        subtitle: Text(' O Help4Paws é um aplicativo inovador dedicado a resgatar animais de rua e proporcionar-lhes uma vida digna. Com um simples toque na tela, você pode reportar animais em situação de vulnerabilidade, permitindo que nossa equipe de resgate entre em ação imediatamente. Nossa rede de voluntários comprometidos e abrigos parceiros trabalha incansavelmente para resgatar, fornecer cuidados médicos e encontrar lares amorosos para esses animais. Junte-se a nós e faça a diferença na vida dos animais, tornando-se parte dessa causa nobre.', 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.0, 
                          fontFamily: 'Quicksand', 
                          color: Color.fromRGBO(247, 247, 247, 24),),),
                          ),
                        ),
                      )                      
                    ]//Dai tu bota teu código aqui e tal, qualquer coisa lembra do modelo que te mandei no email, pode copiar e colar ele aqui se quiser
                  )                  
                )
              );
            }
          }