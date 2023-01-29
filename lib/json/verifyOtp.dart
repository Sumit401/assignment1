// To parse this JSON data, do
//
//     final verifyOtp = verifyOtpFromJson(jsonString);

import 'dart:convert';

VerifyOtp verifyOtpFromJson(String str) => VerifyOtp.fromJson(json.decode(str));

String verifyOtpToJson(VerifyOtp data) => json.encode(data.toJson());

class VerifyOtp {
  VerifyOtp({
    this.status,
    this.message,
    this.data,
    this.error,
  });

  bool? status;
  String? message;
  List<Datum>? data;
  List<String>? error;

  factory VerifyOtp.fromJson(Map<String, dynamic> json) => VerifyOtp(
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
    this.phoneVerifiedAt,
  });

  String? phone;
  DateTime? phoneVerifiedAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    phone: json["phone"],
    phoneVerifiedAt: json["phone_verified_at"] == null ? null : DateTime.parse(json["phone_verified_at"]),
  );

  Map<String, dynamic> toJson() => {
    "phone": phone,
    "phone_verified_at": phoneVerifiedAt?.toIso8601String(),
  };
}
