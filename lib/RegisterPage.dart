
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'createColor.dart';
import 'flutterToast.dart';
import 'loginPage.dart';
import 'otpVerification.dart';
import 'providers/registerPageProviders.dart';
import 'providers/timer.dart';

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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("Create New Account",
                          style: TextStyle(
                              color: hexToColor(whiteColor),
                              fontSize: 30,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text("Fill in the Form to Continue",
                          style: TextStyle(
                              color: hexToColor(whiteColor),
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    )
                  ],
                ),
                Consumer<RegisterProvider>(
                  builder: (context, providerValue, child) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                                onChanged: (value) {
                                  providerValue.getName(value);
                                },
                                textCapitalization: TextCapitalization.words,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.name,
                                decoration: textFormDecoration("Name")),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                                onChanged: (value) {
                                  providerValue.getEmail(value);
                                },
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.emailAddress,
                                decoration: textFormDecoration("Email")),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: TextFormField(
                                onChanged: (value) {
                                    providerValue.getPhone(value);
                                },
                                inputFormatters: [
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                keyboardType: TextInputType.phone,
                                decoration: textFormDecoration("Phone Number")),
                          ),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                  onChanged: (value) {
                                    providerValue.getPassword(value);
                                  },
                                  obscureText: !providerValue.showPass,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: textFormDecorationPassword(
                                      providerValue))),
                          Container(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: TextFormField(
                                  onChanged: (value) {
                                    providerValue.getCnfPassword(value);
                                  },
                                  obscureText: !providerValue.showCnfPass,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  keyboardType: TextInputType.visiblePassword,
                                  decoration: textFormDecorationCnfPassword(providerValue)))
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Consumer2<RegisterProvider,TimerProvider>(
                            builder: (context, providerValue,timerProvider, child) {
                              return ElevatedButton(
                                  onPressed: () async{
                                    FocusScope.of(context).unfocus();
                                    await providerValue.getRegisterInfo();
                                    bool? status = providerValue.requestStatus;
                                    if(status ?? false){
                                      timerProvider.startTimer();
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OTPVerification(),));
                                    }else{
                                      flutterToast(providerValue.errorMessage?.first);
                                    }
                                  },
                                  style: buttonStyle(),
                                  child: const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ));
                            }
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          child: RichText(
                            text: TextSpan(
                                text: "Already have an account?",
                                style: TextStyle(
                                    color: hexToColor(whiteColor),
                                    fontSize: 18,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500),
                                children: [
                                  TextSpan(
                                      text: " Login",
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
                                  builder: (context) => const LoginPage(),
                                ));
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
      ),
    );
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

  buttonStyle() {
    return ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
            hexToColor(redColor)),
        shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(20))));
  }
}
