import 'package:fastmeal/models/orderdetailmodel.dart';
import 'package:fastmeal/provider/DetailProvider.dart';
import 'package:fastmeal/services/api_service.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class detailWidget extends StatefulWidget {
  const detailWidget({super.key});

  @override
  State<detailWidget> createState() => _detailWidgetState();
}

class _detailWidgetState extends State<detailWidget> {
  @override
  Widget build(BuildContext context) {
    late Future<Orderdetailmodel> order =
        APIService().getOrder(context.watch<DetailProvider>().orderNumber);
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Orderdetailmodel>(
        future: order,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'รายการสินค้า (${snapshot.data.orderItems.length})',
                    style: content,
                  ),
                  Container(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.orderItems.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${snapshot.data.orderItems[index].name}',
                                    style: content,
                                  ),
                                  Spacer(),
                                  Text(
                                    'x${snapshot.data.orderItems[index].quantity}',
                                    style: content,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  Text(
                                    '${snapshot.data.orderItems[index].price * snapshot.data.orderItems[index].quantity} บาท',
                                    style: content,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                  ),
                  Text(
                    '\nหมายเหตุ : ${snapshot.data.remarkBuyer}',
                    style: content,
                  ),
                  SizedBox(height: 70),
                  Text(
                    'ยืนยันการสั่งเมื่อ: ${snapshot.data.checkoutAt}',
                    style: content.copyWith(color: grey),
                  ),
                  Divider(
                    color: black,
                  ),
                  Row(children: [
                    Text(
                      'ยอดรวมทั้งสิ้น',
                      style: content,
                    ),
                    Spacer(),
                    Text(
                      '${snapshot.data.totalPrice} บาท',
                      style: content,
                    ),
                  ]),
                  Divider(
                    thickness: 1,
                    color: black,
                  ),
                  Divider(
                    thickness: 5,
                    color: black,
                  ),
                  ButtonWidget(
                      text: 'ยกเลิกออเดอร์',
                      textcolor: red,
                      bordercolor: red,
                      fieldcolor: white,
                      textsize: 17,
                      onTap: () {})
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}

class paidWidget extends StatefulWidget {
  const paidWidget({super.key});

  @override
  State<paidWidget> createState() => _paidWidgetState();
}

class _paidWidgetState extends State<paidWidget> {
  @override
  Widget build(BuildContext context) {
    late Future<Orderdetailmodel> order =
        APIService().getOrder(context.watch<DetailProvider>().orderNumber);
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Orderdetailmodel>(
      future: order,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data.paymentStatus == 'PENDING') {
          return Container(
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'เก็บเงินปลายทาง',
                  style: content,
                ),
                Divider(
                  thickness: 0.6,
                  color: black,
                ),
                Text(
                  'รอสินค้าถึงลูกค้าและแจ้งการชำระเงิน',
                  style: content.copyWith(color: grey),
                ),
                Text(
                  '${snapshot.data.totalPrice} บาท',
                  style: content,
                ),
                SizedBox(
                  height: 10,
                ),
                snapshot.data.shipmentStatus == 'SHIPPED_ALL'
                    ? ButtonWidget(
                        text: 'ชำระเงินแล้ว',
                        textcolor: white,
                        bordercolor: black,
                        fieldcolor: black,
                        textsize: 16,
                        onTap: () {})
                    : Container()
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            child: Text(
              'ชำระเงินแล้ว',
              style: bold.copyWith(color: grey),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class shipmentWidget extends StatefulWidget {
  const shipmentWidget({super.key});

  @override
  State<shipmentWidget> createState() => _shipmentWidgetState();
}

class _shipmentWidgetState extends State<shipmentWidget> {
  @override
  Widget build(BuildContext context) {
    late Future<Orderdetailmodel> order =
        APIService().getOrder(context.watch<DetailProvider>().orderNumber);
    Size size = MediaQuery.of(context).size;
    return FutureBuilder<Orderdetailmodel>(
        future: order,
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data.shipmentStatus == 'SHIPMENT_READY') {
            return Container(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'การจัดส่ง',
                    style: content,
                  ),
                  Text(
                    '${snapshot.data.shippingAddress.recipientName}\n',
                    style: content,
                  ),
                  Text(
                    '${snapshot.data.shippingAddress.address}',
                    style: content.copyWith(color: grey),
                  ),
                  Text(
                    '${snapshot.data.shippingAddress.phoneNumber}\n',
                    style: content.copyWith(color: grey),
                  ),
                  Text(
                    'ค่าจัดส่ง\n',
                    style: content,
                  ),
                  Text(
                    snapshot.data.shipmentPrice == 0
                        ? 'ฟรี\n'
                        : '${snapshot.data.shipmentPrice} บาท',
                    style: content.copyWith(color: grey),
                  ),
                  ButtonWidget(
                      text: 'จัดส่งสินค้าแล้ว',
                      textcolor: white,
                      bordercolor: black,
                      fieldcolor: black,
                      textsize: 16,
                      onTap: () {
                        setState(() {
                          APIService().markAsShip(snapshot.data.orderNumber);
                        });
                      })
                ],
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              child: Column(
                children: [
                  Image.asset(
                    'assets/icons/meal.png',
                    height: size.height * 0.1,
                  ),
                  Text(
                    'จัดส่งสินค้าแล้ว',
                    style: bold.copyWith(color: red, fontSize: 20),
                  ),
                ],
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
