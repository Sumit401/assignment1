import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';
import '../registerScreen/RegisterPage.dart';


noAccountRegister(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: InkWell(
      child: RichText(
        text: TextSpan(
            text: "Don't have an account?",
            style: TextStyle(
                color: hexToColor(whiteColor),
                fontSize: 18,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                  text: " Signup",
                  style: TextStyle(
                      color: hexToColor(redColor),
                      fontSize: 18,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700))
            ]),
      ),
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
      },
    ),
  );
}
