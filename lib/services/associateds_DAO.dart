import 'package:mongo_dart/mongo_dart.dart';
import '../widgets/associateds_widget.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AssociatedsDAO {

  final List<AssociatedsContainer> associatedsList = [];
  Future<List<AssociatedsContainer>> getAssociateds(int limit, int option) async {
    int order = 1;
    switch (option) {
      case 1:
        order = 1;
        break;
      case 2:
        order = 3;
        break;
      default:
        order = 1;
        break;
    }
    var url = Uri.parse(
        "http://localhost:8080/user/get?amount=$limit&order=$order");
    final response = await http.get(url);
    if (response.statusCode == 200) {
    final List<dynamic> data = json.decode(response.body);
    
    final associatedsList = data.map((item) {
      return AssociatedsContainer(
        name: item['Asscname'],
        image: item['Logoimage'],
        desc: item['Asscdescription'],
        email: item['Email'],
        number: item['Contactnumber'],
        pix: item['Pix'],
        street: item['Street'],
        descAdr: item['Descriptionaddr'],
      );
    }).toList();
    return associatedsList;
  } else {
    throw Exception('Falha ao carregar os dados da API');
  }
  }

  Future<int> getTotal() async {
    return 10;
  }
}
