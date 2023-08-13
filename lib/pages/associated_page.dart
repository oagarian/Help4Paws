import 'package:flutter/material.dart';
import 'package:help4paws/services/associateds_dao.dart';
import 'package:help4paws/services/database_connect.dart';
import 'package:help4paws/widgets/associateds_widget.dart';

class AssociatedPage extends StatefulWidget {
  const AssociatedPage({Key? key}) : super(key: key);

  @override
  State<AssociatedPage> createState() => _AssociatedPageState();
}

class _AssociatedPageState extends State<AssociatedPage> {
  List<dynamic> associatedsList = [];
  bool isLoading = true;
  int limit = 5;
  int counter = 0;
  bool isAppBarVisible = true;

  @override
  void initState() {
    super.initState();
    _loadAssociateds(5);
  }

  Future<void> _loadAssociateds(int limit) async {
    try {
      final connection = await DatabaseConnect.connect();
      final dao = AssociatedsDAO(connection);
      final results = await dao.getAssociateds(limit);
      final count = await dao.getAssociatedsCount();
      setState(() {
        associatedsList = results;
        isLoading = false;
        counter = count;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: isAppBarVisible
            ? AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                backgroundColor: const Color.fromRGBO(226, 248, 243, 1),
                actions: [
                  PopupMenuButton<String>(
                    color: const Color.fromARGB(255, 255, 255, 255),
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
              )
            : null,
        bottomNavigationBar: BottomAppBar(
          child: bottomBarBuild()
        ),
        backgroundColor: const Color.fromARGB(255, 252, 252, 252),
        body: Hero(
          tag: 'transitionToMainPage',
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                setState(() {
                  isAppBarVisible = scrollNotification.scrollDelta! < 0;
                });
              }
              return false;
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'CONHEÇA UM POUCO DE NOSSA REDE \nDE VOLUNTÁRIOS E PARCEIROS\n',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Cardo',
                      color: Color.fromRGBO(19, 42, 68, 1),
                    ),
                  ),
                  isLoading
                      ? const CircularProgressIndicator()
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: associatedsList.length,
                          itemBuilder: (context, index) {
                            return AssociatedsContainer(
                              context: context,
                              name: associatedsList[index][0],
                              image: associatedsList[index][1],
                              desc: associatedsList[index][2],
                              email: associatedsList[index][3],
                              number: associatedsList[index][4],
                              pix: associatedsList[index][5],
                              street: associatedsList[index][6],
                              descAdr: associatedsList[index][7],
                            );
                          },
                        ),
                  if (limit < counter)
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      onPressed: () {
                        limit += 5;
                        if (limit <= counter) {
                          _loadAssociateds(limit);
                        } else {
                          _loadAssociateds(counter);
                        }
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }




  Container bottomBarBuild() {
    return Container(
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
          child: const Center(child: Icon(Icons.business_center, size: 50)),
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
            const SizedBox(width: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
