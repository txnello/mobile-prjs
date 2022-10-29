import 'package:flutter/material.dart';
import 'package:tomato_sauce/pages/authetication/login.dart';
import 'package:tomato_sauce/pages/authetication/reset_password.dart';
import 'package:tomato_sauce/pages/authetication/signup.dart';
import 'package:tomato_sauce/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/home': (context) => const HomePage(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/resetPassword': (context) => const ResetPassword(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
      ),
      home: const Login(),
    );
  }
}
