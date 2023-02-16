import 'dart:convert';

import 'package:fastmeal/models/orderdetailmodel.dart';
import 'package:fastmeal/widgets/orderwidget.dart';
import 'package:http/http.dart' as http;
import 'package:fastmeal/models/ordermodel.dart';
import 'package:fastmeal/models/allproductmodel.dart';

class APIService {
  Future<void> getallProduct() async {
    AllProduct dataProduct;
    //https://developers-oaplus.line.biz/myshop/v1/products
    var url = Uri(
        scheme: 'https',
        host: 'developers-oaplus.line.biz',
        path: '/myshop/v1/products');
    var response = await http.get(url, headers: {
      "X-API-KEY": "MTE3NDliZmMtZjYwMC00MTRmLWFiYzMtMzI2MzljNWNkNGU3"
    });
    dataProduct = allProductFromJson(response.body);
    if (response.statusCode == 200) {
      print("Connect Done");
      print(dataProduct.data[0].brand);
    }
  }

  Future <Ordermodel?> getOrder() async {
    Ordermodel dataOrder;
    //https://developers-oaplus.line.biz/myshop/v1/orders
    var url = Uri(
      scheme: 'https',
      host: 'developers-oaplus.line.biz',
      path: '/myshop/v1/orders',
    );
    var response = await http.get(url, headers: {
      "X-API-KEY": "MTE3NDliZmMtZjYwMC00MTRmLWFiYzMtMzI2MzljNWNkNGU3"
    });
    dataOrder = ordermodelFromJson(response.body);
    if (response.statusCode == 200) {
      return dataOrder;
    }
  }

  Future<void> getOrderdetail(String orderNumber) async {
    Orderdetailmodel datadetail;
    //https://developers-oaplus.line.biz/myshop/v1/orders/{orderNo}
    var url = Uri(
      scheme: 'https',
      host: 'developers-oaplus.line.biz',
      path: '/myshop/v1/orders/${orderNumber}',
    );
    var response = await http.get(url, headers: {
      "X-API-KEY": "MTE3NDliZmMtZjYwMC00MTRmLWFiYzMtMzI2MzljNWNkNGU3"
    });
    datadetail = orderdetailmodelFromJson(response.body);
    if (response.statusCode == 200) {
      print("connect detail");
    }
  }
}
