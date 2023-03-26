import 'dart:convert';

import 'package:fastmeal/models/orderdetailmodel.dart';
import 'package:http/http.dart' as http;
import 'package:fastmeal/models/ordermodel.dart';

class APIService {
  //Get Number of get all order
  Future<List<String>?> getOrderNumber() async {
    List<String> orderNumberList = [];
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
      for (var i = 0; i < dataOrder.data.length; i++) {
        orderNumberList.add(dataOrder.data[i].orderNumber);
      }
      return orderNumberList;
    }
    return null;
  }

  Future<Orderdetailmodel> getOrder(String orderNumber) async {
    Orderdetailmodel dataOrder;
    //https://developers-oaplus.line.biz/myshop/v1/orders
    var url = Uri(
      scheme: 'https',
      host: 'developers-oaplus.line.biz',
      path: '/myshop/v1/orders/$orderNumber',
    );
    var response = await http.get(url, headers: {
      "X-API-KEY": "MTE3NDliZmMtZjYwMC00MTRmLWFiYzMtMzI2MzljNWNkNGU3"
    });
    dataOrder = orderdetailmodelFromJson(response.body);
    return dataOrder;
  }

  Future<List<Orderdetailmodel>> getOrderDetail() async {
    List<String>? orderNumberList = await getOrderNumber();
    List<Orderdetailmodel> dataDetail = [];
    Orderdetailmodel tempdataDetail;
    for (var i = 0; i < orderNumberList!.length; i++) {
      //https://developers-oaplus.line.biz/myshop/v1/orders/{orderNo}
      var url = Uri(
        scheme: 'https',
        host: 'developers-oaplus.line.biz',
        path: '/myshop/v1/orders/${orderNumberList[i]}',
      );
      var response = await http.get(url, headers: {
        "X-API-KEY": "MTE3NDliZmMtZjYwMC00MTRmLWFiYzMtMzI2MzljNWNkNGU3"
      });
      tempdataDetail = orderdetailmodelFromJson(response.body);
      if (tempdataDetail.orderStatus == "FINALIZED" &&
          (tempdataDetail.paymentStatus == "PENDING" ||
              tempdataDetail.shipmentStatus == "SHIPMENT_READY")) {
        dataDetail.add(tempdataDetail);
      }
    }
    return dataDetail;
  }

  Future<List<Orderdetailmodel>> getCompleteOrder() async {
    List<String>? orderNumberList = await getOrderNumber();
    List<Orderdetailmodel> dataDetail = [];
    Orderdetailmodel tempdataDetail;
    for (var i = 0; i < orderNumberList!.length; i++) {
      //https://developers-oaplus.line.biz/myshop/v1/orders/{orderNo}
      var url = Uri(
        scheme: 'https',
        host: 'developers-oaplus.line.biz',
        path: '/myshop/v1/orders/${orderNumberList[i]}',
      );
      var response = await http.get(url, headers: {
        "X-API-KEY": "MTE3NDliZmMtZjYwMC00MTRmLWFiYzMtMzI2MzljNWNkNGU3"
      });
      tempdataDetail = orderdetailmodelFromJson(response.body);
      if (tempdataDetail.orderStatus == "COMPLETED" &&
          tempdataDetail.paymentStatus == "PAID" &&
          tempdataDetail.shipmentStatus == "SHIPPED_ALL") {
        dataDetail.add(tempdataDetail);
      }
    }
    return dataDetail;
  }

  Future<void> markAsShip(String orderNumber) async {
    //https://developers-oaplus.line.biz/myshop/v1/orders/{orderNo}/mark-as-ship
    var url = Uri(
      scheme: 'https',
      host: 'developers-oaplus.line.biz',
      path: '/myshop/v1/orders/$orderNumber/mark-as-ship',
    );
    var response = await http.post(
      url,
      headers: {
        "X-API-KEY": "MTE3NDliZmMtZjYwMC00MTRmLWFiYzMtMzI2MzljNWNkNGU3"
      },
      body: jsonEncode(<String, String>{'shipmentStatus': 'SHIPPED_ALL'}),
    );
  }

  Future<void> markAsPaid(String orderNumber) async {
    //https://developers-oaplus.line.biz/myshop/v1/orders/{orderNo}/mark-as-paid
    var url = Uri(
      scheme: 'https',
      host: 'developers-oaplus.line.biz',
      path: '/myshop/v1/orders/$orderNumber/mark-as-paid',
    );
    var response = await http.post(
      url,
      headers: {
        "X-API-KEY": "MTE3NDliZmMtZjYwMC00MTRmLWFiYzMtMzI2MzljNWNkNGU3"
      },
      body: jsonEncode(<String, String>{'paymentStatus': 'PAID'}),
    );
  }
}
