import 'package:flutter/material.dart';
import 'package:help4paws/services/associateds_DAO.dart';
import 'package:help4paws/services/database_connect.dart';
import 'package:help4paws/widgets/associateds_widget.dart';

class AssociatedPage extends StatefulWidget {
  const AssociatedPage({Key? key}) : super(key: key);

  @override
  State<AssociatedPage> createState() => _AssociatedPageState();
}

class _AssociatedPageState extends State<AssociatedPage> {
  String _selectedSortOption = 'Ordenar por mais próximos';
  List<dynamic> associatedsList = [];
  bool isLoading = true;
  int limit = 5;
  int counter = 0;

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
      print('Erro ao carregar os dados: $error');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Color.fromARGB(255, 204, 83, 131),
            ),
            child: const Center(child: Icon(Icons.business_center, size: 50)),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 252, 252, 252),
        body: Hero(
          tag: 'transitionToMainPage',
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
                    ? CircularProgressIndicator()
                    : Column(
                        children: associatedsList.map((associated) {
                          return AssociatedsContainer(
                            context: context,
                            name: associated[0],
                            image: associated[1],
                            desc: associated[2],
                            email: associated[3],
                            number: associated[4],
                            pix: associated[5],
                            street: associated[6],
                            descAdr: associated[7],
                          );
                        }).toList(),
                      ),
                if (limit < counter)
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down_outlined),
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
