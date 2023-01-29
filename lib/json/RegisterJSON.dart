
import 'dart:convert';

RegisterJson registerJsonFromJson(String str) => RegisterJson.fromJson(json.decode(str));

String registerJsonToJson(RegisterJson data) => json.encode(data.toJson());

class RegisterJson {
  RegisterJson({
    this.status,
    this.message,
    this.error,
    this.data,
  });

  bool? status;
  String? message;
  List<String>? error;
  List<Datum>? data;

  factory RegisterJson.fromJson(Map<String, dynamic> json) => RegisterJson(
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
