import 'package:fastmeal/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FastMeal Flutter App',
      initialRoute: '/login',
      routes: {'/': (context) => const WelcomeScreen(),
      '/login':(context) =>  LoginScreen()},
    );
  }
}
