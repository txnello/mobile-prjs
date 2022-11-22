// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:netflix_clone/components/continue_watching.dart';
import 'package:netflix_clone/components/movie_list.dart';
import 'package:netflix_clone/components/squared_image.dart';

class Homepage extends StatefulWidget {
  final String image;

  const Homepage({super.key, required this.image});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold), backgroundColor: Colors.white, foregroundColor: Colors.black);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              size: 25,
            ),
            label: "",
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.white,
              size: 25,
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.game_controller,
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.play_rectangle,
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.smiley,
                size: 25,
              ),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.arrow_down_circle,
                size: 25,
              ),
              label: ""),
        ],
        currentIndex: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [
          // movie highlight
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/posters/pos11.jpg"),
                  fit: BoxFit.cover,
                ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60, left: 0),
                      child: Image.asset("assets/images/logos/netflix_logo.png", height: 60,),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 75),
                          child: Icon(Icons.search),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 23, right: 13, top: 70),
                          child: SquaredImage(image: widget.image, imageHeight: 30),
                        ),
                      ],
                    ),
                  ]
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text("Serie TV", style: TextStyle(fontSize: 16),),
                    Text("Film", style: TextStyle(fontSize: 16),),
                    Text("Categorie ▼", style: TextStyle(fontSize: 16),),
                  ],
                ),
              ],
            ),
          ),

          // action buttons
          SizedBox(height: 5,),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/logos/top10.png", width: 25,),
                  SizedBox(width: 5,),
                  Text("Oggi al n° 2 tra le serie TV", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                ],
              ),

              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Icon(Icons.check),
                      Text("La mia lista", style: TextStyle(fontSize: 12, color: Colors.grey),)
                    ],
                  ),
                  ElevatedButton(
                    style: style,
                    onPressed: () {},
                    child: const Text('▶ Riproduci'),
                  ),
                  Column(
                    children: [
                      Icon(Icons.info_outline),
                      SizedBox(height: 3,),
                      Text("Info", style: TextStyle(fontSize: 12, color: Colors.grey),)
                    ],
                  ),
                ],
              )
            ],
          ),

          // other movies
          SizedBox(height: 10,),
          MovieList(title: "Serie TV", posters: [
            "assets/images/posters/pos1.jpg",
            "assets/images/posters/pos2.jpg",
            "assets/images/posters/pos3.jpg",
            "assets/images/posters/pos4.jpg"
          ],),
          MovieList(title: "I titoli del momento", posters: [
            "assets/images/posters/pos5.jpg",
            "assets/images/posters/pos6.jpg",
            "assets/images/posters/pos7.jpg",
            "assets/images/posters/pos9.jpg"
          ],),
          ContinueWatching(title: "Continua a guardare", time: [
            "S1:E2",
            "1h 40m"
          ], posters: [
            "assets/images/posters/pos10.jpg",
            "assets/images/posters/pos8.jpg",
          ],)
        ],
      ),
      ),

    floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.white,
        child: const Icon(CupertinoIcons.shuffle),
      ),
    );
  }
}
