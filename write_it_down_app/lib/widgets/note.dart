import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Note extends StatelessWidget {
  final String title;
  final String date;
  final String text;
  final bool image;

  const Note({super.key, required this.title, required this.date, required this.text, this.image = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 200,
        width: 180,
        decoration: BoxDecoration(
            color: Color.fromARGB(150, 250, 253, 60),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: Colors.black, width: 1)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                date,
                style: TextStyle(fontSize: 13),
              ),
              Text(
                text,
                style: TextStyle(fontSize: 13),
              )
            ],
          ),
        ),
      ),
    );
  }
}
