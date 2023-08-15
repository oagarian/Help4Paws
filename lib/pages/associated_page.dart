import 'package:flutter/material.dart';
import 'package:help4paws/services/associateds_DAO.dart';
import 'package:help4paws/widgets/associateds_widget.dart';

class AssociatedPage extends StatefulWidget {
  const AssociatedPage({Key? key}) : super(key: key);

  @override
  State<AssociatedPage> createState() => _AssociatedPageState();
}

class _AssociatedPageState extends State<AssociatedPage> {
  Future<List<AssociatedsContainer>>? _associatedsFuture;
  bool isAppBarVisible = true;
  int limit = 5;
  int counter = 0;
  @override
  void initState() {
    super.initState();
    _loadAssociateds(5);
  }

  Future<void> _loadAssociateds(int limit) async {
    final dao = AssociatedsDAO();
    final results = await dao.getAssociateds(limit);
    final count = await dao.getTotal();
    setState(() {
      _associatedsFuture = Future.value(results);
      counter = count;
    });
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
        bottomNavigationBar: BottomAppBar(child: bottomBarBuild()),
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
                  FutureBuilder<List<AssociatedsContainer>>(
                    future: _associatedsFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        var list = snapshot.data!;
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          itemBuilder: (context, index) {
                            return AssociatedsContainer(
                              image: list[index].image,
                              name: list[index].name,
                              desc: list[index].desc,
                              email: list[index].email,
                              number: list[index].number,
                              pix: list[index].pix,
                              street: list[index].street,
                              descAdr: list[index].descAdr,
                            );
                          },
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
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
