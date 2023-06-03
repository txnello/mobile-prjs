// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pastry_shop_ui/customWidgets/circleCake.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class HomepageCell extends StatelessWidget {
  final int menuId;
  final Function(int) onMenuSelect;
  const HomepageCell({super.key, required this.menuId, required this.onMenuSelect});

  @override
  Widget build(BuildContext context) {
    List<String> menuItems = ["New Items", "Cakes", "Pastry", "Drinks"];

    Widget customLine(double width) {
      return Container(
        width: width,
        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.amber, width: 3))),
      );
    }

    List<Widget> menuBuilder() {
      List<Widget> lw = [];

      for (int i = 0; i < menuItems.length; i++) {
        if (i == menuId) {
          lw.add(GestureDetector(
            onTap: () {
              onMenuSelect(i);
            },
            child: Text(
              menuItems[i],
              style: TextStyle(
                color: Colors.transparent,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                decoration: TextDecoration.underline,
                decorationColor: Colors.amber,
                decorationThickness: 3,
                shadows: [Shadow(offset: Offset(0, -5), color: Colors.black)],
              ),
            ),
          ));
        } else {
          lw.add(GestureDetector(
            onTap: () {
              onMenuSelect(i);
            },
            child: Text(menuItems[i],
                style: TextStyle(
                  color: Colors.transparent,
                  fontSize: 14,
                  shadows: [Shadow(offset: Offset(0, -5), color: Colors.grey)],
                )),
          ));
        }
      }

      return lw;
    }

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50), boxShadow: [BoxShadow(color: Color.fromARGB(255, 235, 235, 235), spreadRadius: 1, blurRadius: 15, offset: const Offset(0, 15))]),
      child: Column(
        children: [
          SizedBox(height: 20),

          // first row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //description
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Creamy flavor",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  Text(
                    "PanCake",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: "\$12",
                          style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                          children: const <TextSpan>[TextSpan(text: " 65% off", style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold))],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      customLine(100),
                      SizedBox(width: 7),
                      customLine(3),
                      SizedBox(width: 5),
                      customLine(15)
                    ],
                  )
                ],
              ),

              // image
              CircleCake(
                text: "",
                imgPath: "assets/images/cake2.jpg",
                radius: 50,
                bubbleContent: "+",
                bubbleFontSize: 25,
              )
            ],
          ),

          SizedBox(height: 20),

          // menu
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: menuBuilder(),
          ),

          SizedBox(height: 20),

          // item
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/cake8.jpg"),
                radius: 50,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Bingo Jelly",
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    "Bla bla bla bla",
                    style: TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  RatingBar.builder(
                    itemSize: 20,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 2),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  SizedBox(height: 5),
                  RichText(
                    text: TextSpan(
                      text: "\$ 16,02",
                      style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                      children: const <TextSpan>[TextSpan(text: " 70% off", style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.bold))],
                    ),
                  )
                ],
              )
            ],
          ),

          SizedBox(height: 20),
        ],
      ),
    );
  }
}
