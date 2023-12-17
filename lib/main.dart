import 'package:flutter/material.dart';
import 'package:help4paws/pages/associated_page.dart';
import 'package:help4paws/pages/founders_page.dart';
import 'package:help4paws/pages/reception_page.dart';
import 'package:help4paws/pages/principal_page.dart';
import 'package:help4paws/pages/cases_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/start',
        routes: {
          '/start': (context) => const ReceptionPage(),
          '/founders': (context) => const FoundersPage(),
          '/associateds': (context) => const AssociatedPage(),
          '/cases': (context) => const CasePage(),
        });
  }
}