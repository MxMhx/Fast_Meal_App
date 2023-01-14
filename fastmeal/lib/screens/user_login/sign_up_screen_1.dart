// ignore_for_file: unused_import, must_be_immutable

import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/textfieldwidget.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/widgets/button.dart';

class SignUpFirstScreen extends StatelessWidget {
  const SignUpFirstScreen({super.key});

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
                    const Spacer(),
                    Text(
                      '1/2',
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
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: size.width * 0.45,
                        padding: const EdgeInsets.all(10.0),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: orange,
                        ),
                        child: Center(
                          child: Text(
                            'แก้ไขรูปโปรไฟล์',
                            style: light.copyWith(
                              color: black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldContainer(
                  child: const TextField(
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.edit,
                        color: black,
                      ),
                      hintText: 'ชื่อผู้ใช้',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextFieldContainer(
                    child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.store,
                      color: black,
                    ),
                    hintText: 'รหัสร้านค้า',
                    border: InputBorder.none,
                  ),
                )),
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
                    onTap: () {
                      Navigator.pushNamed(context, '/signups');
                    })
              ],
            ),
          )),
        ));
  }
}
