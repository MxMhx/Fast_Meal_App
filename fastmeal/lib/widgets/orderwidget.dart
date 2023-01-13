import 'package:flutter/material.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:fastmeal/widgets/button.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration:
          BoxDecoration(color: light_orange, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'name',
                  style: bold.copyWith(
                    color: black,
                    fontSize: 20,
                  ),
                )
              ],
            ),
            menuOrderList(),
            Row(
              children: [
                Text('รวม'),
                Text('150 Bath'),
              ],
            ),
            Text('หมายเหตุ'),
            Text('จัดส่งแผนก ISO'),
            ButtonWidget(
                text: 'รับออเดอร์',
                textcolor: black,
                bordercolor: orange,
                fieldcolor: orange,
                textsize: 18,
                onTap: () {})
          ],
        ),
      ),
    );
  }
}

class menuOrderList extends StatelessWidget {
  const menuOrderList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('krapraw'),
            Text('x1'),
          ],
        ),
        Row(
          children: [
            Text('eggs'),
            Text('50 Bath'),
          ],
        )
      ],
    );
  }
}
