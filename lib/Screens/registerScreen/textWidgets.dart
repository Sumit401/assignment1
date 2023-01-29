import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';

headingText() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text("Create New Account",
        style: TextStyle(
            color: hexToColor(whiteColor),
            fontSize: 30,
            fontWeight: FontWeight.bold)),
  );
}

subHeadingText() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text("Fill in the Form to Continue",
        style: TextStyle(
            color: hexToColor(whiteColor),
            fontSize: 18,
            fontWeight: FontWeight.w600)),
  );
}