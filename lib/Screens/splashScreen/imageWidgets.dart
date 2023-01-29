import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';

splashScreenImage(context) {
  return Image.asset(
    "assets/images/splashImage.png",
    fit: BoxFit.fill,
    height: MediaQuery.of(context).size.height,
    alignment: Alignment.center,
  );
}

splashLogo(context) {
  return Positioned(
      top: 100,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Image.asset(
          "assets/images/logo.png",
          color: hexToColor(whiteColor),
          fit: BoxFit.fitWidth,
        ),
      ));
}
