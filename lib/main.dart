import 'package:flutter/material.dart';
import 'package:help4paws/pages/associated_page.dart';
import 'package:help4paws/pages/details_page.dart';
import 'package:help4paws/pages/donations_page.dart';
import 'package:help4paws/pages/founders_page.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: '/start', routes: {
      '/start': (context) => const ReceptionPage(),
      '/principal': (context) => const PrincipalPage(),
      '/founders': (context) => const FoundersPage(),
      '/associateds': (context) => const AssociatedPage(),
      '/donations': (context) => const DonationPage(pix: "", sended: false, cidade: "Arapiraca"),
    });
  }
}
