

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/Httpprovider.dart';
import '../../providers/loginPageProvider.dart';
import '../../reusableWidgets/alertDialogLoading.dart';
import '../../reusableWidgets/createColor.dart';
import '../../reusableWidgets/flutterToast.dart';
import '../homeScreen/homepage.dart';


loginButton() {
  return Consumer2<LoginProviders,HTTPProvider>(
    builder: (context, loginProvider,httpProvider, child) {
      return ElevatedButton(
          onPressed: () async{
            FocusScope.of(context).unfocus();
            alertDialogLoading(context);
            SharedPreferences preferences= await SharedPreferences.getInstance();
            await httpProvider.getLoginInfo(loginProvider.email,loginProvider.password);
            bool? status = httpProvider.requestStatus;
            if(status ?? false){
              preferences.setString("userID", loginProvider.email);
              preferences.setString("password", loginProvider.password);
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
            }else{
              Navigator.pop(context);
              flutterToast(httpProvider.statusMessage);
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
