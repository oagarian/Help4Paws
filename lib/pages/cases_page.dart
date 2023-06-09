import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:help4paws/pages/details_page.dart';

class CasePage extends StatefulWidget {
  const CasePage({Key? key}) : super(key: key);

  @override
  State<CasePage> createState() => _CasePageState();
}

class _CasePageState extends State<CasePage> {
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
            child: Center(child: Icon(Icons.pets)),
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
                '\nCasos',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Quicksand',
                  color: Color.fromRGBO(19, 42, 68, 1),
                ),
              ),
              Text(
                'ALGUNS DEPOIMENTOS DE NOSSOS RESGATADOS\n',
                style: TextStyle(
                  fontSize: 10,
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
                      buildContainerCase(
                        image: Image.asset('assets/images/Gigante.jpg'),
                        name: 'Gigante',
                        desc:
                            'Um lindo cachorrinho resgatado com raiva que estava dormindo dentro de uma lixeira',
                      ),
                      buildContainerCase(
                        image: Image.asset('assets/images/Grandao.jpg'),
                        name: 'Grandão',
                        desc:
                            'Um mini doguinho resgatado da rua revirando sacolas de lixo à procura de um caldinho de cana',
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

  Container buildContainerCase({
    required image,
    required name,
    required desc,
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
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
