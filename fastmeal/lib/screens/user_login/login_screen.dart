// ignore_for_file: unused_import, must_be_immutable

import 'package:fastmeal/models/login_request_model.dart';
import 'package:fastmeal/services/api_service.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/widgets/button.dart';
import 'package:fastmeal/widgets/textfieldwidget.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isAPIcallProcess = false;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();

  String? email;

  String? password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: black,
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: white,
                      size: 30,
                    )),
                Text(
                  'ลงชื่อเข้าใช้',
                  style: bold.copyWith(
                    color: white,
                    fontSize: 30,
                    height: 3,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      'Fast Meal',
                      style: bold.copyWith(
                        color: light_orange,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                    text: 'เข้าสู่ระบบ',
                    textcolor: black,
                    bordercolor: orange,
                    fieldcolor: orange,
                    textsize: 20,
                    onTap: () {
                    })
              ],
            ),
          )),
        )
    );
  }
}

class InputEmailField extends StatelessWidget {
  InputEmailField({super.key, required this.email});
  String? email;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: const InputDecoration(
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
  InputPasswordlField({super.key, required this.password});
  String? password;

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

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: _obscureText,
        decoration: InputDecoration(
          icon: const Icon(
            Icons.lock,
            color: black,
          ),
          hintText: 'password',
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: black,
            ),
            onPressed: _toggle,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
