// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop1/customwidgets/cartCell.dart';
import 'package:shop1/customwidgets/recommendedCell.dart';
import 'package:shop1/screens/sale.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "My cart",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Sale(),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 6, top: 6),
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Icon(CupertinoIcons.pencil_outline)
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CartCell(brand: "Zara", title: "Premium Sports Shoe for Man", subtitle: "Brand: Zara Waist:38 Color: Blu", promotext: "Only 2 items are in stock", price: "\$100",),
            CartCell(brand: "Zara", title: "Premium Sports Shoe for Man", subtitle: "Brand: Zara Waist:38 Color: Blu", promotext: "Only 2 items are in stock", price: "\€243"),
          
            SizedBox(height: 15),

            Text("Recommended for you",
              style: TextStyle(
                fontSize: 24
              ),
            ),

            SizedBox(height: 10),

            Row(
              children: [
                RecommendedCell(title: "Running Shoe",),
                RecommendedCell(title: "White Shoe",),
              ],
            )
          ],
        ),
      ),
    );
  }
}
