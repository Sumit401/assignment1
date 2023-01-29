// To parse this JSON data, do
//
//     final resendOtp = resendOtpFromJson(jsonString);

import 'dart:convert';

ResendOtp resendOtpFromJson(String str) => ResendOtp.fromJson(json.decode(str));

String resendOtpToJson(ResendOtp data) => json.encode(data.toJson());

class ResendOtp {
  ResendOtp({
    this.status,
    this.message,
    this.data,
    this.error,
  });

  bool? status;
  String? message;
  List<Datum>? data;
  List<String>? error;

  factory ResendOtp.fromJson(Map<String, dynamic> json) => ResendOtp(
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
    this.phone,
  });

  String? phone;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
  };
}
