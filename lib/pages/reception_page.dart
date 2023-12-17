import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:help4paws/pages/principal_page.dart';

import '../services/shared_preferences.dart';

class ReceptionPage extends StatefulWidget {
  const ReceptionPage({super.key});

  @override
  State<ReceptionPage> createState() => _ReceptionPageState();
}

class _ReceptionPageState extends State<ReceptionPage> {
  verifyTheme() async {
    bool isWhite = await SharedPrefs().getTheme();
    await Future.delayed(const Duration(milliseconds:  1500));


    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return PrincipalPage(isWhite: isWhite);
        },
      ),
    );
  }

  @override 
  void initState() {
    super.initState();
    verifyTheme();
  }

  @override
  Widget build(BuildContext context) {
    return buildBackground();
  }
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
            
            Column(
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