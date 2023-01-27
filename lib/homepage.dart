import 'package:flutter/material.dart';

import 'createColor.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: hexToColor(blackColor),
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 100),
                child: Image.asset(
                  "assets/images/homePage.png",
                  color: hexToColor(whiteColor),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.center,
                  height: 200,
                  width: 300,
                )),
            Container(
                margin: EdgeInsets.only(top: 100),
                child: Text(
                  "HOME",
                  style: TextStyle(
                      color: hexToColor(whiteColor),
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ))
          ],
        ),
      ),
    );
  }
}
