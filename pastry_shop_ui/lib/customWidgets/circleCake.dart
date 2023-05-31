// ignore_for_file: prefer_const_constructors

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class CircleCake extends StatelessWidget {
  final String imgPath;
  final double radius;
  final double bubbleFontSize;
  final String bubbleContent;
  final String text;

  const CircleCake({super.key, required this.text, required this.imgPath, required this.radius, required this.bubbleContent, required this.bubbleFontSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          children: [
            DottedBorder(
                color: Colors.black,
                borderType: BorderType.RRect,
                radius: Radius.circular(100),
                strokeWidth: 1,
                child: CircleAvatar(
                  backgroundImage: AssetImage(imgPath),
                  radius: radius,
                )),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100), boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 15, offset: const Offset(0, 7))]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 6, bottom: 3),
                    child: Text(
                      bubbleContent,
                      style: TextStyle(fontSize: bubbleFontSize),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 7),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        )
      ],
    );
  }
}
