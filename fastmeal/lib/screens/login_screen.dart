// ignore_for_file: unused_import, must_be_immutable

import 'package:fastmeal/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/widgets/button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: white,
                  size: 30,
                )),
            Text(
              'เข้าสู่ระบบ',
              style: bold.copyWith(
                color: white,
                fontSize: 30,
                height: 3,
              ),
            ),
            Text(
              'Fast Meal',
              style: bold.copyWith(
                color: light_orange,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            Column(
              children: [InputTextField(hinttext: 'Email', icon: Icons.person)],
            ),
            const Spacer(),
            ButtonWidget(
                text: 'เข้าสู่ระบบ',
                textcolor: black,
                bordercolor: orange,
                fieldcolor: orange,
                textsize: 20,
                route: '/')
          ],
        ),
      )),
    );
  }
}

class InputTextField extends StatelessWidget {
  String? hinttext;
  IconData icon;
  InputTextField({
    Key? key,
    required this.hinttext,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: const TextField(
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: black,
          ),
          hintText: "Email",
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  TextFieldContainer({super.key, required this.child});

  Widget child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: ilght_grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}
