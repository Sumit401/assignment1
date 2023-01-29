import 'package:assignment1/providers/timer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'createColor.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({Key? key}) : super(key: key);

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: hexToColor(greyColor)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text("Verify Your Number",
                        style: TextStyle(
                            color: hexToColor(whiteColor),
                            fontSize: 30,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text("Enter the OTP received on your number",
                        style: TextStyle(
                            color: hexToColor(whiteColor),
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width / 6,
                          child: TextFormField(
                            onChanged: (value) {
                              FocusScope.of(context).nextFocus();
                            },
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.number,
                              decoration: textFormDecoration())),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width / 6,
                          child: TextFormField(
                              onChanged: (value) {
                                FocusScope.of(context).nextFocus();
                              },
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.number,
                              decoration: textFormDecoration())),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width / 6,
                          child: TextFormField(
                              onChanged: (value) {
                                FocusScope.of(context).nextFocus();
                              },
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.number,
                              decoration: textFormDecoration())),
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: MediaQuery.of(context).size.width / 6,
                          child: TextFormField(
                              onChanged: (value) {
                                FocusScope.of(context).unfocus();
                              },
                              textAlign: TextAlign.center,
                              maxLength: 1,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              keyboardType: TextInputType.number,
                              decoration: textFormDecoration())),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Consumer<TimerProvider>(
                      builder: (context, value, child) {
                        return Text("Resend OTP in ${value.timerData} seconds",
                            style: TextStyle(
                                color: hexToColor(whiteColor),
                                fontSize: 18,
                                fontWeight: FontWeight.w300));
                      },
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                      onPressed: () => null,
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              hexToColor(redColor)),
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(10)))),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0 , horizontal: 50),
                        child: Text(
                          "Verify",
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  textFormDecoration() {
    return InputDecoration(
        fillColor: hexToColor(blackColor),
        filled: true,
        focusedBorder:
        OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)));
  }
}
