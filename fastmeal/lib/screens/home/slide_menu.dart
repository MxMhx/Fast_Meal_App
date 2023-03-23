// ignore_for_file: prefer_const_constructors

import 'package:fastmeal/models/ListMenu.dart';
import 'package:fastmeal/shared/constant.dart';
import 'package:flutter/material.dart';

class SlideMenu extends StatefulWidget {
  const SlideMenu({super.key});

  @override
  State<SlideMenu> createState() => _SlideMenuState();
}

class _SlideMenuState extends State<SlideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 288,
              height: double.infinity,
              color: light_orange,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: orange,
                      child: Icon(color: white, Icons.person),
                    ),
                    title: Text(
                      "ร้านป้าเล็ก",
                      style: light.copyWith(fontSize: 20),
                    ),
                    subtitle: Text(
                      "paleng@gmail.com",
                      style: content,
                    ),
                  ),
                  ...Menu.map((e) => Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: e,
                      )),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Spacer(),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "ออกจากระบบ",
                            style: bold.copyWith(fontSize: 20, color: red),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close_rounded,
                  color: black,
                ),
                iconSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
