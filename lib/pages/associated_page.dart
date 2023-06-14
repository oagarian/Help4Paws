import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:help4paws/pages/details_page.dart';

import '../widgets/associateds_widget.dart';

class AssociatedPage extends StatefulWidget {
  const AssociatedPage({Key? key}) : super(key: key);

  @override
  State<AssociatedPage> createState() => _AssociatedPageState();
}

class _AssociatedPageState extends State<AssociatedPage> {
  String _selectedSortOption = 'Ordenar por mais próximos';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: () {Navigator.pop(context);},),
          backgroundColor: const Color.fromRGBO(226, 248, 243, 1),
          actions: [
            PopupMenuButton<String>(
              color: Color.fromARGB(255, 255, 255, 255),
            
              itemBuilder: (context) => [
                _buildPopupMenuItem(
                  "Ordenar por mais próximos",
                  Icons.gps_fixed,
                ),
                _buildPopupMenuItem(
                  "Ordenar por mais recentes",
                  Icons.arrow_circle_up,
                ),
                _buildPopupMenuItem(
                  "Ordenar por mais antigos",
                  Icons.arrow_circle_down,
                ),
              ],
            ),
          ],
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
                      AssociatedsContainer(
                        context: context,
                        image:
                            'https://s2.glbimg.com/nvjFq8VRjyrpdQqaOeywz-5DFwY=/e.glbimg.com/og/ed/f/original/2021/08/27/captura_de_tela_2021-08-27_as_11.01.15.png',
                        name: 'Abrigo Serrotino',
                        desc:
                            'O abrigo Serrotino foi criado em 2003 pela veterinária Josefa de Andrade e se tornou um dos primeiros parceiros do H4P, cedendo espaço e tratamento para cães, gatos, entre outros animais, resgatados por nossa equipe.',
                        email: 'email@example.com',
                        number: '(00) 00000-0000',
                        street: "Rua Sem Nome",
                        descAdr: "Próximo ao Cabaré do Jão",
                        pix: "tns6@aluno.ifal.edu.br",
                      ),
                      AssociatedsContainer(
                        context: context,
                        image:
                            'https://portal.fmu.br/wp-content/uploads/servicos/hospital-veterinario/servicos-hospital-veterinario2.jpg',
                        name: 'B&C Company',
                        desc:
                            'A B&C Company se tornou nossa parceira em 2018, fazendo doações de materiais, remédios e até mesmo de mantimentos necessários para ajudar os animais resgatados.',
                        email: 'email2@example.com',
                        number: '(11) 11111-0000',
                        street: "Rua Bla bla",
                        descAdr: "Não é no serrote",
                        pix: "junioradelsonst@gmail.com",
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

  PopupMenuItem<String> _buildPopupMenuItem(String title, IconData iconData) {
  return PopupMenuItem<String>(
    value: title,
    child: Container(
      color: Colors.white,
      child: Row(
        children: [
          Icon(
            iconData,
            color: Colors.black,
          ),
          SizedBox(width: 8),
          Text(title),
        ],
      ),
    ),
  );
}
}
