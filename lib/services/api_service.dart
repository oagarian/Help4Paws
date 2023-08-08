import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:help4paws/widgets/associated_model.dart';

class ApiService {
  Future<String> getData() async {
    var url = Uri.parse("https://8080-oagarian-apihelp4paws-oo45ao2zil9.ws-us102.gitpod.io/user/get");
    final response = await http.get(url);
    final data = json.decode(response.body);
    String katchau = data["boolValue"];
    return katchau;
  }
}



