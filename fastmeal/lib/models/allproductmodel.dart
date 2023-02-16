// To parse this JSON data, do
//
//     final allProduct = allProductFromJson(jsonString);

import 'dart:convert';

AllProduct allProductFromJson(String str) => AllProduct.fromJson(json.decode(str));

String allProductToJson(AllProduct data) => json.encode(data.toJson());

class AllProduct {
    AllProduct({
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

    factory AllProduct.fromJson(Map<String, dynamic> json) => AllProduct(
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
        required this.brand,
        required this.category,
        required this.categoryId,
        required this.categoryName,
        required this.code,
        required this.description,
        required this.giftGroups,
        required this.giftOption,
        required this.hasOnlyDefaultVariant,
        required this.id,
        required this.imageUrl,
        required this.imageUrls,
        required this.instantDiscount,
        required this.isDisplay,
        required this.name,
        required this.variantOptions,
        required this.variants,
    });

    String brand;
    Category category;
    int categoryId;
    String categoryName;
    String code;
    String description;
    List<Category> giftGroups;
    String giftOption;
    bool hasOnlyDefaultVariant;
    int id;
    String imageUrl;
    List<String> imageUrls;
    int instantDiscount;
    bool isDisplay;
    String name;
    List<VariantOption> variantOptions;
    List<Variant> variants;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        brand: json["brand"],
        category: Category.fromJson(json["category"]),
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        code: json["code"],
        description: json["description"],
        giftGroups: List<Category>.from(json["giftGroups"].map((x) => Category.fromJson(x))),
        giftOption: json["giftOption"],
        hasOnlyDefaultVariant: json["hasOnlyDefaultVariant"],
        id: json["id"],
        imageUrl: json["imageUrl"],
        imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
        instantDiscount: json["instantDiscount"],
        isDisplay: json["isDisplay"],
        name: json["name"],
        variantOptions: List<VariantOption>.from(json["variantOptions"].map((x) => VariantOption.fromJson(x))),
        variants: List<Variant>.from(json["variants"].map((x) => Variant.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "brand": brand,
        "category": category.toJson(),
        "categoryId": categoryId,
        "categoryName": categoryName,
        "code": code,
        "description": description,
        "giftGroups": List<dynamic>.from(giftGroups.map((x) => x.toJson())),
        "giftOption": giftOption,
        "hasOnlyDefaultVariant": hasOnlyDefaultVariant,
        "id": id,
        "imageUrl": imageUrl,
        "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
        "instantDiscount": instantDiscount,
        "isDisplay": isDisplay,
        "name": name,
        "variantOptions": List<dynamic>.from(variantOptions.map((x) => x.toJson())),
        "variants": List<dynamic>.from(variants.map((x) => x.toJson())),
    };
}

class Category {
    Category({
        required this.id,
        required this.nameEn,
        required this.nameTh,
    });

    int id;
    String nameEn;
    String nameTh;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        nameEn: json["nameEn"],
        nameTh: json["nameTh"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nameEn": nameEn,
        "nameTh": nameTh,
    };
}

class VariantOption {
    VariantOption({
        required this.name,
        required this.values,
    });

    String name;
    List<String> values;

    factory VariantOption.fromJson(Map<String, dynamic> json) => VariantOption(
        name: json["name"],
        values: List<String>.from(json["values"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "values": List<dynamic>.from(values.map((x) => x)),
    };
}

class Variant {
    Variant({
        required this.availableNumber,
        required this.barcode,
        required this.discountedPrice,
        required this.id,
        required this.inventoryId,
        required this.onHandNumber,
        required this.options,
        required this.price,
        required this.readyToShipNumber,
        required this.reservedNumber,
        required this.sku,
        required this.weight,
    });

    int availableNumber;
    String barcode;
    int discountedPrice;
    int id;
    int inventoryId;
    int onHandNumber;
    List<Option> options;
    int price;
    int readyToShipNumber;
    int reservedNumber;
    String sku;
    int weight;

    factory Variant.fromJson(Map<String, dynamic> json) => Variant(
        availableNumber: json["availableNumber"],
        barcode: json["barcode"],
        discountedPrice: json["discountedPrice"],
        id: json["id"],
        inventoryId: json["inventoryId"],
        onHandNumber: json["onHandNumber"],
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        price: json["price"],
        readyToShipNumber: json["readyToShipNumber"],
        reservedNumber: json["reservedNumber"],
        sku: json["sku"],
        weight: json["weight"],
    );

    Map<String, dynamic> toJson() => {
        "availableNumber": availableNumber,
        "barcode": barcode,
        "discountedPrice": discountedPrice,
        "id": id,
        "inventoryId": inventoryId,
        "onHandNumber": onHandNumber,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "price": price,
        "readyToShipNumber": readyToShipNumber,
        "reservedNumber": reservedNumber,
        "sku": sku,
        "weight": weight,
    };
}

class Option {
    Option({
        required this.name,
        required this.value,
    });

    String name;
    String value;

    factory Option.fromJson(Map<String, dynamic> json) => Option(
        name: json["name"],
        value: json["value"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
    };
}
