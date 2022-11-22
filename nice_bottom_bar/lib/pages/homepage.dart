// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nice_bottom_bar/utils/bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nice Bottom Bar"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomBar(
        context: context,
        currIdx: 0,
      ),
      body: Center(
        child: Text("Home"),
      ),
    );
  }
}
