// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

Welcome? welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome? data) => json.encode(data!.toJson());

class Welcome {
    Welcome({
        required this.id,
        required this.username,
        required this.code,
    });

    ObjectId id;
    String? username;
    String? code;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        id: json["_id"],
        username: json["username"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "username": username,
        "email": code,
    };
}