// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

RegisterModel registerModelFromJson(String str) => RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
    RegisterModel({
        required this.username,
        required this.storecode,
        required this.email,
        required this.password,
        required this.id,
    });

    String username;
    String storecode;
    String email;
    String password;
    ObjectId id;

    factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        username: json["username"],
        storecode: json["storecode"],
        email: json["email"],
        password: json["password"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "storecode": storecode,
        "email": email,
        "password": password,
        "id": id,
    };
}
