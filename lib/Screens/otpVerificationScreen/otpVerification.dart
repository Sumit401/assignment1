import 'package:flutter/material.dart';

import '../../reusableWidgets/createColor.dart';
import 'buttonWidget.dart';
import 'resendText.dart';
import 'textFieldWidgets.dart';
import 'textWidgets.dart';

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
                  headingText(),
                  subHeadingText(),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      otpTextField(context, 1),
                      otpTextField(context, 2),
                      otpTextField(context, 3),
                      otpTextField(context, 4),
                    ],
                  ),
                  resendOTPText(),
                ],
              ),
              Column(
                children: [
                  verifyOtpButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
