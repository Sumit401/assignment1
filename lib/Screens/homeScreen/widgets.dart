
import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';

imageContainer() {
  return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Image.asset(
        "assets/images/homePage.png",
        color: hexToColor(whiteColor),
        fit: BoxFit.fitWidth,
        alignment: Alignment.center,
        height: 200,
        width: 300,
      ));
}

textContainer() {
  return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Text(
        "HOME",
        style: TextStyle(
            color: hexToColor(whiteColor),
            fontWeight: FontWeight.bold,
            fontSize: 30),
      ));
}