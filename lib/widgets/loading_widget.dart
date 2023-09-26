import 'package:flutter/material.dart';

class LoadingCat extends StatefulWidget {
  const LoadingCat({super.key});

  @override
  State<LoadingCat> createState() => _LoadingCatState();
}

class _LoadingCatState extends State<LoadingCat> {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/images/loading_cat.gif', width: 150, height: 150);
  }
}