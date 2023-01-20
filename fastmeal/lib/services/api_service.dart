import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fastmeal/services/ordermodel.dart';

class APIService {
  late List<OrderModel> _dataFromAPI;

  Future<void> getOrder() async{
    var url = Uri(scheme: 'https',host: '63cad10a4f53a004202b9d38.mockapi.io',path: '/myshop/orders/testorder');
    var response = await http.get(url);
    setState((){
      _dataFromAPI = orderModelFromJson(response.body); //JSON to Dart object
    });
  }
}
