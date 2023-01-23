import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/button.dart';
import 'package:fastmeal/services/api_service.dart';

class OrderContainer extends StatefulWidget {
  OrderContainer({super.key});

  @override
  State<OrderContainer> createState() => _OrderContainerState();
}

class _OrderContainerState extends State<OrderContainer> {

  final getorder = APIService();

  @override
  void initState() {
    super.initState();
    getorder.getOrder();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getorder.getOrder(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          var result = snapshot.data;
          return Column();
        }
        return CircularProgressIndicator();
      },
    );
  }
}
