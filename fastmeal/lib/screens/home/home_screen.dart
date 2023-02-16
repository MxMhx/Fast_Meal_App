import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/orderwidget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> icons = [
    Icons.home,
    Icons.search_rounded,
    Icons.person,
    Icons.settings,
  ];

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.menu_rounded,
                        color: black,
                        size: 40,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'ร้านป้าเล็ก',
                      style: light.copyWith(color: black, fontSize: 20),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      width: size.width * 0.13,
                      height: size.height * 0.13,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: black),
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: white,
                          image: DecorationImage(
                              image: AssetImage('assets/icons/user.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
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
                              margin: const EdgeInsets.symmetric(horizontal: 10),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  tabs[index],
                                  style:
                                      light.copyWith(color: black, fontSize: 16),
                                ),
                              )),
                            ),
                          ),
                        );
                      }),
                ),
                OrderContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
