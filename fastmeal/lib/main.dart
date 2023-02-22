import 'package:fastmeal/provider/DetailProvider.dart';
import 'package:fastmeal/screens/home/detail_screen.dart';
import 'package:fastmeal/screens/home/home_screen.dart';
import 'package:fastmeal/screens/user_login/login_screen.dart';
import 'package:fastmeal/screens/user_login/sign_up_screen_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/user_login/welcome_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DetailProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FastMeal Flutter App',
        initialRoute: '/home',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/login': (context) => LoginScreen(),
          '/signup': (context) =>  SignUpFirstScreen(),
          '/home' : (context) => HomeScreen(),
          '/detail' : (context) => DetailScreen(),
        },
      ),
    );
  }
}
