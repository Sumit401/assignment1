import 'package:assignment1/json/LoginJSON.dart';
import 'package:flutter/material.dart';

import '../httpFiles/httpLogin.dart';

class LoginProviders extends ChangeNotifier {
  String email = "";
  String password = "";
  bool showPass = false;


  LoginJson? loginJson;
  bool? requestStatus;
  String? statusMessage;
  String? accessToken;
  List<String>? errorMessage;

  Future<void> getLoginInfo() async {
    loginJson = await LoginHttpRemote().getLoginData(email, password);

    bool? data = loginJson?.data?.isNotEmpty;
    if (data ?? false) {
      accessToken = loginJson?.data?[0].accessToken;
    }

    requestStatus = loginJson?.status;
    statusMessage = loginJson?.message;
    errorMessage = loginJson?.error;
    notifyListeners();
  }

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
