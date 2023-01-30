import 'package:assignment1/httpFiles/httpDeleteUser.dart';
import 'package:assignment1/json/DeleteUserJson.dart';
import 'package:flutter/material.dart';

import '../httpFiles/httpLogin.dart';
import '../httpFiles/httpRefreshToken.dart';
import '../httpFiles/httpRegister.dart';
import '../httpFiles/httpResendOtp.dart';
import '../httpFiles/httpverifyOtp.dart';
import '../json/LoginJSON.dart';
import '../json/RefreshTokenJSON.dart';
import '../json/RegisterJSON.dart';
import '../json/ResendOtp.dart';
import '../json/verifyOtp.dart';

class HTTPProvider extends ChangeNotifier {

  RegisterJson? registerJson;
  LoginJson? loginJson;
  ResendOtp? resendOtp;
  RefreshToken? refreshToken;
  DeleteUser? deleteUser;

  String? accessToken;
  bool? requestStatus;
  String? statusMessage;
  List<String>? errorMessage;

  VerifyOtp? verifyOtp;
  bool? otpVerificationStatus;
  String? otpVerificationMessage;



  Future<void> getRegisterInfo(email, password, name, cnfPassword, phoneNo) async {
    registerJson = await RegisterHttpRemote().getRegisterData(
        email.trim(), name.trim(), password, cnfPassword, phoneNo);

    bool? data = registerJson?.data?.isNotEmpty;
    if (data ?? false) {
      accessToken = registerJson?.data?[0].accessToken;
    }

    requestStatus = registerJson?.status;
    statusMessage = registerJson?.message;
    errorMessage = registerJson?.error;
    notifyListeners();
  }

  Future<void> getLoginInfo(email, password) async {
    loginJson = await LoginHttpRemote().getLoginData(email.trim(), password);

    bool? data = loginJson?.data?.isNotEmpty;
    if (data ?? false) {
      accessToken = loginJson?.data?[0].accessToken;
    }

    requestStatus = loginJson?.status;
    statusMessage = loginJson?.message;
    errorMessage = loginJson?.error;
    notifyListeners();
  }

  Future<void> getverifyOtp(otp1, otp2, otp3, otp4) async {
    if (otp1 != null && otp2 != null && otp3 != null && otp4 != null) {
      verifyOtp = await VerifyOtpHttpRemote().getVerifyOtpData(otp1! + otp2! + otp3! + otp4!, accessToken ?? "");
      otpVerificationStatus = verifyOtp?.status;
      otpVerificationMessage = verifyOtp?.message;

      bool? data = verifyOtp?.data?.isNotEmpty;
      if (data ?? false) {
        verifyOtp?.data?[0].phone;
        verifyOtp?.data?[0].phoneVerifiedAt;
      }
    }
    notifyListeners();
  }

  Future<void> resendOtpFunc() async {
    resendOtp = await ResendOtpHttpRemote().getResendOtpData(accessToken ?? "");
    notifyListeners();
  }

  Future<void> refreshTokenFunction() async {
    refreshToken = await RefreshTokenHttpRemote().getRefreshTokenData(accessToken ?? "");
    accessToken = refreshToken?.data?[0].accessToken;
    notifyListeners();
  }

  Future<void> getLoginProInfo(userId, password) async {
    loginJson = await LoginHttpRemote().getLoginData(userId, password);
    bool? data = loginJson?.data?.isNotEmpty;
    if (data ?? false) {
      accessToken = loginJson?.data?[0].accessToken;
    }
    notifyListeners();
  }

  Future<void> getDeleteUser() async{
    deleteUser = await DeleteUserHttpRemote().deleteUserData(accessToken ?? "");
    notifyListeners();
  }
}
