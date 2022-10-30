// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tomato_sauce/custom_objects/history_tile.dart';
import 'package:tomato_sauce/pages/authetication/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Map<String, Object>> data = [
    {
      "date": "2022-12-12",
      "percentage": 96,
      "minutesWork": 75,
      "minutesRest": 15,
      "completedList": <String>["Do exercise", "Have breakfast"],
      "failedList": <String>["Run 10km"]
    },
    {
      "date": "2022-12-08",
      "percentage": 10,
      "minutesWork": 12,
      "minutesRest": 23,
      "completedList": <String>["Do exercise"],
      "failedList": <String>["Run 10km", "Have breakfast"]
    },
    {
      "date": "2022-03-08",
      "percentage": 34,
      "minutesWork": 54,
      "minutesRest": 23,
      "completedList": <String>[],
      "failedList": <String>["Do exercise", "Run 10km", "Have breakfast"]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Profile"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => Login(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Icon(
                Icons.logout,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Center(
                child: Column(
              children: [
                // title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hi ",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "username6969",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    Text(
                      "!",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),

                // history
                for (int i = 0; i < data.length; i++)
                  HistoryTile(
                      date: data[i]["date"].toString(),
                      percentage: int.parse(data[i]["percentage"].toString()),
                      minutesWork: int.parse(data[i]["minutesWork"].toString()),
                      minutesRest: int.parse(data[i]["minutesRest"].toString()),
                      completedList: data[i]["completedList"] as List<String>,
                      failedList: data[i]["failedList"] as List<String>),
              ],
            ))),
      ),
    );
  }
}
