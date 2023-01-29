import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';


footerHeading() {
  return Text("YOUR ONE STOP SOLUTION TO",
      style: TextStyle(
          color: hexToColor(whiteColor),
          fontSize: 18,
          fontWeight: FontWeight.bold));
}

footerSubHeading() {
  return Text("Rent Pre-Production Equipments Easily",
      style: TextStyle(
          color: hexToColor(whiteColor),
          fontSize: 18,
          fontWeight: FontWeight.bold));
}