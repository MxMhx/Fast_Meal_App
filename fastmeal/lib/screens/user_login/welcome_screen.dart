// ignore_for_file: unused_import

import 'package:fastmeal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/icons/meal.png',
              height: size.height * 0.1,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Row(
              children: [
                const Spacer(),
                Text(
                  'เริ่มต้น\nลงชื่อเข้าใช้',
                  style: bold.copyWith(
                    color: orange,
                    fontSize: 40,
                  ),
                  textAlign: TextAlign.end,
                ),
              ],
            ),
            const Spacer(),
            ButtonWidget(
              text: 'เข้าสู่ระบบ',
              textcolor: white,
              bordercolor: orange,
              fieldcolor: orange,
              textsize: 20,
              onTap: () {
                Navigator.popAndPushNamed(context, '/login');
              },
            ),
            ButtonWidget(
              text: 'ลงชื่อเข้าใช้',
              textcolor: orange,
              bordercolor: orange,
              fieldcolor: white,
              textsize: 20,
              onTap: () {
                Navigator.popAndPushNamed(context, '/signup');
              },
            ),
            Row(
              children: [
                Text(
                  'และรอการยืนยันจากระบบการเป็นเจ้าของร้าน  ',
                  style: light.copyWith(color: black, fontSize: 14),
                ),
                Text(
                  'ติดต่อ',
                  style: bold.copyWith(color: black, fontSize: 15),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
