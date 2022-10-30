// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HistoryTile extends StatelessWidget {
  final String date;
  final int percentage;
  final int minutesWork;
  final int minutesRest;
  final List<String> completedList;
  final List<String> failedList;
  const HistoryTile(
      {super.key,
      required this.date,
      required this.percentage,
      required this.minutesWork,
      required this.minutesRest,
      required this.completedList,
      required this.failedList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white10, borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // date
                Text(date),

                // % of tasks completed
                Text(
                  percentage.toString() + "% of the tasks",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),

                // minutes of rest
                SizedBox(
                  height: 15,
                ),
                // minutes of work
                Row(
                  children: [
                    Text(
                      "You worked for ",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      minutesWork.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      " minutes.",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "You rested for ",
                      style: TextStyle(fontSize: 17),
                    ),
                    Text(
                      minutesRest.toString(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      " minutes.",
                      style: TextStyle(fontSize: 17),
                    ),
                  ],
                ),

                // completed todos
                SizedBox(
                  height: 15,
                ),
                Text(
                  "List of todos you completed:",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < completedList.length; i++)
                          Text(
                            (i + 1).toString() + ". " + completedList[i],
                            style: TextStyle(fontSize: 17),
                          ),
                      ],
                    )
                  ],
                ),

                // failed todos
                SizedBox(
                  height: 15,
                ),
                Text(
                  "List of failed todos:",
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (int i = 0; i < failedList.length; i++)
                          Text(
                            (i + 1).toString() + ". " + failedList[i],
                            style: TextStyle(fontSize: 17),
                          ),
                      ],
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
