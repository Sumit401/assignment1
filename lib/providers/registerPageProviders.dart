import 'package:flutter/material.dart';

import '../httpFiles/httpRegister.dart';
import '../json/RegisterJSON.dart';

class RegisterProvider extends ChangeNotifier {

  String name = "";
  String email = "";
  String phoneNo = "";
  String password = "";
  String cnfPassword = "";

  bool showPass = false;
  bool showCnfPass = false;

  RegisterJson? register;
  bool? requestStatus;
  String? statusMessage;
  String? accessToken;
  List<String>? errorMessage;


  Future<void> getRegisterInfo() async {

    if(name != "" && email !="" && password != "" && cnfPassword != "" && phoneNo != "") {
      register = await RegisterHttpRemote().getRegisterData(email,name,password,cnfPassword,phoneNo);

      bool? data = register?.data?.isNotEmpty;
      if(data ?? false) {
        accessToken = register?.data?[0].accessToken;
      }

      requestStatus = register?.status;
      statusMessage = register?.message;
      errorMessage = register?.error;
    }
    notifyListeners();
  }


  void getName(value) {
    name = value;
    notifyListeners();
  }

  void getEmail(value) {
    email = value;
    notifyListeners();
  }

  void getPhone(value) {
    phoneNo = value;
    notifyListeners();
  }

  void getPassword(value) {
    password = value;
    notifyListeners();
  }

  void getCnfPassword(value) {
    cnfPassword = value;
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

  void showCnfPassword() {
    if (showCnfPass == false) {
      showCnfPass = true;
    } else {
      showCnfPass = false;
    }
    notifyListeners();
  }
}