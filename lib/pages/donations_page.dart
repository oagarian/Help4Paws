import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class DonationPage extends StatefulWidget {
  final String pix;
  final bool sended;
  final String cidade;

  const DonationPage({
    Key? key,
    required this.pix,
    required this.sended,
    required this.cidade,
  }) : super(key: key);

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final valueController = TextEditingController();

  Future<String> _setData({
    required String name,
    required String value,
    required String pix,
    required String cidade,
  }) async {
    var url = Uri.parse(
        "https://gerarqrcodepix.com.br/api/v1?nome=$name&cidade=$cidade&saida=br&chave=$pix&valor=$value");
    final response = await http.get(url);
    final data = json.decode(response.body);
    String brcode = data['brcode'];
    return brcode;
  }

  @override
  void dispose() {
    nameController.dispose();
    cpfController.dispose();
    emailController.dispose();
    valueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: buildBottomAppBar(),
      backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
      appBar: buildAppBar(),
      body: SingleChildScrollView( // Adicionado SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Doação',
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Quicksand',
                  color: Color.fromRGBO(19, 42, 68, 1),
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'QUALQUER VALOR PODE FAZER A \n DIFERENÇA NA VIDA DE UM BICHINHO',
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Cardo',
                  color: Color.fromRGBO(19, 42, 68, 1),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome Completo',
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: cpfController,
                decoration: const InputDecoration(
                  labelText: 'CPF',
                  hintText: '000.000.000-00',
                ),
                keyboardType: TextInputType.number,
                maxLength: 11,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'nome@gmail.com',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: valueController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Informe o Valor',
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  String name = nameController.text;
                  String value = valueController.text;
                  String cidade = widget.cidade;
                  String pix;
                  if (widget.sended) {
                    pix = widget.pix;
                  } else {
                    pix = "tns6@aluno.ifal.edu.br";
                  }
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.network("https://gerarqrcodepix.com.br/api/v1?nome=$name&cidade=$cidade&saida=qr&chave=$pix&valor=$value"),
                            ElevatedButton(
                              onPressed: () async {
                                String brcode = await _setData(
                                  name: name,
                                  value: value,
                                  pix: pix,
                                  cidade: cidade,
                                );
                                Clipboard.setData(ClipboardData(text: brcode));
                              },
                              child: const Text("Copiar código"),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 204, 83, 131),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                  child: Text(
                    "Doar",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  BottomAppBar buildBottomAppBar() {
    return BottomAppBar(
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
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color.fromRGBO(226, 248, 243, 1),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

_launchURL({required String number}) async {
  final Uri url = Uri.parse('https://wa.me/$number');
  if (!await launchUrl(url)) {
    ScaffoldMessenger(child: Text("Error, use the number: $number"));
  }
}
