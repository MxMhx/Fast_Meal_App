// To parse this JSON data, do
//
//     final ordermodel = ordermodelFromJson(jsonString);

import 'dart:convert';

Ordermodel ordermodelFromJson(String str) => Ordermodel.fromJson(json.decode(str));

String ordermodelToJson(Ordermodel data) => json.encode(data.toJson());

class Ordermodel {
    Ordermodel({
        required this.currentPage,
        required this.data,
        required this.perPage,
        required this.totalPage,
        required this.totalRow,
    });

    int currentPage;
    List<Datum> data;
    int perPage;
    int totalPage;
    int totalRow;

    factory Ordermodel.fromJson(Map<String, dynamic> json) => Ordermodel(
        currentPage: json["currentPage"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        perPage: json["perPage"],
        totalPage: json["totalPage"],
        totalRow: json["totalRow"],
    );

    Map<String, dynamic> toJson() => {
        "currentPage": currentPage,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "perPage": perPage,
        "totalPage": totalPage,
        "totalRow": totalRow,
    };
}

class Datum {
    Datum({
        required this.checkoutAt,
        required this.discountAmount,
        required this.isGift,
        required this.lastUpdatedAt,
        required this.orderNumber,
        required this.orderStatus,
        required this.paidAt,
        required this.paymentMethod,
        required this.paymentStatus,
        required this.remarkBuyer,
        required this.remarkRecipient,
        required this.shipmentDetail,
        required this.shipmentPrice,
        required this.shipmentStatus,
        required this.shippingAddress,
        required this.subtotalPrice,
        required this.totalPrice,
        required this.weight,
    });

    String checkoutAt;
    int discountAmount;
    bool isGift;
    String lastUpdatedAt;
    String orderNumber;
    String orderStatus;
    String paidAt;
    String paymentMethod;
    String paymentStatus;
    String remarkBuyer;
    String remarkRecipient;
    ShipmentDetail shipmentDetail;
    int shipmentPrice;
    String shipmentStatus;
    ShippingAddress shippingAddress;
    int subtotalPrice;
    int totalPrice;
    int weight;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        checkoutAt: json["checkoutAt"],
        discountAmount: json["discountAmount"],
        isGift: json["isGift"],
        lastUpdatedAt: json["lastUpdatedAt"],
        orderNumber: json["orderNumber"],
        orderStatus: json["orderStatus"],
        paidAt: json["paidAt"],
        paymentMethod: json["paymentMethod"],
        paymentStatus: json["paymentStatus"],
        remarkBuyer: json["remarkBuyer"],
        remarkRecipient: json["remarkRecipient"],
        shipmentDetail: ShipmentDetail.fromJson(json["shipmentDetail"]),
        shipmentPrice: json["shipmentPrice"],
        shipmentStatus: json["shipmentStatus"],
        shippingAddress: ShippingAddress.fromJson(json["shippingAddress"]),
        subtotalPrice: json["subtotalPrice"],
        totalPrice: json["totalPrice"],
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "checkoutAt": checkoutAt,
        "discountAmount": discountAmount,
        "isGift": isGift,
        "lastUpdatedAt": lastUpdatedAt,
        "orderNumber": orderNumber,
        "orderStatus": orderStatus,
        "paidAt": paidAt,
        "paymentMethod": paymentMethod,
        "paymentStatus": paymentStatus,
        "remarkBuyer": remarkBuyer,
        "remarkRecipient": remarkRecipient,
        "shipmentDetail": shipmentDetail.toJson(),
        "shipmentPrice": shipmentPrice,
        "shipmentStatus": shipmentStatus,
        "shippingAddress": shippingAddress.toJson(),
        "subtotalPrice": subtotalPrice,
        "totalPrice": totalPrice,
        "weight": weight,
    };
}

class ShipmentDetail {
    ShipmentDetail({
        required this.description,
        required this.isCod,
        required this.name,
        required this.shipmentCompanyId,
        required this.shipmentCompanyNameEn,
        required this.shipmentCompanyNameTh,
        required this.trackingNumber,
        required this.type,
    });

    String description;
    bool isCod;
    String name;
    int shipmentCompanyId;
    String shipmentCompanyNameEn;
    String shipmentCompanyNameTh;
    String trackingNumber;
    String type;

    factory ShipmentDetail.fromJson(Map<String, dynamic> json) => ShipmentDetail(
        description: json["description"],
        isCod: json["isCod"],
        name: json["name"],
        shipmentCompanyId: json["shipmentCompanyId"],
        shipmentCompanyNameEn: json["shipmentCompanyNameEn"],
        shipmentCompanyNameTh: json["shipmentCompanyNameTh"],
        trackingNumber: json["trackingNumber"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
        "isCod": isCod,
        "name": name,
        "shipmentCompanyId": shipmentCompanyId,
        "shipmentCompanyNameEn": shipmentCompanyNameEn,
        "shipmentCompanyNameTh": shipmentCompanyNameTh,
        "trackingNumber": trackingNumber,
        "type": type,
    };
}

class ShippingAddress {
    ShippingAddress({
        required this.address,
        required this.country,
        required this.district,
        required this.email,
        required this.phoneNumber,
        required this.postalCode,
        required this.province,
        required this.recipientName,
        required this.subDistrict,
    });

    String address;
    String country;
    String district;
    String email;
    String phoneNumber;
    String postalCode;
    String province;
    String recipientName;
    String subDistrict;

    factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
        address: json["address"],
        country: json["country"],
        district: json["district"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        postalCode: json["postalCode"],
        province: json["province"],
        recipientName: json["recipientName"],
        subDistrict: json["subDistrict"],
    );

    Map<String, dynamic> toJson() => {
        "address": address,
        "country": country,
        "district": district,
        "email": email,
        "phoneNumber": phoneNumber,
        "postalCode": postalCode,
        "province": province,
        "recipientName": recipientName,
        "subDistrict": subDistrict,
    };
}
