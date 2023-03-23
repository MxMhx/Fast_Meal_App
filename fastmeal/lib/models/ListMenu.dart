import 'package:flutter/material.dart';
import '../shared/constant.dart';

List<ListTile> Menu = [
  ListTile(
    onTap: () {},
    leading: SizedBox(
      height: 54,
      width: 34,
      child: Icon(
        Icons.create_rounded,
        color: black,
      ),
    ),
    title: Text(
      "แก้ไขโปรไฟล์",
      style: bold.copyWith(fontSize: 20),
    ),
  ),
  ListTile(
    onTap: () {},
    leading: SizedBox(
      height: 54,
      width: 34,
      child: Icon(
        Icons.settings,
        color: black,
      ),
    ),
    title: Text(
      "การตั้งค่า",
      style: bold.copyWith(fontSize: 20),
    ),
  ),
  ListTile(
    onTap: () {},
    leading: SizedBox(
      height: 54,
      width: 34,
      child: Icon(
        Icons.notifications_active,
        color: black,
      ),
    ),
    title: Text(
      "การแจ้งเตือน",
      style: bold.copyWith(fontSize: 20),
    ),
  ),
];
