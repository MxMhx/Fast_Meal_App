import 'package:fastmeal/widgets/button.dart';
import 'package:fastmeal/widgets/tabwidget.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:provider/provider.dart';

class GetOrderScreen extends StatelessWidget {
  GetOrderScreen({super.key});

  List<IconData> icons = [
    Icons.home,
    Icons.search_rounded,
    Icons.person,
    Icons.settings,
  ];

  @override
  Widget build(BuildContext context) {
    final TabWidget _tabwidget = Provider.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
                  decoration:
                      const BoxDecoration(shape: BoxShape.circle, color: black),
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
              child: TabWidget(),
            ),
            Column(
              children: [
                Container(
                  child: Icon(
                    icons[_tabwidget.current],
                    size: 200,
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}
