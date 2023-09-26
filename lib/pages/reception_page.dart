import 'package:flutter/material.dart';

class ReceptionPage extends StatefulWidget {
  const ReceptionPage({super.key});

  @override
  State<ReceptionPage> createState() => _ReceptionPageState();
}

class _ReceptionPageState extends State<ReceptionPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 242, 178, 177),
        body:  InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/principal');
          },
          child: Hero(
            tag: 'transitionToMainPage',
            child: buildBackground(),
          )
        )
      )
    );
  }

  Stack buildBackground() {
    return Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 115, 255, 248),
                      Color.fromARGB(255, 166, 255, 163)
                    ]
                  )
                ),
                child: Image.asset(
                    "assets/images/principal_icon_transparent.png",
                    width: 300,
                    alignment: Alignment.bottomCenter
                  )
              
            ),
            
             const Column(
              children: [
                SizedBox(height: 75),
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 253, 231, 35),
                  radius: 60
                ),
              ],
            )
          ],
        );
  }
}