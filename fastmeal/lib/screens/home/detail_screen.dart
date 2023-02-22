import 'package:fastmeal/widgets/detailwidget.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<String> tabs = [
    'รายละเอียด',
    'การชำระเงิน',
    'การจัดส่ง',
  ];

  List<Widget> tabs_widget = [
    detailWidget(),
    paidWidget(),
    shipmentWidget(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: orange,
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: size.height * 0.1,
                margin: EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ชื่อผู้สั่ง',
                      style: bold.copyWith(fontSize: 23),
                    ),
                    Text(
                      'นายกันตินันท์ บุญชาลี',
                      style: light.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: light_orange,
                          borderRadius: BorderRadius.circular(7)),
                      margin: const EdgeInsets.symmetric(vertical: 30),
                      height: 50,
                      width: size.width * 0.9,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: tabs.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                currentIndex = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                width: ((size.width * 0.9) / 3) - 10,
                                decoration: BoxDecoration(
                                  color: currentIndex == index
                                      ? orange
                                      : white.withOpacity(0),
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      tabs[index],
                                      style: light.copyWith(
                                          color: black, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    tabs_widget[currentIndex],
                  ],
                ),
              )
            ],
          )),
    );
  }
}
