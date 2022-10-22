import 'package:flutter/material.dart';

class SavedStory extends StatelessWidget {
  final String name;
  final String imgPath;
  final Color borderColor;
  final double width;

  SavedStory({required this.name, required this.imgPath, required this.borderColor, required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 2, color: borderColor),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    borderColor,
                    Colors.black,
                  ],
                )
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 3, color: Colors.black),
              ),
              child: Container(
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(imgPath),
                ),
              ),
            ),
          ),
          if (name != "") Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(name),
          )
        ],
      ),
    );
  }
}
