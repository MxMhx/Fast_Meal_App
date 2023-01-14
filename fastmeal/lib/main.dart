import 'package:fastmeal/screens/home/home_screen.dart';
import 'package:fastmeal/screens/user_login/login_screen.dart';
import 'package:fastmeal/screens/user_login/sign_up_screen_1.dart';
import 'package:fastmeal/screens/user_login/sign_up_screen_2.dart';
import 'package:flutter/material.dart';
import 'screens/user_login/welcome_screen.dart';

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
        '/getorder' : (context) => HomeScreen(),
      },
    );
  }
}
