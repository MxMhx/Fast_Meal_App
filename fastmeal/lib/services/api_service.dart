import 'package:fastmeal/models/orderdetailmodel.dart';
import 'package:fastmeal/widgets/orderwidget.dart';
import 'package:http/http.dart' as http;
import 'package:fastmeal/models/ordermodel.dart';
import 'package:fastmeal/models/allproductmodel.dart';

class APIService {
  //Get Number of get all order
  Future<List<String>?> getOrderNumber() async {
    List<String> order_number_list = [];
    Ordermodel data_Order;
    //https://developers-oaplus.line.biz/myshop/v1/orders
    var url = Uri(
      scheme: 'https',
      host: 'developers-oaplus.line.biz',
      path: '/myshop/v1/orders',
    );
    var response = await http.get(url, headers: {
      "X-API-KEY": "MTE3NDliZmMtZjYwMC00MTRmLWFiYzMtMzI2MzljNWNkNGU3"
    });
    data_Order = ordermodelFromJson(response.body);
    if (response.statusCode == 200) {
      for (var i = 0; i < data_Order.data.length; i++) {
        order_number_list.add(data_Order.data[i].orderNumber);
      }
      return order_number_list;
    }
  }
  
  Future<Ordermodel> getOrder() async {
    Ordermodel data_Order;
    //https://developers-oaplus.line.biz/myshop/v1/orders
    var url = Uri(
      scheme: 'https',
      host: 'developers-oaplus.line.biz',
      path: '/myshop/v1/orders',
    );
    var response = await http.get(url, headers: {
      "X-API-KEY": "MTE3NDliZmMtZjYwMC00MTRmLWFiYzMtMzI2MzljNWNkNGU3"
    });
    data_Order = ordermodelFromJson(response.body);
    return data_Order;
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
      if (tempdataDetail.orderStatus == "FINALIZED" && tempdataDetail.paymentStatus == "PENDING" && tempdataDetail.shipmentStatus == "SHIPMENT_READY"){
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
      if (tempdataDetail.orderStatus == "COMPLETED" && tempdataDetail.paymentStatus == "PAID" && tempdataDetail.shipmentStatus == "SHIPPED_ALL"){
        dataDetail.add(tempdataDetail);
      }
    }
    return dataDetail;
  }
}
