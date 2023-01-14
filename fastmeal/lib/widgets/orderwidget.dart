import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/button.dart';

class OrderContainer extends StatelessWidget {
  OrderContainer({super.key});

  List<String> menus = ['krapraw', 'tto'];

  List<String> amount = ['1', '2'];
  List<String> prices = ['50 Baht', '60 Baht'];
  List<String> notes = ['eggs', 'more'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
            itemCount: menus.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: orange,
                ),
              );
            }),
      ],
    );
  }
}

class menuOrderList extends StatelessWidget {
  menuOrderList({
    super.key,
    required this.menu,
    required this.amount,
    required this.price,
    required this.note,
  });

  String menu, amount, price, note;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(menu),
            Text(amount),
          ],
        ),
        Row(
          children: [
            Text(note),
            Text(price),
          ],
        )
      ],
    );
  }
}
