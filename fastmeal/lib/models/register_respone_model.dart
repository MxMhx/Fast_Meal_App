// To parse this JSON data, do
//
//     final registerResponse = registerResponseFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

RegisterResponse? registerResponseFromJson(String str) => RegisterResponse.fromJson(json.decode(str));

String registerResponseToJson(RegisterResponse? data) => json.encode(data!.toJson());

class RegisterResponse {
    RegisterResponse({
        required this.message,
        required this.data,
    });

    String? message;
    Data? data;

    factory RegisterResponse.fromJson(Map<String, dynamic> json) => RegisterResponse(
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
        required this.storecode,
        required this.date,
        required this.id,
    });

    String? username;
    String? email;
    String? storecode;
    String? date;
    String? id;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        username: json["username"],
        email: json["email"],
        storecode: json["storecode"],
        date: json["date"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "storecode": storecode,
        "date": date,
        "id": id,
    };
}
