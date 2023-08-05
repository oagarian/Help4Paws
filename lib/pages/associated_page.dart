import 'package:flutter/material.dart';
import 'package:help4paws/widgets/associated_model.dart';
import 'package:help4paws/widgets/associateds_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AssociatedPage extends StatefulWidget {
  const AssociatedPage({Key? key}) : super(key: key);

  @override
  State<AssociatedPage> createState() => _AssociatedPageState();
}

class _AssociatedPageState extends State<AssociatedPage> {
  String _selectedSortOption = 'Ordenar por mais próximos';
  List<AssociatedModel> associatedList = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    var url = Uri.parse("https://8080-oagarian-apihelp4paws-4nwx48pw66j.ws-us102.gitpod.io/user/get?amount=3");
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<AssociatedModel> associatedListData = data
            .map((item) => AssociatedModel.fromJson(item as Map<String, dynamic>))
            .toList();
        setState(() {
          associatedList = associatedListData;
        });
      } else {
        print("Failed to fetch data. Status Code: ${response.statusCode}");
      }
    } catch (e) {
      print("Error: $e");
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
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: associatedList.length,
                    itemBuilder: (context, index) {
                      final associated = associatedList[index];
                      return AssociatedsContainer(
                        context: context,
                        image: associated.logoImage,
                        name: associated.name,
                        desc: associated.description,
                        email: associated.email,
                        number: associated.contactNumber,
                        street: associated.street,
                        descAdr: associated.descriptionAddr,
                        pix: associated.pix,
                      );
                    },
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
