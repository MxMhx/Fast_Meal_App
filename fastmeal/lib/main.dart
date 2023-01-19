import 'package:fastmeal/dbHelper/mongodb.dart';
import 'package:fastmeal/screens/home/home_screen.dart';
import 'package:fastmeal/screens/user_login/login_screen.dart';
import 'package:fastmeal/screens/user_login/sign_up_screen_1.dart';
import 'package:flutter/material.dart';
import 'screens/user_login/welcome_screen.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await MongoDatabase.connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FastMeal Flutter App',
      initialRoute: '/signup',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) =>  SignUpFirstScreen(),
        '/home' : (context) => HomeScreen(),
      },
    );
  }
}
