import 'package:flutter/material.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

const String blackColor = "#000000";
const String greyColor = "#121110 ";
const String redColor = "#EF403B";
const String whiteColor = "#FFFFFF ";