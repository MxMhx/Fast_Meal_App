import 'package:fastmeal/models/orderdetailmodel.dart';
import 'package:fastmeal/provider/detail_provider.dart';
import 'package:fastmeal/services/api_service.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailWidget extends StatefulWidget {
  const DetailWidget({super.key});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {
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
                                  const Spacer(),
                                  Text(
                                    'x${snapshot.data.orderItems[index].quantity}',
                                    style: content,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Spacer(),
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
                  const SizedBox(height: 70),
                  Text(
                    'ยืนยันการสั่งเมื่อ: ${snapshot.data.checkoutAt}',
                    style: content.copyWith(color: grey),
                  ),
                  const Divider(
                    color: black,
                  ),
                  Row(children: [
                    const Text(
                      'ยอดรวมทั้งสิ้น',
                      style: content,
                    ),
                    const Spacer(),
                    Text(
                      '${snapshot.data.totalPrice} บาท',
                      style: content,
                    ),
                  ]),
                  const Divider(
                    thickness: 1,
                    color: black,
                  ),
                  const Divider(
                    thickness: 5,
                    color: black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  snapshot.data.orderStatus == 'COMPLETED'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "ออร์เดอร์สำเร็จแล้ว",
                              style: bold.copyWith(fontSize: 20, color: green),
                            )
                          ],
                        )
                      : ButtonWidget(
                          text: 'ยกเลิกออเดอร์',
                          textcolor: red,
                          bordercolor: red,
                          fieldcolor: white,
                          textsize: 17,
                          onTap: () {
                            debugPrint(snapshot.data.orderStatus);
                            debugPrint(snapshot.data.orderStatus);
                          }),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}

class PaidWidget extends StatefulWidget {
  const PaidWidget({super.key});

  @override
  State<PaidWidget> createState() => _PaidWidgetState();
}

class _PaidWidgetState extends State<PaidWidget> {
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
                const Text(
                  'เก็บเงินปลายทาง',
                  style: content,
                ),
                const Divider(
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
                const SizedBox(
                  height: 10,
                ),
                snapshot.data.shipmentStatus == 'SHIPPED_ALL'
                    ? ButtonWidget(
                        text: 'ชำระเงินแล้ว',
                        textcolor: white,
                        bordercolor: black,
                        fieldcolor: black,
                        textsize: 16,
                        onTap: () {
                          setState(() {
                            APIService().markAsPaid(snapshot.data.orderNumber);
                          });
                        })
                    : Container()
              ],
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            child: Column(
              children: [
                Image.asset(
                  'assets/pics/money.png',
                  height: size.height * 0.2,
                ),
                Text(
                  'ชำระเงินแล้ว',
                  style: bold.copyWith(color: green, fontSize: 20),
                ),
              ],
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}

class ShipmentWidget extends StatefulWidget {
  const ShipmentWidget({super.key});

  @override
  State<ShipmentWidget> createState() => _ShipmentWidgetState();
}

class _ShipmentWidgetState extends State<ShipmentWidget> {
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
                  const Text(
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
                  const Text(
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
                    'assets/pics/deliverytruck.png',
                    height: size.height * 0.2,
                  ),
                  Text(
                    'จัดส่งสินค้าแล้ว',
                    style: bold.copyWith(color: black, fontSize: 20),
                  ),
                ],
              ),
            );
          }
          return const CircularProgressIndicator();
        });
  }
}
