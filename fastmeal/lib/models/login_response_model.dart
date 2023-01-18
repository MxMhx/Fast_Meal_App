// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse? data) => json.encode(data!.toJson());

class LoginResponse {
    LoginResponse({
        required this.message,
        required this.data,
    });

    String? message;
    Data? data;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        required this.username,
        required this.email,
        required this.date,
        required this.id,
        required this.token,
    });

    String? username;
    String? email;
    String? date;
    String? id;
    String? token;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        email: json["email"],
        date: json["date"],
        id: json["id"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "date": date,
        "id": id,
        "token": token,
    };
}
