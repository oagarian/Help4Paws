import 'package:flutter/material.dart';
import 'package:flutter_gif/flutter_gif.dart';

class LoadingCat extends StatefulWidget {
  const LoadingCat({super.key});

  @override
  State<LoadingCat> createState() => _LoadingCatState();
}

class _LoadingCatState extends State<LoadingCat> with TickerProviderStateMixin{
    late FlutterGifController controller;

    void initState() {
      super.initState();
      controller = FlutterGifController(vsync: this);
      WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.repeat(
        min: 0,
        max: 82,
        period: const Duration(milliseconds: 1500),
      );
    });
    }

  @override
  Widget build(BuildContext context) {
    return GifImage(
      controller: controller,
      image: const AssetImage('assets/images/loading_cat.gif'),
      width: 150,
      height: 150,
    );
  }
}