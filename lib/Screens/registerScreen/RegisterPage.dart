import 'package:assignment1/Screens/registerScreen/registerButton.dart';
import 'package:flutter/material.dart';


import '../../reusableWidgets/createColor.dart';
import 'alreadyRegistered.dart';
import 'textFieldWidgets.dart';
import 'textWidgets.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: hexToColor(greyColor)),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    headingText(),
                    subHeadingText(),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      nameTextField(),
                      emailTextField(),
                      phoneTextField(),
                      passwordTextField(),
                      cnfPasswordTextField()
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      registerButton(),
                      alreadyRegistered(context)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
