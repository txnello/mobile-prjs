// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pastry_shop_ui/customWidgets/circleCake.dart';
import 'package:pastry_shop_ui/customWidgets/homepageCell.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int selectedMenuId = 0;

  onMenuSelect(int id) {
    setState(() {
      selectedMenuId = id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Bekuti",
          style: TextStyle(color: Colors.amber),
        ),
        centerTitle: false,
        actions: [
          Icon(
            CupertinoIcons.cart,
            color: Colors.grey[400],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomepageCell(
                  menuId: selectedMenuId,
                  onMenuSelect: (id) {
                    onMenuSelect(id);
                  }),
              SizedBox(height: 30),
              RichText(
                text: TextSpan(
                  text: "Recently Added",
                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),
                  children: const <TextSpan>[TextSpan(text: " 01.01.2022", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.bold))],
                ),
              ),
              SizedBox(height: 15),
              Column(children: [
                Row(
                  children: [
                    CircleCake(text: "Chocolate cake", bubbleContent: "\$12", radius: 45, imgPath: "assets/images/cake1.jpg", bubbleFontSize: 15),
                    SizedBox(width: 20),
                    CircleCake(text: "Normal cake", bubbleContent: "\$8", radius: 45, imgPath: "assets/images/cake3.jpg", bubbleFontSize: 15),
                    SizedBox(width: 20),
                    CircleCake(text: "123 cake", bubbleContent: "\$10", radius: 45, imgPath: "assets/images/cake4.jpg", bubbleFontSize: 15),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    CircleCake(text: "Cake", bubbleContent: "\$14", radius: 45, imgPath: "assets/images/cake5.jpg", bubbleFontSize: 15),
                    SizedBox(width: 20),
                    CircleCake(text: "ABC cake", bubbleContent: "\$4", radius: 45, imgPath: "assets/images/cake6.jpg", bubbleFontSize: 15),
                    SizedBox(width: 20),
                    CircleCake(text: "Go cake", bubbleContent: "\$12", radius: 45, imgPath: "assets/images/cake7.jpg", bubbleFontSize: 15),
                  ],
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
