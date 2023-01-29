
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/loginPageProvider.dart';
import '../../reusableWidgets/alertDialogLoading.dart';
import '../../reusableWidgets/createColor.dart';
import '../../reusableWidgets/flutterToast.dart';
import '../homeScreen/homepage.dart';


loginButton() {
  return Consumer<LoginProviders>(
    builder: (context, loginProvider, child) {
      return ElevatedButton(
          onPressed: () async{
            alertDialogLoading(context);
            FocusScope.of(context).unfocus();
            await loginProvider.getLoginInfo();
            bool? status = loginProvider.requestStatus;
            if(status ?? false){
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
            }else{
              Navigator.pop(context);
              flutterToast(loginProvider.statusMessage);
            }
          },
          style: buttonStyle(),
          child: const Text(
            "Login",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold),
          ));
    },
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
