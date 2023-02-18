import 'package:fastmeal/models/orderdetailmodel.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/models/ordermodel.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/button.dart';
import 'package:fastmeal/services/api_service.dart';

class GetOrderContainer extends StatefulWidget {
  GetOrderContainer({super.key});

  @override
  State<GetOrderContainer> createState() => _GetOrderContainerState();
}

class _GetOrderContainerState extends State<GetOrderContainer> {
  final getAPI = APIService();
  late Future<Orderdetailmodel?> orderDetail;
  late Future<Ordermodel?> order;

  @override
  void initState() {
    super.initState();
    order = getAPI.getOrder();
    getAPI.getOrderDetail();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Ordermodel?>(
      future: order,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data.data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(top: 12),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(color: light_orange,borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อ ${snapshot.data.data[index].shipmentDetail.name}',
                      style: light.copyWith(fontSize: 15),
                    ),
                    Text(
                      'เมนูที่สั่ง',
                      style: light.copyWith(fontSize: 15),
                    ),
                    Row(
                      children: [
                        Text(
                          'รวม',
                          style: light.copyWith(fontSize: 15),
                        ),
                        Spacer(),
                        Text(
                          '${snapshot.data.data[index].totalPrice.toString()}',
                          style: light.copyWith(fontSize: 15),
                        )
                      ],
                    ),
                    //remark Buyer
                    Text('หมายเหตุ ${snapshot.data.data[index].remarkBuyer}', style: light.copyWith(fontSize: 15)),
                    Text('จัดส่ง : ', style: light.copyWith(fontSize: 15)),
                  ],
                ),
              );
            },
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}
