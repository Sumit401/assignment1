import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';

headingText(){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text("Verify Your Number",
        style: TextStyle(
            color: hexToColor(whiteColor),
            fontSize: 30,
            fontWeight: FontWeight.bold)),
  );
}
subHeadingText(){
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Text("Enter the OTP received on your number",
        style: TextStyle(
            color: hexToColor(whiteColor),
            fontSize: 18,
            fontWeight: FontWeight.w600)),
  );
}