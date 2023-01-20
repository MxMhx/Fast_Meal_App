// ignore_for_file: unused_import, must_be_immutable

import 'package:fastmeal/dbHelper/mongodb.dart';
import 'package:fastmeal/data/user_profile.dart';
import 'package:fastmeal/models/login_response_model.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/textfieldwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/widgets/button.dart';
import 'package:fastmeal/dbHelper/MongoDBModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;

class SignUpFirstScreen extends StatefulWidget {
  SignUpFirstScreen({super.key});

  @override
  State<SignUpFirstScreen> createState() => _SignUpFirstScreenState();
}

class _SignUpFirstScreenState extends State<SignUpFirstScreen> {
  final formKey = GlobalKey<FormState>();
  userProfile userprofile = userProfile();

  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  // var usernameController = TextEditingController();
  // var idController = TextEditingController();
  // var emailnameController = TextEditingController();
  // var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                title: Text(
                  "ERROR",
                  style: bold,
                ),
              ),
              body: Center(
                  child: Text(
                '${snapshot.error}',
                style: bold,
              )),
            );
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return Scaffold(
              backgroundColor: black,
              body: SingleChildScrollView(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 40),
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
                        Text(
                          'Fast Meal',
                          style: bold.copyWith(
                            color: light_orange,
                            fontSize: 20,
                          ),
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
                                margin:
                                    const EdgeInsets.symmetric(vertical: 10),
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
                        Form(
                          key: formKey,
                          child: Column(
                            children: [
                              TextFieldContainer(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.edit,
                                      color: black,
                                    ),
                                    hintText: 'ชื่อผู้ใช้',
                                    border: InputBorder.none,
                                  ),
                                  onSaved: (username) {
                                    userprofile.username = username;
                                  },
                                  validator: RequiredValidator(
                                      errorText: "กรุณากรอกชื่อ"),
                                ),
                              ),
                              TextFieldContainer(
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    icon: Icon(
                                      Icons.store,
                                      color: black,
                                    ),
                                    hintText: 'รหัสร้านค้า',
                                    border: InputBorder.none,
                                  ),
                                  onSaved: (storecode) {
                                    userprofile.storecode = storecode;
                                  },
                                  validator: RequiredValidator(
                                      errorText: "กรุณากรอกรหัสร้านค้า"),
                                ),
                              ),
                              InputEmailField(data: userprofile),
                              InputPasswordlField(data: userprofile),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'หากมีบัญชีอยู่แล้ว ',
                                    style: light.copyWith(
                                        color: white, fontSize: 15),
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
                                text: 'ลงชื่อเข้าใช้',
                                textcolor: black,
                                bordercolor: orange,
                                fieldcolor: orange,
                                textsize: 20,
                                onTap: () async {
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState!.save();
                                    try {
                                      await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                        email: userprofile.email.toString(),
                                        password:
                                            userprofile.password.toString(),
                                      )
                                          .then((value) {
                                        formKey.currentState!.reset();
                                        Navigator.pushNamed(context, '/login');
                                      });
                                    } on FirebaseAuthException catch (e) {
                                      print(e.message);
                                      print(e.code);
                                      String message;
                                      if (e.code == 'email-already-in-use') {
                                        message =
                                            'อีเมลนี้ถูกใช้ไปแล้ว กรุณาใช้บัญชีอื่นหรือล็อกอิน';
                                      } else if (e.code == 'weak-password') {
                                        message =
                                            'รหัสผ่านต้องมีความยาว 6 ตัวอักษรขึ้นไป';
                                      } else {
                                        message = e.message.toString();
                                      }
                                      Fluttertoast.showToast(
                                        msg: message,
                                        gravity: ToastGravity.CENTER,
                                      );
                                    }
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }

  // Future<void> _insertData(
  //     String username, String storecode, String email, String password) async {
  //   var _id = M.ObjectId(); //This will use for unique ID
  //   final data = RegisterModel(
  //       username: username,
  //       storecode: storecode,
  //       email: email,
  //       password: password,
  //       id: _id);
  //   var result = await MongoDatabase.insert(data);
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text('Insert ID' + _id.$oid)));
  //   _clearAll();
  // }

  // void _clearAll() {
  //   usernameController.text = '';
  //   idController.text = '';
  //   emailnameController.text = '';
  //   passwordController.text = '';
  // }
}

class InputEmailField extends StatelessWidget {
  InputEmailField({
    super.key,
    required this.data,
  });

  userProfile data = userProfile();
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onSaved: (email) {
          data.email = email;
        },
        validator: MultiValidator([
          RequiredValidator(errorText: "กรุณากรอกอีเมล"),
          EmailValidator(errorText: "รูปแบบอีเมลไม่ถูกต้อง")
        ]),
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
  InputPasswordlField({super.key, required this.data});

  userProfile data = userProfile();

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
        onSaved: (password) {
          widget.data.password = password;
        },
        validator: RequiredValidator(errorText: "กรุณากรอกรหัสผ่าน"),
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
