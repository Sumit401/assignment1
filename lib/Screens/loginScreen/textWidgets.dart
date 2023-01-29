import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';

welcomeText() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text("Welcome Back!",
        style: TextStyle(
            color: hexToColor(whiteColor),
            fontSize: 30,
            fontWeight: FontWeight.bold)),
  );
}
signInText() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text("Please Sign in to your Account",
        style: TextStyle(
            color: hexToColor(whiteColor),
            fontSize: 18,
            fontWeight: FontWeight.w600)),
  );
}

textForForgetPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Container(
        margin: const EdgeInsets.only(top: 5),
        child: Text(
          "Forgot Password?",
          style: TextStyle(color: hexToColor(whiteColor)),
          textAlign: TextAlign.left,
        ),
      ),
    ],
  );
}

