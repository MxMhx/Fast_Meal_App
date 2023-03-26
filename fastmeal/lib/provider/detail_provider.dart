import 'package:flutter/material.dart';

class DetailProvider extends ChangeNotifier {
  late String orderNumber;
  DetailProvider() {
    orderNumber = '2023022145129528';
  }
  void chooseorder(String whatorderNumber) {
    orderNumber = whatorderNumber;
    notifyListeners();
  }

  get getOrderNumber => orderNumber;
}
