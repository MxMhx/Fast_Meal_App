// To parse this JSON data, do
//
//     final orderdetailmodel = orderdetailmodelFromJson(jsonString);

import 'dart:convert';

Orderdetailmodel orderdetailmodelFromJson(String str) => Orderdetailmodel.fromJson(json.decode(str));

String orderdetailmodelToJson(Orderdetailmodel data) => json.encode(data.toJson());

class Orderdetailmodel {
    Orderdetailmodel({
        required this.checkoutAt,
        required this.discountAmount,
        required this.isGift,
        required this.lastUpdatedAt,
        required this.orderItems,
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
    List<OrderItem> orderItems;
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

    factory Orderdetailmodel.fromJson(Map<String, dynamic> json) => Orderdetailmodel(
        checkoutAt: json["checkoutAt"],
        discountAmount: json["discountAmount"],
        isGift: json["isGift"],
        lastUpdatedAt: json["lastUpdatedAt"],
        orderItems: List<OrderItem>.from(json["orderItems"].map((x) => OrderItem.fromJson(x))),
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
        "orderItems": List<dynamic>.from(orderItems.map((x) => x.toJson())),
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

class OrderItem {
    OrderItem({
        required this.barcode,
        required this.discountedPrice,
        required this.imageUrl,
        required this.name,
        required this.price,
        required this.productId,
        required this.quantity,
        required this.sku,
        required this.variantId,
        required this.variants,
        required this.weight,
    });

    String barcode;
    int discountedPrice;
    String imageUrl;
    String name;
    int price;
    int productId;
    int quantity;
    String sku;
    int variantId;
    List<Variant> variants;
    int weight;

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        barcode: json["barcode"],
        discountedPrice: json["discountedPrice"],
        imageUrl: json["imageURL"],
        name: json["name"],
        price: json["price"],
        productId: json["productId"],
        quantity: json["quantity"],
        sku: json["sku"],
        variantId: json["variantId"],
        variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "barcode": barcode,
        "discountedPrice": discountedPrice,
        "imageURL": imageUrl,
        "name": name,
        "price": price,
        "productId": productId,
        "quantity": quantity,
        "sku": sku,
        "variantId": variantId,
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
        "weight": weight,
    };
}

class Variant {
    Variant({
        required this.name,
        required this.value,
    });

    String name;
    String value;

    factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
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
