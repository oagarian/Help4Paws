import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:help4paws/services/cases_DAO.dart';
import '../domain/cases.dart';

class CasePage extends StatefulWidget {
  const CasePage({Key? key}) : super(key: key);

  @override
  State<CasePage> createState() => _CasePageState();
}

class _CasePageState extends State<CasePage> {
  final Future<List<Case>> _casesList = CasesDAO().getCases();
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Color.fromARGB(255, 204, 83, 131),
            ),
            child: const Center(child: Icon(Icons.pets)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        body: Hero(
          tag: 'transitionToMainPage',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              const Text(
                '\nCasos',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Quicksand',
                  color: Color.fromRGBO(19, 42, 68, 1),
                ),
              ),
              const Text(
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
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      buildList(casesList: _casesList),
                      /* image: Image.asset('assets/images/Gigante.jpg'),
                        name: 'Gigante',
                        desc:
                            'Um lindo cachorrinho resgatado com raiva que estava dormindo dentro de uma lixeira',
                      ),
                      buildContainerCase(
                        image: Image.asset('assets/images/Grandao.jpg'),
                        name: 'Grandão',
                        desc:
                            'Um mini doguinho resgatado da rua revirando sacolas de lixo à procura de um caldinho de cana',*/
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
    required Case cases,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 236, 236, 236),
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(cases.image),
                radius: 75,
              ),
              Expanded(
                child: Column(
                  children: [
                    Center(
                      child: AutoSizeText(
                        cases.name,
                        minFontSize: 20,
                        maxFontSize: 25,
                        style: const TextStyle(
                          color: Color.fromRGBO(19, 42, 68, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AutoSizeText(
                      cases.desc,
                      minFontSize: 16,
                      maxFontSize: 20,
                      style: const TextStyle(
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
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  buildList({required Future<List<Case>> casesList}) {
    return FutureBuilder<List<Case>>(
      future: casesList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return buildContainerCase(
                cases: snapshot.data![index],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}