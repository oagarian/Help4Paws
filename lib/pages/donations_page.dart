import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class DonationPage extends StatefulWidget {
  final String pix;
  final bool sended;
  final String cidade;

  const DonationPage({Key? key, required this.pix, required this.sended, required this.cidade})
      : super(key: key);

  @override
  _DonationPageState createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  final nameController = TextEditingController();
  final cpfController = TextEditingController();
  final emailController = TextEditingController();
  final valueController = TextEditingController();

  Future<String> _setData(
      {required String name, required String value, required String pix, required String cidade}) async {
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Scaffold(
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
              child: Center(child: Icon(Icons.business_center)),
            ),
          ),
          backgroundColor: const Color.fromRGBO(247, 247, 247, 1),
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(226, 248, 243, 1),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                SizedBox(width: 40),
                AutoSizeText(
                  'Doação',
                  minFontSize: 36,
                  maxFontSize: 40,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    color: Color.fromRGBO(19, 42, 68, 1),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                AutoSizeText(
                  'QUALQUER VALOR PODE FAZER A \n DIFERENÇA NA VIDA DE UM BICHINHO',
                  minFontSize: 14,
                  maxFontSize: 20,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Cardo',
                    color: Color.fromRGBO(19, 42, 68, 1),
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome Completo',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: cpfController,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    hintText: '000.000.000-00',
                  ),
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(11),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'nome@gmail.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: valueController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Informe o Valor',
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
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
                            children: [
                              FutureBuilder<String>(
                                future: _setData(
                                    name: name, value: value, pix: pix, cidade: cidade),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Image.network(snapshot.data!);
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  }
                                  return CircularProgressIndicator();
                                },
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  String brcode = await _setData(
                                      name: name, value: value, pix: pix, cidade: cidade);
                                  Clipboard.setData(ClipboardData(text: brcode));
                                },
                                child: Text("Copiar código"),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 40),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
                      child: Text(
                        "Doar",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 204, 83, 131),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
