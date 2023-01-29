import 'package:flutter/material.dart';

import 'buttonWidgets.dart';
import 'imageWidgets.dart';
import 'textWidgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: [
            splashScreenImage(context),
            splashLogo(context),
            splashFooter(context)
          ],
        ),
      ),
    );
  }

  splashFooter(context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      bottom: 100,
      child: Column(
        children: [
          footerText(),
          getStartedButton(context),
        ],
      ),
    );
  }

  footerText() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [footerHeading(), footerSubHeading()],
      ),
    );
  }
}
