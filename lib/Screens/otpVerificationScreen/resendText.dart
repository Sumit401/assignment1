import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/Httpprovider.dart';
import '../../providers/timer.dart';
import '../../reusableWidgets/createColor.dart';

resendOTPText() {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Consumer2<TimerProvider, HTTPProvider>(
      builder: (context, timerValue, httpProvider, child) {
        if (timerValue.timerData > 0) {
          return timerText(timerValue);
        } else if (timerValue.timerData == 0) {
          httpProvider.resendOtpFunc();
          return otpResentText();
        } else {
          return otpResentText();
        }
      },
    ),
  );
}

timerText(TimerProvider timerValue) {
  return RichText(
    text: TextSpan(
        text: "Resend OTP in ",
        style: TextStyle(
            fontFamily: "Montserrat",
            color: hexToColor(whiteColor),
            fontSize: 18,
            fontWeight: FontWeight.w300),
        children: [
          TextSpan(
              text: "${timerValue.timerData} seconds",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  color: hexToColor(redColor),
                  fontSize: 18,
                  fontWeight: FontWeight.w700))
        ]),
  );
}

otpResentText() {
  return Text("OTP Resent",
      style: TextStyle(
          color: hexToColor(whiteColor),
          fontSize: 18,
          fontWeight: FontWeight.w200));
}
