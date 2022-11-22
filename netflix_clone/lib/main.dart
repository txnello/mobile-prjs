import 'package:flutter/material.dart';
import 'package:netflix_clone/pages/choose_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.black),
      home: const ChooseProfile(),
    );
  }
}
