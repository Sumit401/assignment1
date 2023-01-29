import 'package:assignment1/homepage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'RegisterPage.dart';
import 'createColor.dart';
import 'flutterToast.dart';
import 'providers/loginPageProvider.dart';

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
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text("Welcome Back!",
                        style: TextStyle(
                            color: hexToColor(whiteColor),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text("Please Sign in to your Account",
                        style: TextStyle(
                            color: hexToColor(whiteColor),
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              Consumer<LoginProviders>(
                builder: (context, providerValue, child) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                              onChanged: (value) {
                                providerValue.getEmail(value);
                              },
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.emailAddress,
                              decoration: textFormDecoration(
                                  "Email/Phone No", providerValue)),
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                                onChanged: (value) {
                                  providerValue.getPassword(value);
                                },
                                obscureText: !providerValue.showPass,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.visiblePassword,
                                decoration: textFormDecoration(
                                    "Password", providerValue))),
                      ],
                    ),
                  );
                },
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 70),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Consumer<LoginProviders>(
                          builder: (context, loginProvider, child) {
                            return ElevatedButton(
                                onPressed: () async{
                                  await loginProvider.getLoginInfo();
                                  bool? status = loginProvider.requestStatus;
                                  if(status ?? false){
                                    print(loginProvider.statusMessage);
                                    print(loginProvider.accessToken);
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                                  }else{
                                    flutterToast(loginProvider.statusMessage);
                                  }
                                },
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        hexToColor(redColor)),
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(20)))),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 18, fontWeight: FontWeight.bold),
                                ));
                          },
                        ),
                      ],
                    ),
                    Padding(
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
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const RegisterPage()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
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
}
