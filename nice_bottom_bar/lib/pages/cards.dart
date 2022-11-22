import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nice_bottom_bar/utils/bottom_bar.dart';

class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nice Bottom Bar"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomBar(
        context: context,
        currIdx: 1,
      ),
      body: Center(
        child: Text("Cards"),
      ),
    );
  }
}
