// ignore_for_file: unused_import, must_be_immutable

import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({
    super.key,
    required this.text,
    required this.textcolor,
    required this.bordercolor,
    required this.fieldcolor,
    required this.textsize,
    required this.onTap,
  });

  String text;
  void Function() onTap;
  Color? fieldcolor, textcolor;
  Color bordercolor;
  double? textsize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: fieldcolor,
            border: Border.all(color: bordercolor, width: 2)),
        child: Center(
            child: Text(text,
                style: bold.copyWith(color: textcolor, fontSize: textsize))),
      ),
    );
  }
}
