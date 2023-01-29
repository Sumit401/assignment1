import 'package:assignment1/json/verifyOtp.dart';
import 'package:flutter/material.dart';

import '../httpFiles/httpRegister.dart';
import '../httpFiles/httpverifyOtp.dart';
import '../json/RegisterJSON.dart';

class RegisterProvider extends ChangeNotifier {
  String name = "";
  String email = "";
  String phoneNo = "";
  String password = "";
  String cnfPassword = "";

  bool showPass = false;
  bool showCnfPass = false;

  RegisterJson? registerJson;
  bool? requestStatus;
  String? statusMessage;
  String? accessToken;
  List<String>? errorMessage;

  String? otp1;
  String? otp2;
  String? otp3;
  String? otp4;


  VerifyOtp? verifyOtp;


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

  void getotp1(value){
    otp1=value;
    notifyListeners();
  }
  void getotp2(value){
    otp2=value;
    notifyListeners();
  }
  void getotp3(value){
    otp3=value;
    notifyListeners();
  }
  void getotp4(value){
    otp4=value;
    notifyListeners();
  }


  Future<void> getRegisterInfo() async {
    registerJson = await RegisterHttpRemote().getRegisterData(email, name, password, cnfPassword, phoneNo);

    bool? data = registerJson?.data?.isNotEmpty;
    if (data ?? false) {
      accessToken = registerJson?.data?[0].accessToken;
    }

    requestStatus = registerJson?.status;
    statusMessage = registerJson?.message;
    errorMessage = registerJson?.error;
    notifyListeners();
  }


  Future<void> getverifyOtp() async {
    if(otp1 != null && otp2 != null && otp3 != null && otp4 != null) {
      verifyOtp = await VerifyOtpHttpRemote().getVerifyOtpData(otp1!+otp2!+otp3!+otp4!, accessToken ?? "");
      print(verifyOtp?.status);
    }
    notifyListeners();
  }
}
