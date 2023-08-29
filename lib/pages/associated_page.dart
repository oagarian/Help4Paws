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
  int option = 1;
  
  @override
  void initState() {
    super.initState();
    _loadAssociateds(5, option);
  }

  Future<void> _loadAssociateds(int limit, int option) async {
    final dao = AssociatedsDAO();
    final results = await dao.getAssociateds(limit, option);
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
                    color: const Color.fromARGB(255, 34, 33, 51),
                    onSelected: _handleMenuItemClick,
                    itemBuilder: (context) => [
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
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                  if (limit < counter)
                    Container(
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 153, 224, 94),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      margin: const EdgeInsets.all(5),
                      child: IconButton(
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        onPressed: () {
                          limit += 5;
                          if (limit <= counter) {
                            _loadAssociateds(limit, option);
                          } else {
                            _loadAssociateds(counter, option);
                          }
                        },
                      ),
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
        color: const Color.fromARGB(255, 34, 33, 51),
        child: Row(
          children: [
            Icon(
              iconData,
              color: const Color.fromARGB(255, 196, 194, 194),
            ),
            const SizedBox(width: 8),
            Text(title, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }

  void _handleMenuItemClick(String selectedItem) {
    if (selectedItem == "Ordenar por mais recentes") {
      setState(() {
        if(option != 1) {
          limit = 5;
        }
        option = 1;
      });
      _loadAssociateds(limit, option);
    } else {
      setState(() {
        if(option != 2) {
          limit = 5;
        }
        option = 2;
      });
      _loadAssociateds(limit, option);
    }
  }
}
