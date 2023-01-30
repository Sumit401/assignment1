import 'package:assignment1/Screens/splashScreen/SplashScreen.dart';
import 'package:assignment1/reusableWidgets/flutterToast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/Httpprovider.dart';
import '../../reusableWidgets/alertDialogLoading.dart';
import '../../reusableWidgets/createColor.dart';

deleteUserButton() {
  return Consumer<HTTPProvider>(
    builder: (context, httpProvider, child) {
      return ElevatedButton(
          onPressed: () async {
            alertDialogLoading(context);
            SharedPreferences preferences= await SharedPreferences.getInstance();
            while (true) {
              await httpProvider.getDeleteUser();
              bool? status = httpProvider.deleteUser?.status;
              print(httpProvider.deleteUser?.status);
              if (status ?? false) {
                preferences.clear();
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplashScreen()));
                break;
              } else {
                if (httpProvider.deleteUser?.message == "Token has expired") {
                  await httpProvider.refreshTokenFunction();
                } else if (httpProvider.deleteUser?.message == "Phone not verified") {
                  flutterToast("Your Phone number is not verified");
                  Navigator.pop(context);
                  break;
                }
              }
            }
          },
          style: buttonStyle(),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text("Delete User",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ));
    },
  );
}

buttonStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStatePropertyAll(hexToColor(redColor)),
      shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
}
