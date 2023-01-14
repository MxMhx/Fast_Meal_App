import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/button.dart';

class OrderContainer extends StatelessWidget {
  OrderContainer({super.key});

  final List<OrderModel> ordermodel = [
    OrderModel(
        name: 'รรรรร',
        menu: ['กะเพรา', 'แกงกะหรี่'],
        amount: [1, 2],
        note: ['ไข่ดาว', ''],
        price: [50, 60]),
    OrderModel(
        name: 'จุ๊มเหม่ง มีอะไร',
        menu: ['ข้าวผัด'],
        amount: [1],
        note: [''],
        price: [60]),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: ordermodel.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: light_orange,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'ชื่อ ${ordermodel[index].name}',
                              style: bold.copyWith(
                                fontSize: 18,
                                color: black,
                              ),
                            )
                          ],
                        ),
                        //menuOrderList
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                itemCount: ordermodel[index].menu.length,
                                itemBuilder: (context, index2) => Container(
                                  margin: const EdgeInsets.symmetric(vertical: 5),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            ordermodel[index].menu[index2],
                                            style: light.copyWith(
                                              fontSize: 16,
                                              color: black,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            'x${ordermodel[index].amount[index2]}',
                                            style: light.copyWith(
                                              fontSize: 16,
                                              color: black,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: ordermodel[index]
                                                            .note[index2] ==
                                                        ''
                                                    ? 0
                                                    : 10),
                                            decoration: BoxDecoration(
                                                color: orange,
                                                borderRadius:
                                                    BorderRadius.circular(8)),
                                            child: Text(
                                              ordermodel[index].note[index2],
                                              style: bold.copyWith(
                                                fontSize: 16,
                                                color: black,
                                              ),
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '${ordermodel[index].price[index2]}',
                                            style: light.copyWith(
                                              fontSize: 16,
                                              color: black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'รวม : ',
                              style: light.copyWith(
                                fontSize: 16,
                                color: black,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              '',
                              style: light.copyWith(
                                fontSize: 16,
                                color: black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
        ButtonWidget(text: 'ปิดรับออเดอร์', textcolor: white, bordercolor: black, fieldcolor: black, textsize: 20, onTap: () {})
      ],
    );
  }
}

class OrderModel {
  final String name;
  final List<String> menu, note;
  final List<int> price, amount;

  OrderModel(
      {required this.name,
      required this.menu,
      required this.amount,
      required this.note,
      required this.price});
}
