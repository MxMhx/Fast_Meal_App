// To parse this JSON data, do
//
//     final registerRequest = registerRequestFromJson(jsonString);

import 'dart:convert';

RegisterRequest? registerRequestFromJson(String str) =>
    RegisterRequest.fromJson(json.decode(str));

String registerRequestToJson(RegisterRequest? data) =>
    json.encode(data!.toJson());

class RegisterRequest {
  RegisterRequest({
    required this.username,
    required this.storecode,
    required this.email,
    required this.password,
  });

  String? username;
  String? storecode;
  String? email;
  String? password;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        username: json["username"],
        storecode: json["storecode"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "storecode": storecode,
        "email": email,
        "password": password,
      };
}
