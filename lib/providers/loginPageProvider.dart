import 'package:flutter/material.dart';

class LoginProviders extends ChangeNotifier {
  String email = "";
  String password = "";
  bool showPass = false;

  void getEmail(value) {
    email = value;
    notifyListeners();
  }

  void getPassword(value) {
    password = value;
    notifyListeners();
  }

  void showPassword() {
    if (showPass == false) {
      showPass = true;
    } else {
      showPass = false;
    }
    notifyListeners();
  }
}
