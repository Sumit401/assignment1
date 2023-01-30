
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../providers/Httpprovider.dart';
import '../../reusableWidgets/alertDialogLoading.dart';
import '../../reusableWidgets/createColor.dart';
import '../homeScreen/homepage.dart';
import '../loginScreen/loginPage.dart';

getStartedButton(context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Consumer<HTTPProvider>(
      builder: (context, httpProvider, child) {
        return ElevatedButton(
          onPressed: () async {
            alertDialogLoading(context);
            SharedPreferences preferences =
                await SharedPreferences.getInstance();
            var userID = preferences.getString("userID");
            var password = preferences.getString("password");

            print(userID);
            print(password);

            if (userID.toString() == "null" && password.toString() == "null") {
              Navigator.pop(context);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            } else {
              await httpProvider.getLoginProInfo(userID, password);
              if (httpProvider.loginJson?.status == true) {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
              } else {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              }
            }
          },
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(hexToColor(redColor))),
          child: const Text("\t\t\t\t\t\tGet Started\t\t\t\t\t\t",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        );
      },
    ),
  );
}
