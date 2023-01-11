// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, duplicate_import

import 'package:fastmeal/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              height: 60,
            ),
            SizedBox(
              height: 40,
            ),
            Row(children: [
              Spacer(),
              Text(
              'เริ่มต้น\nลงชื่อเข้าใช้',
              style: bold.copyWith(
                color: orange,
                fontSize: 40,
              ),
              textAlign: TextAlign.end,
            ),
            ],),
            Spacer(),
            ButtonWidget(text: 'เข้าสู่ระบบ', textcolor: white, bordercolor: orange, fieldcolor: orange, textsize: 20,),
            ButtonWidget(text: 'ลงชื่อเข้าใช้', textcolor: orange, bordercolor: orange, fieldcolor: white, textsize: 20),
            Row(children: [
              Text('และรอการยืนยันจากระบบการเป็นเจ้าของร้าน', style: light.copyWith(color: black, fontSize: 15),),
              Spacer(),
              Text('ติดต่อ', style: bold.copyWith(color: black,fontSize: 15),)
            ],)
          ],
        ),
      )),
    );
  }
}
