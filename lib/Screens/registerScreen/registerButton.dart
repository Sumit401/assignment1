
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/Httpprovider.dart';
import '../../providers/registerPageProviders.dart';
import '../../providers/timer.dart';
import '../../reusableWidgets/alertDialogLoading.dart';
import '../../reusableWidgets/createColor.dart';
import '../../reusableWidgets/flutterToast.dart';
import '../otpVerificationScreen/otpVerification.dart';

registerButton() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Consumer3<RegisterProvider, HTTPProvider, TimerProvider>(builder:
          (context, registerProvider, httpProvider, timerProvider, child) {
        return ElevatedButton(
            onPressed: () async {
              alertDialogLoading(context);
              FocusScope.of(context).unfocus();
              await httpProvider.getRegisterInfo(
                  registerProvider.email,
                  registerProvider.password,
                  registerProvider.name,
                  registerProvider.cnfPassword,
                  registerProvider.phoneNo);
              bool? status = httpProvider.requestStatus;
              if (status ?? false) {
                timerProvider.startTimer();
                Navigator.pop(context);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OTPVerification(),
                    ));
              } else {
                Navigator.pop(context);
                flutterToast(httpProvider.errorMessage?.first);
              }
            },
            style: buttonStyle(),
            child: const Text(
              "Sign Up",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ));
      }),
    ],
  );
}

buttonStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(hexToColor(redColor)),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
}
