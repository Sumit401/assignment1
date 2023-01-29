
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/registerPageProviders.dart';
import '../../providers/timer.dart';
import '../../reusableWidgets/alertDialogLoading.dart';
import '../../reusableWidgets/createColor.dart';
import '../../reusableWidgets/flutterToast.dart';
import '../otpVerificationScreen/otpVerification.dart';


registerButton(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Consumer2<RegisterProvider,TimerProvider>(
          builder: (context, providerValue,timerProvider, child) {
            return ElevatedButton(
                onPressed: () async{
                  alertDialogLoading(context);
                  FocusScope.of(context).unfocus();
                  await providerValue.getRegisterInfo();
                  bool? status = providerValue.requestStatus;
                  if(status ?? false){
                    timerProvider.startTimer();
                    Navigator.pop(context);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OTPVerification(),));
                  }else{
                    Navigator.pop(context);
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
  );
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