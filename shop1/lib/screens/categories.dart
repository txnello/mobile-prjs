// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shop1/customwidgets/categoryListCell.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "Choose a Category",
          style: TextStyle(color: Colors.black),
        ),
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CategoryListCell(categoryTitle: "Free Delivery",),
            CategoryListCell(categoryTitle: "Mart",),
            CategoryListCell(categoryTitle: "Boy's Fashion",),
            CategoryListCell(categoryTitle: "Lady's Fashion",),
            CategoryListCell(categoryTitle: "Home & Living",),
            CategoryListCell(categoryTitle: "Gadgets Deals",),
            CategoryListCell(categoryTitle: "Kitchen Deals",),
            CategoryListCell(categoryTitle: "Free Delivery",),
            CategoryListCell(categoryTitle: "Mart",),
            CategoryListCell(categoryTitle: "Boy's Fashion",),
            CategoryListCell(categoryTitle: "Lady's Fashion",),
            CategoryListCell(categoryTitle: "Home & Living",),
            CategoryListCell(categoryTitle: "Gadgets Deals",),
            CategoryListCell(categoryTitle: "Kitchen Deals",),
          ],
        ),
      )
    );
  }
}