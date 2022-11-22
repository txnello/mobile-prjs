// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/components/squared_image.dart';
import 'package:netflix_clone/pages/homepage.dart';

class ChooseProfile extends StatefulWidget {
  const ChooseProfile({super.key});

  @override
  State<ChooseProfile> createState() => _ChooseProfileState();
}

class _ChooseProfileState extends State<ChooseProfile> {
  @override
  Widget build(BuildContext context) {

    onClickProfile(String image) {
      Navigator.push(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => Homepage(image: image),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Image.asset('assets/images/logos/netflix_logo_long.png', width: 100),
          centerTitle: true,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(CupertinoIcons.pencil),
            )
          ],
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // title
            Text("Chi vuole guardare Netflix?", style: TextStyle(fontSize: 21, color: Colors.grey),),

            // user list
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:() => onClickProfile("assets/images/people/p1.jpg"),
                  child: SquaredImage(image: "assets/images/people/p1.jpg", imageHeight: 110, name: "Agata"),
                ),
                SizedBox(width: 27,),
                GestureDetector(
                  onTap:() => onClickProfile("assets/images/people/p2.jpg"),
                  child: SquaredImage(image: "assets/images/people/p2.jpg", imageHeight: 110, name: "Bill"),
                ),
              ],
            ),

            SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:() => onClickProfile("assets/images/people/p3.jpg"),
                  child: SquaredImage(image: "assets/images/people/p3.jpg", imageHeight: 110, name: "Giulia"),
                ),
                SizedBox(width: 27,),
                GestureDetector(
                  onTap:() => onClickProfile("assets/images/people/p4.jpg"),
                  child: SquaredImage(image: "assets/images/people/p4.jpg", imageHeight: 110, name: "Anna"),
                ),
              ],
            ),

            SizedBox(height: 32,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap:() => onClickProfile("assets/images/people/p5.jpg"),
                  child: SquaredImage(image: "assets/images/people/p5.jpg", imageHeight: 110, name: "Fabio"),
                ),
                SizedBox(width: 27,),
                SizedBox(width: 110,),
              ],
            ),
          ],
        )),
      );
  }
}
