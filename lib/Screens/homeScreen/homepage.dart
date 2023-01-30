import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';
import 'deleteUserButton.dart';
import 'widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: hexToColor(blackColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            imageContainer(),
            textContainer(),
            deleteUserButton(),
          ],
        ),
      ),
    );
  }

}
