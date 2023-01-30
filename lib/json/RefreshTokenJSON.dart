// To parse this JSON data, do
//
//     final refreshToken = refreshTokenFromJson(jsonString);

import 'dart:convert';

RefreshToken refreshTokenFromJson(String str) => RefreshToken.fromJson(json.decode(str));

String refreshTokenToJson(RefreshToken data) => json.encode(data.toJson());

class RefreshToken {
  RefreshToken({
    this.status,
    this.message,
    this.data,
    this.error,
  });

  bool? status;
  String? message;
  List<Datum>? data;
  List<String>? error;

  factory RefreshToken.fromJson(Map<String, dynamic> json) => RefreshToken(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    error: json["error"] == null ? [] : List<String>.from(json["error"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "error": error == null ? [] : List<dynamic>.from(error!.map((x) => x)),
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
