import 'package:fastmeal/models/orderdetailmodel.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/button.dart';
import 'package:fastmeal/services/api_service.dart';
import 'package:provider/provider.dart';
import 'package:fastmeal/provider/detail_provider.dart';

class GetOrderContainer extends StatefulWidget {
  const GetOrderContainer({super.key});

  @override
  State<GetOrderContainer> createState() => _GetOrderContainerState();
}

class _GetOrderContainerState extends State<GetOrderContainer> {
  final getAPI = APIService();
  late Future<List<Orderdetailmodel>> orderDetail;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    orderDetail = getAPI.getOrderDetail();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Orderdetailmodel>>(
      future: orderDetail,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: light_orange,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อ ${snapshot.data[index].shippingAddress.recipientName}',
                      style: light.copyWith(fontSize: 15),
                    ),
                    Container(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data[index].orderItems.length,
                          itemBuilder: (context2, index2) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${snapshot.data[index].orderItems[index2].name}',
                                      style: light.copyWith(fontSize: 15),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'x${snapshot.data[index].orderItems[index2].quantity}',
                                      style: light.copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      '${snapshot.data[index].orderItems[index2].price * snapshot.data[index].orderItems[index2].quantity} บาท',
                                      style: light.copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                    ),
                    Row(
                      children: [
                        Text(
                          'รวม',
                          style: light.copyWith(fontSize: 15),
                        ),
                        const Spacer(),
                        Text(
                          '${snapshot.data[index].totalPrice} บาท',
                          style: light.copyWith(fontSize: 15),
                        )
                      ],
                    ),
                    //remark Buyer
                    Text('หมายเหตุ ${snapshot.data[index].remarkBuyer}',
                        style: light.copyWith(fontSize: 15)),
                    Text(
                        'จัดส่ง : ${snapshot.data[index].shippingAddress.address}',
                        style: light.copyWith(fontSize: 15)),
                    ButtonWidget(
                      text: 'รายละเอียด',
                      textcolor: black,
                      bordercolor: orange,
                      fieldcolor: orange,
                      textsize: 15,
                      onTap: () {
                        debugPrint('${snapshot.data[index].orderStatus}');
                        context
                            .read<DetailProvider>()
                            .chooseorder(snapshot.data[index].orderNumber);
                        Navigator.pushNamed(context, '/detail');
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class CompleteOrderContainer extends StatefulWidget {
  const CompleteOrderContainer({super.key});

  @override
  State<CompleteOrderContainer> createState() => _CompleteOrderContainerState();
}

class _CompleteOrderContainerState extends State<CompleteOrderContainer> {
  final getAPI = APIService();
  late Future<List<Orderdetailmodel>> orderDetail;

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    orderDetail = getAPI.getCompleteOrder();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Orderdetailmodel>>(
      future: orderDetail,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: light_orange,
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อ ${snapshot.data[index].shippingAddress.recipientName}',
                      style: light.copyWith(fontSize: 15),
                    ),
                    Container(
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data[index].orderItems.length,
                          itemBuilder: (context2, index2) {
                            return Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      '${snapshot.data[index].orderItems[index2].name}',
                                      style: light.copyWith(fontSize: 15),
                                    ),
                                    const Spacer(),
                                    Text(
                                      'x${snapshot.data[index].orderItems[index2].quantity}',
                                      style: light.copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Spacer(),
                                    Text(
                                      '${snapshot.data[index].orderItems[index2].price * snapshot.data[index].orderItems[index2].quantity} บาท',
                                      style: light.copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }),
                    ),
                    Row(
                      children: [
                        Text(
                          'รวม',
                          style: light.copyWith(fontSize: 15),
                        ),
                        const Spacer(),
                        Text(
                          '${snapshot.data[index].totalPrice} บาท',
                          style: light.copyWith(fontSize: 15),
                        )
                      ],
                    ),
                    //remark Buyer
                    Text('หมายเหตุ ${snapshot.data[index].remarkBuyer}',
                        style: light.copyWith(fontSize: 15)),
                    Text(
                        'จัดส่ง : ${snapshot.data[index].shippingAddress.address}',
                        style: light.copyWith(fontSize: 15)),
                    ButtonWidget(
                      text: 'รายละเอียด',
                      textcolor: black,
                      bordercolor: orange,
                      fieldcolor: orange,
                      textsize: 15,
                      onTap: () {
                        debugPrint('${snapshot.data[index].orderStatus}');
                        context
                            .read<DetailProvider>()
                            .chooseorder(snapshot.data[index].orderNumber);
                        Navigator.pushNamed(context, '/detail');
                      },
                    ),
                  ],
                ),
              );
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
