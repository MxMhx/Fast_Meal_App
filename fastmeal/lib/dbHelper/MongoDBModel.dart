// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome? welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome? data) => json.encode(data!.toJson());

class Welcome {
    Welcome({
        required this.id,
        required this.username,
        required this.email,
        required this.password,
    });

    String? id;
    String? username;
    String? email;
    String? password;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["_id"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": email,
        "password": password,
    };
}