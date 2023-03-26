import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/orderwidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tabs = [
    'จัดการออเดอร์',
    'เสร็จสิ้น',
  ];

  List<Widget> tabsWidget = [
    const GetOrderContainer(),
    const CompleteOrderContainer(),
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/menu');
                      },
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
                Container(
                  height: 60,
                  width: double.infinity,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: light_orange,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
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
                              width: (size.width / 2) - 17,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? orange
                                    : white.withOpacity(0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                  child: Container(
                                child: Text(
                                  tabs[index],
                                  style: light.copyWith(
                                      color: black, fontSize: 16),
                                ),
                              )),
                            ),
                          ),
                        );
                      }),
                ),
                tabsWidget[current],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
