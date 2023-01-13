import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';

// ignore: must_be_immutable
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