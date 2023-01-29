// To parse this JSON data, do
//
//     final loginJson = loginJsonFromJson(jsonString);

import 'dart:convert';

LoginJson loginJsonFromJson(String str) => LoginJson.fromJson(json.decode(str));

String loginJsonToJson(LoginJson data) => json.encode(data.toJson());

class LoginJson {
  LoginJson({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  bool? status;
  String? message;
  List<String>? error;
  List<Datum>? data;

  factory LoginJson.fromJson(Map<String, dynamic> json) => LoginJson(
    status: json["status"],
    message: json["message"],
    error: json["error"] == null ? [] : List<String>.from(json["error"]!.map((x) => x)),
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "error": error == null ? [] : List<dynamic>.from(error!.map((x) => x)),
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
  };
}
