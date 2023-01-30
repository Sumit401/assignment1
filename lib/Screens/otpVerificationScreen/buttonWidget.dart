
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/Httpprovider.dart';
import '../../providers/registerPageProviders.dart';
import '../../reusableWidgets/alertDialogLoading.dart';
import '../../reusableWidgets/createColor.dart';
import '../../reusableWidgets/flutterToast.dart';
import '../homeScreen/homepage.dart';

verifyOtpButton() {
  return Consumer2<HTTPProvider,RegisterProvider>(
    builder: (context, httpProvider,registerProvider, child) {
      return ElevatedButton(
          onPressed: () async {
            alertDialogLoading(context);
            FocusScope.of(context).unfocus();
            SharedPreferences preferences = await SharedPreferences.getInstance();
            while (true) {
              await httpProvider.getverifyOtp(registerProvider.otp1,registerProvider.otp2,registerProvider.otp3,registerProvider.otp4);
              bool? status = httpProvider.otpVerificationStatus;
              if (status ?? false) {
                preferences.setString("userID", registerProvider.email);
                preferences.setString("password", registerProvider.password);
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
                break;
              } else {
                if (httpProvider.otpVerificationMessage == "Bad Request") {
                  flutterToast("Invalid OTP");
                  Navigator.pop(context);
                  break;
                } else if (httpProvider.otpVerificationMessage == "Token has expired") {
                  await httpProvider.refreshTokenFunction();
                }
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
