import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';
import 'buttonWidgets.dart';
import 'noAccountRegister.dart';
import 'textFormFields.dart';
import 'textWidgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: hexToColor(greyColor),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  welcomeText(),
                  signInText(),
                ],
              ),
              textFieldContainer(),
              buttonContainer(),
            ],
          ),
        ),
      ),
    );
  }

  textFieldContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          emailTextFormLogin(),
          passwordTextFormLogn(),
          textForForgetPassword()
        ],
      ),
    );
  }

  buttonContainer() {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 70),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              loginButton(),
            ],
          ),
          noAccountRegister(context),
        ],
      ),
    );
  }
}
