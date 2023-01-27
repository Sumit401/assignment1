import 'package:flutter/material.dart';

import 'createColor.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: hexToColor(greyColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text("Welcome Back!",
                    style: TextStyle(color: hexToColor(whiteColor),fontSize: 25)),
                Text("Please Sign in to your Account",
                    style: TextStyle(color: hexToColor(whiteColor),fontSize: 20))
              ],
            ),
            Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            gapPadding: 20),
                        labelText: "Email/Phone No",
                        labelStyle: TextStyle(color: hexToColor(whiteColor)))),
                TextFormField(decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 20),
                    labelText: "Password",
                    labelStyle: TextStyle(color: hexToColor(whiteColor)))),
              ],
            ),
            Column(
              children: [
                ElevatedButton(onPressed: () => null, child: Text("Login",),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(hexToColor(redColor)))),
                Text("Don't have an account?  Signup",
                    style: TextStyle(color: hexToColor(whiteColor),fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
