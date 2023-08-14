import 'package:flutter/material.dart';
import 'package:help4paws/services/associateds_DAO.dart';
import 'package:help4paws/widgets/associateds_widget.dart';

class AssociatedPage extends StatefulWidget {
  const AssociatedPage({Key? key}) : super(key: key);

  @override
  State<AssociatedPage> createState() => _AssociatedPageState();
}

class _AssociatedPageState extends State<AssociatedPage> {
  @override
  void initState() {
    super.initState();
    _loadAssociateds(5);
  }

  bool isAppBarVisible = true;
  Future<List<AssociatedsContainer>> associatedsList = Future.value([]);
  bool isVisible = false;
  bool isLoading = true;
  int count = 0;
  int amount = 5;
  @override
  Future<void> _loadAssociateds(int amount) async {
    try {
      final DAO = AssociatedsDAO();
      final results = await DAO.getAssociateds(amount: amount);
      count = await DAO.getTotal();
      if (results != null) {
        setState(() {
          associatedsList = Future.value(results);
          isLoading = false;
          isVisible = true;
          if(amount >= count ) {
            isVisible = false;
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        isLoading = false;
      });
    }
  }

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
                      future: associatedsList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var lista = snapshot.data!;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: lista.length,
                            itemBuilder: (context, index) {
                              return AssociatedsContainer(
                                image: lista[index].image,
                                name: lista[index].name,
                                desc: lista[index].desc,
                                email: lista[index].email,
                                number: lista[index].number,
                                pix: lista[index].pix,
                                street: lista[index].street,
                                descAdr: lista[index].descAdr,
                              );
                            },
                          );
                        } else {
                          return Center(child: CircularProgressIndicator(),);
                        }

                      }),
                  
                  isVisible ? 
                    IconButton(
                      icon: const Icon(Icons.keyboard_arrow_down_outlined),
                      onPressed: () {
                        amount += 5;
                        _loadAssociateds(amount);
                      },
                    ) : const SizedBox()
                    
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
