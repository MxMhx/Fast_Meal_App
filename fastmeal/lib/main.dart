import 'package:fastmeal/screens/get_order_screen.dart';
import 'package:fastmeal/screens/login_screen.dart';
import 'package:fastmeal/screens/sign_up_screen_1.dart';
import 'package:fastmeal/screens/sign_up_screen_2.dart';
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
      initialRoute: '/getorder',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => const SignUpFirstScreen(),
        '/signups' : (context) => SignUpSecondScreen(),
        '/getorder' : (context) => GetOrderScreen(),
      },
    );
  }
}
