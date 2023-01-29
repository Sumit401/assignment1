import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/loginPageProvider.dart';
import '../../reusableWidgets/createColor.dart';

emailTextFormLogin() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Consumer<LoginProviders>(
      builder: (context, providerValue, child) {
        return TextFormField(
            onChanged: (value) {
              providerValue.getEmail(value);
            },
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.emailAddress,
            decoration: textFormDecoration("Email/Phone No", providerValue));
      },
    ),
  );
}

passwordTextFormLogn() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Consumer<LoginProviders>(builder: (context, providerValue, child) {
        return TextFormField(
            onChanged: (value) {
              providerValue.getPassword(value);
            },
            obscureText: !providerValue.showPass,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
            keyboardType: TextInputType.visiblePassword,
            decoration: textFormDecoration("Password", providerValue));
      }));
}

textFormDecoration(value, LoginProviders providerValue) {
  return InputDecoration(
      fillColor: hexToColor(blackColor),
      filled: true,
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      labelText: value,
      labelStyle: TextStyle(
          color: hexToColor(whiteColor),
          fontSize: 15,
          fontWeight: FontWeight.normal),
      suffixIcon: value == "Password"
          ? IconButton(
              onPressed: () {
                providerValue.showPassword();
              },
              icon: providerValue.showPass == true
                  ? Icon(FontAwesomeIcons.eye,
                      color: hexToColor(whiteColor), size: 15)
                  : Icon(FontAwesomeIcons.eyeSlash,
                      color: hexToColor(whiteColor), size: 15),
            )
          : null);
}
