// ignore_for_file: unused_import, must_be_immutable

import 'package:fastmeal/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/widgets/button.dart';
import 'package:fastmeal/data/profile.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  const InputEmailField(),
                  InputPasswordlField(),
                ],
              ),
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

class InputEmailField extends StatelessWidget {
  const InputEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: const TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: black,
          ),
          hintText: 'Email',
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class InputPasswordlField extends StatefulWidget {
  const InputPasswordlField({super.key});

  @override
  State<InputPasswordlField> createState() => _InputPasswordlFieldState();
}

class _InputPasswordlFieldState extends State<InputPasswordlField> {
  
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = true;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: black,
          ),
          hintText: 'password',
          suffixIcon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: black,
            onPressed: null,
          ),
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
