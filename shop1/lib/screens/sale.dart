// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shop1/customwidgets/saleCell.dart';

class Sale extends StatefulWidget {
  const Sale({super.key});

  @override
  State<Sale> createState() => _SaleState();
}

class _SaleState extends State<Sale> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Sale",
          style: TextStyle(color: Colors.black),
        ),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SaleCell(prodname: "Marc Jacobs", price: "\$1200",),
                SaleCell(prodname: "Leather Belt", price: "\$300",)
              ],
            ),

            Row(
              children: [
                SaleCell(prodname: "Olive Suit", price: "\$15,000",),
                SaleCell(prodname: "Rolex Watch", price: "\$50,000",)
              ],
            ),

            Row(
              children: [
                SaleCell(prodname: "Treamer", price: "\$50",),
                SaleCell(prodname: "Lady Purse", price: "\$500",)
              ],
            ),

            Row(
              children: [
                SaleCell(prodname: "Marc Jacobs", price: "\$1200",),
                SaleCell(prodname: "Leather Belt", price: "\$300",)
              ],
            ),
          ],
        ),
      ),
    );
  }
}