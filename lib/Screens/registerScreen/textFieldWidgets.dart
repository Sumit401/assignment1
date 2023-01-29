import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../providers/registerPageProviders.dart';
import '../../reusableWidgets/createColor.dart';

nameTextField() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Consumer<RegisterProvider>(
      builder: (context, providerValue, child) {
        return TextFormField(
            onChanged: (value) {
              providerValue.getName(value);
            },
            textCapitalization: TextCapitalization.words,
            style: textStyle(),
            keyboardType: TextInputType.name,
            decoration: textFormDecoration("Name"));
      },
    ),
  );
}


emailTextField() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:
          Consumer<RegisterProvider>(builder: (context, providerValue, child) {
        return TextFormField(
            onChanged: (value) {
              providerValue.getEmail(value);
            },
            style: textStyle(),
            keyboardType: TextInputType.emailAddress,
            decoration: textFormDecoration("Email"));
      }));
}

phoneTextField() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:
          Consumer<RegisterProvider>(builder: (context, providerValue, child) {
        return TextFormField(
            onChanged: (value) {
              providerValue.getPhone(value);
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
            ],
            style: textStyle(),
            keyboardType: TextInputType.phone,
            decoration: textFormDecoration("Phone Number"));
      }));
}

passwordTextField() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:
          Consumer<RegisterProvider>(builder: (context, providerValue, child) {
        return TextFormField(
            onChanged: (value) {
              providerValue.getPassword(value);
            },
            obscureText: !providerValue.showPass,
            style: textStyle(),
            keyboardType: TextInputType.visiblePassword,
            decoration: textFormDecorationPassword(providerValue));
      }));
}

cnfPasswordTextField() {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child:
          Consumer<RegisterProvider>(builder: (context, providerValue, child) {
        return TextFormField(
            onChanged: (value) {
              providerValue.getCnfPassword(value);
            },
            obscureText: !providerValue.showCnfPass,
            style: textStyle(),
            keyboardType: TextInputType.visiblePassword,
            decoration: textFormDecorationCnfPassword(providerValue));
      }));
}

textFormDecoration(value) {
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
          fontWeight: FontWeight.normal));
}

textFormDecorationPassword(RegisterProvider providerValue) {
  return InputDecoration(
      fillColor: hexToColor(blackColor),
      filled: true,
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      labelText: "Password",
      labelStyle: TextStyle(
          color: hexToColor(whiteColor),
          fontSize: 15,
          fontWeight: FontWeight.normal),
      suffixIcon: IconButton(
        onPressed: () {
          providerValue.showPassword();
        },
        icon: providerValue.showPass == true
            ? Icon(FontAwesomeIcons.eye,
                color: hexToColor(whiteColor), size: 15)
            : Icon(FontAwesomeIcons.eyeSlash,
                color: hexToColor(whiteColor), size: 15),
      ));
}

textFormDecorationCnfPassword(RegisterProvider providerValue) {
  return InputDecoration(
      fillColor: hexToColor(blackColor),
      filled: true,
      focusedBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      labelText: "Confirm Password",
      labelStyle: TextStyle(
          color: hexToColor(whiteColor),
          fontSize: 15,
          fontWeight: FontWeight.normal),
      suffixIcon: IconButton(
        onPressed: () {
          providerValue.showCnfPassword();
        },
        icon: providerValue.showCnfPass == true
            ? Icon(FontAwesomeIcons.eye,
                color: hexToColor(whiteColor), size: 15)
            : Icon(FontAwesomeIcons.eyeSlash,
                color: hexToColor(whiteColor), size: 15),
      ));
}


textStyle() {
  return const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold);
}

