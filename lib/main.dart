import 'package:flutter/material.dart';
import 'package:help4paws/pages/reception_page.dart';
import 'package:help4paws/pages/principal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/start',
      routes: {
        '/start': (context) => const ReceptionPage(),
        '/principal': (context) => const PrincipalPage(),
      }
    );
  }
}