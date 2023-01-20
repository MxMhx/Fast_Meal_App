// To parse this JSON data, do
//
//     final orderModel = orderModelFromJson(jsonString);

import 'dart:convert';

List<OrderModel> orderModelFromJson(String str) => List<OrderModel>.from(json.decode(str).map((x) => OrderModel.fromJson(x)));

String orderModelToJson(List<OrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderModel {
    OrderModel({
        required this.username,
        required this.orderitems,
        required this.totalprice,
        required this.id,
    });

    String username;
    List<Orderitem> orderitems;
    int totalprice;
    String id;

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        username: json["username"],
        orderitems: List<Orderitem>.from(json["orderitems"].map((x) => Orderitem.fromJson(x))),
        totalprice: json["totalprice"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "orderitems": List<dynamic>.from(orderitems.map((x) => x.toJson())),
        "totalprice": totalprice,
        "id": id,
    };
}

class Orderitem {
    Orderitem({
        required this.name,
        required this.price,
        required this.quantity,
    });

    String name;
    int price;
    int quantity;

    factory Orderitem.fromJson(Map<String, dynamic> json) => Orderitem(
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "quantity": quantity,
    };
}
