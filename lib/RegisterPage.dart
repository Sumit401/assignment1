import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'createColor.dart';
import 'loginPage.dart';

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
            margin: EdgeInsets.symmetric(vertical: 50),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.name,
                            decoration: textFormDecoration("Name")),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFormDecoration("Email")),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.phone,
                            decoration: textFormDecoration("Phone Number")),
                      ),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                              obscureText: true,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.visiblePassword,
                              decoration: textFormDecoration("Password"))),
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                              obscureText: true,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.visiblePassword,
                              decoration:
                                  textFormDecoration("Confirm Password")))
                    ],
                  ),
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
                          ElevatedButton(
                              onPressed: () => null,
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      hexToColor(redColor)),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)))),
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          child: Text("Already have an account? Login",
                              style: TextStyle(
                                  color: hexToColor(whiteColor),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500)),
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
            fontWeight: FontWeight.normal),
        suffixIcon: value == "Password" || value == "Confirm Password"
            ? Icon(FontAwesomeIcons.eyeSlash,
                color: hexToColor(whiteColor), size: 15)
            : null);
  }
}
