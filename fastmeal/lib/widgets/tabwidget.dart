import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';

class TabWidget extends StatefulWidget {
  TabWidget({super.key});

  get current => null;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  List<String> tabs = [
    'รับออเดอร์',
    'ออเดอร์ที่รับแล้ว',
    'กำลังจัดส่ง',
    'ส่งแล้ว'
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: tabs.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  current = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: current == index ? orange : white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: orange,
                      width: 2,
                    ),
                  ),
                  child: Center(
                      child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      tabs[index],
                      style: light.copyWith(color: black, fontSize: 16),
                    ),
                  )),
                ),
              ),
            );
          }),
    );
  }
}
