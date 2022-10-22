import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_stack/image_stack.dart';
import 'package:instagram_ui/home_page.dart';

import '../utils/image_grid.dart';
import '../utils/saved_story.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  onBottomNavigationTap(int index) {
    if (index == 0) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation1, animation2) => const HomePage(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Container(
            width: 100,
            child: ClipRRect(
              child: Image.asset("lib/images/logo_text.png"),
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 5),
              child: Icon(
                Icons.add,
                size: 35,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                CupertinoIcons.paperplane,
                size: 25,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.menu,
                size: 27,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.slow_motion_video_outlined,
                  size: 30,
                ),
                label: ""),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: "",
                activeIcon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 30,
                )),
          ],
          onTap: onBottomNavigationTap,
          currentIndex: 4,
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // profile and stats
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        child: ClipRRect(
                          child: Image.asset("lib/images/img1.jpg"),
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      Column(
                        children: const [
                          Text(
                            "10",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text("Posts")
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            "408",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text("Followers")
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            "190",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text("Following")
                        ],
                      ),
                    ],
                  ),
                ),

                // name
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Text(
                    "Bobby Scott",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),

                // bio
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Super account"),
                        Row(
                          children: [
                            Text("Follow "),
                            Text(
                              "@manuel",
                              style: TextStyle(color: Colors.blue),
                            ),
                            Text(" for more!"),
                          ],
                        ),
                        Text("Stay tuned 🔥"),
                      ]),
                ),

                // followed by
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15),
                  child: Row(
                      children: [
                        ImageStack(
                          imageList: [
                            "lib/images/img2.png",
                            "lib/images/img3.png",
                            "lib/images/img4.png",
                          ],
                          totalCount: 3,
                          imageRadius: 25,
                          imageCount: 3,
                          imageBorderWidth: 3,
                        ),
                        SizedBox(width: 10,),
                        Text("Followed by "),
                        Text("mr_01, mrs_02 ", style: TextStyle(fontWeight: FontWeight.bold),),
                        Text("and "),
                        Text("1 other", style: TextStyle(fontWeight: FontWeight.bold),),
                      ]
                  ),
                ),

                // edit profile
                Padding(
                  padding: const EdgeInsets.only(
                      right: 15, left: 15, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /*Container(
        height: 30,
        width: 150,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
          onPressed: () { },
          child: Text('Follow'),
        )
      ),*/
                      Container(
                        height: 30,
                        width: 300,
                        child: OutlinedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0))),
                            ),
                            child: Text(
                              "Edit Profile",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                      Container(
                        height: 30,
                        width: 50,
                        child: OutlinedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4.0))),
                            ),
                            child: Icon(
                              Icons.people_outline,
                              size: 20,
                            )),
                      ),
                    ],
                  ),
                ),

                // stories
                Container(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SavedStory(name: 'IMG2', imgPath: 'lib/images/img2.jpg', borderColor: Colors.white, width: 40),
                      SavedStory(name: 'img 3', imgPath: 'lib/images/img3.jpg', borderColor: Colors.white, width: 40),
                      SavedStory(name: 'img4', imgPath: 'lib/images/img4.jpg', borderColor: Colors.white, width: 40),
                    ],
                  ),
                ),

                // menu
                Padding(
                  padding: const EdgeInsets.only(right: 60, left: 60, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.grid_on),
                      Icon(Icons.slow_motion_video_sharp, color: Colors.grey,),
                      Icon(Icons.person_pin_outlined, color: Colors.grey,),
                    ],
                  ),
                ),

                // pictures
                ImageGrid(images: [
                  "lib/images/img1.jpg",
                  "lib/images/img2.jpg",
                  "lib/images/img3.jpg",
                  "lib/images/img4.jpg",
                  "lib/images/img5.jpg",
                  "lib/images/img6.jpg",
                  "lib/images/img1.jpg",
                  "lib/images/img2.jpg",
                ],)

              ],
            )));
  }
}
