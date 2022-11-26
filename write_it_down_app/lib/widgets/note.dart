import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:write_it_down_app/pages/noteeditor.dart';

class Note extends StatelessWidget {
  final String id;
  final String title;
  final String date;
  final String text;
  final String image;
  final VoidCallback onTap;

  const Note({super.key, required this.id, required this.title, required this.date, required this.text, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 2 - 27,
          decoration: BoxDecoration(
              color: Colors.lightBlue[100],
              borderRadius: BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: Colors.black, width: 1)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 3),
                Text(
                  date,
                  style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                ),

                SizedBox(height: 5),
                image == "" ? Text(
                  text.length < 150 ? text : text.substring(0, 150) + "...",
                  style: TextStyle(fontSize: 13),
                ) :
                Image.network(image)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
