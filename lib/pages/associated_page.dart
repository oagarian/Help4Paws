import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:help4paws/pages/details_page.dart';
class AssociatedPage extends StatefulWidget {
  const AssociatedPage({Key? key}) : super(key: key);

  @override
  State<AssociatedPage> createState() => _AssociatedPageState();
}

class _AssociatedPageState extends State<AssociatedPage> {
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Text(
                'CONHEÇA UM POUCO DE NOSSA REDE \nDE VOLUNTÁRIOS E PARCEIROS\n',
                style: TextStyle(
                  fontSize: 12,
                  fontFamily: 'Cardo',
                  color: Color.fromRGBO(19, 42, 68, 1),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      buildContainerAssociated(
                        image: 'https://s2.glbimg.com/nvjFq8VRjyrpdQqaOeywz-5DFwY=/e.glbimg.com/og/ed/f/original/2021/08/27/captura_de_tela_2021-08-27_as_11.01.15.png',
                        name: 'Abrigo Serrotino',
                        desc: 'O abrigo Serrotino foi criado em 2003 pela veterinária Josefa de Andrade e se tornou um dos primeiros parceiros do H4P, cedendo espaço e tratamento para cães, gatos, entre outros animais, resgatados por nossa equipe.',
                        email: 'email@example.com',
                        number: '(00) 00000-0000',
                        street: "Rua Sem Nome",
                        descAdr: "Próximo ao Cabaré do Jão"
                      ),
                      buildContainerAssociated(
                        image: 'https://portal.fmu.br/wp-content/uploads/servicos/hospital-veterinario/servicos-hospital-veterinario2.jpg',
                        name: 'B&C Company',
                        desc: ' A B&C Company se tornou nossa parceira em 2018, fazendo doações de materiais, remédios e até mesmo de mantimentos necessários para ajudar os animais resgatados.',
                        email: 'email2@example.com',
                        number: '(11) 11111-0000',
                        street: "Rua Bla bla",
                        descAdr: "Não é no serrote"
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainerAssociated({
    required image,
    required name,
    required desc,
    required email,
    required number,
    required street,
    required descAdr,

  }) {
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