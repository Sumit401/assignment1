// To parse this JSON data, do
//
//     final deleteUser = deleteUserFromJson(jsonString);

import 'dart:convert';

DeleteUser deleteUserFromJson(String str) => DeleteUser.fromJson(json.decode(str));

String deleteUserToJson(DeleteUser data) => json.encode(data.toJson());

class DeleteUser {
  DeleteUser({
    this.status,
    this.message,
    this.data,
    this.error,
  });

  bool? status;
  String? message;
  List<dynamic>? data;
  List<String>? error;

  factory DeleteUser.fromJson(Map<String, dynamic> json) => DeleteUser(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
    error: json["error"] == null ? [] : List<String>.from(json["error"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    "error": error == null ? [] : List<dynamic>.from(error!.map((x) => x)),
  };
}
