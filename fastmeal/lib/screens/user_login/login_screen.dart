// ignore_for_file: unused_import, must_be_immutable

import 'package:fastmeal/data/user_profile.dart';
import 'package:fastmeal/models/login_request_model.dart';
import 'package:fastmeal/services/api_service.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fastmeal/widgets/button.dart';
import 'package:fastmeal/widgets/textfieldwidget.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  UserProfile userprofile = UserProfile();
  final Future<FirebaseApp> firebase = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: firebase,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Scaffold(
              appBar: AppBar(
                  title: const Text(
                'ERROR',
                style: bold,
              )),
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
                          'เข้าสู่ระบบ',
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
                        Form(
                            key: formKey,
                            child: Column(
                              children: [
                                InputEmailField(data: userprofile),
                                InputPasswordlField(data: userprofile),
                                SizedBox(
                                  height: size.height * 0.25,
                                ),
                                ButtonWidget(
                                    text: 'เข้าสู่ระบบ',
                                    textcolor: black,
                                    bordercolor: orange,
                                    fieldcolor: orange,
                                    textsize: 20,
                                    onTap: () async {
                                      if (formKey.currentState!.validate()) {
                                        formKey.currentState!.save();
                                        try {
                                          await FirebaseAuth.instance
                                              .signInWithEmailAndPassword(
                                            email: userprofile.email.toString(),
                                            password:
                                                userprofile.password.toString(),
                                          )
                                              .then((value) {
                                            formKey.currentState!.reset();
                                            Navigator.popAndPushNamed(
                                                context, '/home');
                                          });
                                        } on FirebaseAuthException catch (e) {
                                          Fluttertoast.showToast(
                                            msg: e.message.toString(),
                                            gravity: ToastGravity.CENTER,
                                          );
                                        }
                                      }
                                    })
                              ],
                            ))
                      ],
                    ),
                  )),
                ));
          }
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        });
  }
}

class InputEmailField extends StatelessWidget {
  InputEmailField({super.key, required this.data});
  UserProfile data = UserProfile();

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
  UserProfile data = UserProfile();

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

//Log out
//auht.sigOut().then((value){
//Navigator.pushNamed(context,'/')})
