
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/registerPageProviders.dart';
import '../../reusableWidgets/alertDialogLoading.dart';
import '../../reusableWidgets/createColor.dart';
import '../../reusableWidgets/flutterToast.dart';
import '../homeScreen/homepage.dart';

verifyOtpButton() {
  return Consumer<RegisterProvider>(
    builder: (context, registerProvider, child) {
      return ElevatedButton(
          onPressed: () async {
            alertDialogLoading(context);
            FocusScope.of(context).unfocus();
            await registerProvider.getverifyOtp();
            bool? status = registerProvider.otpVerificationStatus;
            if (status ?? false) {
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
            } else {
              Navigator.pop(context);
              if (registerProvider.otpVerificationMessage == "Bad Request") {
                flutterToast("Invalid OTP");
              } else {
                flutterToast(registerProvider.otpVerificationMessage);
              }
            }
          },
          style: buttonStyle(),
          child: buttonText());
    },
  );
}

buttonText() {
  return const Padding(
    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 50),
    child: Text(
      "Verify",
      style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal),
    ),
  );
}

buttonStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(hexToColor(redColor)),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))));
}
