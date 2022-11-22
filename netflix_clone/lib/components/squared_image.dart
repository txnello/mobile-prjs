// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SquaredImage extends StatelessWidget {
  final String image;
  final String? name;
  final double imageHeight;

  const SquaredImage({super.key, required this.image, required this.imageHeight, this.name});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(image, height: imageHeight),
      ),
      if (name != null)
        SizedBox(
          height: 10,
        ),
      if (name != null)
        Text(
          name!,
          style: TextStyle(fontSize: 13, color: Colors.grey),
        )
    ]);
  }
}
