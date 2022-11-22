import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContinueWatching extends StatelessWidget {
  final String title;
  final List<String> time;
  final List<String> posters;

  const ContinueWatching(
      {super.key, required this.title, required this.time, required this.posters});

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
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                for (int i = 0; i < posters.length; i++)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      children: [
                        Container(
                            height: 160,
                            width: 110,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(posters[i]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 0,
                                ),
                                Icon(
                                  CupertinoIcons.play_circle,
                                  size: 70,
                                ),
                                Text(
                                  time[i],
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )),
                        Container(
                            height: 35,
                            width: 110,
                            decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(5),
                                    bottomRight: Radius.circular(5))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.info_outline),
                                Icon(Icons.more_vert)
                              ],
                            ))
                      ],
                    ),
                  ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
