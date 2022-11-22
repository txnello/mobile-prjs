// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/components/squared_image.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<String> posters;

  const MovieList({super.key, required this.title, required this.posters});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < posters.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SquaredImage(
                        image: posters[i],
                        imageHeight: 160),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
