import 'package:flutter/material.dart';


import '../../reusableWidgets/createColor.dart';
import '../loginScreen/loginPage.dart';

getStartedButton(context){
  return Padding(
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
  );
}