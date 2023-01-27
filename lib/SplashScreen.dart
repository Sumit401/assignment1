import 'package:flutter/material.dart';

import 'createColor.dart';
import 'loginPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/images/splashImage.png",
              fit: BoxFit.fill,
              height: MediaQuery.of(context).size.height,
              alignment: Alignment.center,
            ),
            Positioned(
                top: 100,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    color: hexToColor(whiteColor),
                    fit: BoxFit.fitWidth,
                  ),
                )),
            Positioned(
              width: MediaQuery.of(context).size.width,
              bottom: 100,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      children: [
                        Text("YOUR ONE STOP SOLUTION TO",
                            style: TextStyle(
                                color: hexToColor(whiteColor),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                        Text("Rent Pre-Production Equipments Easily",
                            style: TextStyle(
                                color: hexToColor(whiteColor),
                                fontSize: 18,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(hexToColor(redColor))),
                      child: const Text("\t\t\t\t\t\tGet Started\t\t\t\t\t\t",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
