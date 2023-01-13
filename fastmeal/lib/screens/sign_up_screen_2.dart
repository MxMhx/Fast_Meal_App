// ignore_for_file: unused_import, must_be_immutable

import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/widgets/button.dart';

class SignUpSecondScreen extends StatelessWidget {
  const SignUpSecondScreen({super.key});

  final String name = 'Kantinan';
  final String code = 'A01';

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
                        Navigator.pushNamed(context, '/signup');
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
                      const Spacer(),
                      Text(
                        '2/2',
                        style: bold.copyWith(
                          color: light_orange,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/icons/user.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            name,
                            style: light.copyWith(
                              color: white,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            code,
                            style: light.copyWith(
                              color: white,
                              fontSize: 20,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const InputEmailField(),
                  const InputPasswordlField(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'หากมีบัญชีอยู่แล้ว ',
                        style: light.copyWith(color: white, fontSize: 15),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          'เข้าสู่ระบบ',
                          style: bold.copyWith(
                            color: orange,
                            fontSize: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                  ButtonWidget(
                      text: 'ถัดไป',
                      textcolor: black,
                      bordercolor: orange,
                      fieldcolor: orange,
                      textsize: 20,
                      onTap: () {})
                ],
              ),
            ),
          ),
        ));
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

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
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
