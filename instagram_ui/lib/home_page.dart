import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_ui/pages/profile.dart';
import 'package:instagram_ui/utils/post.dart';
import 'package:instagram_ui/utils/saved_story.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  onBottomNavigationTap(int index) {
    if (index == 4) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => const Profile(),
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
              Icons.camera_alt_outlined,
              size: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 14, right: 10),
            child: FaIcon(FontAwesomeIcons.heart),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              CupertinoIcons.paperplane,
              size: 25,
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
            label: "",
            activeIcon: Icon(
              Icons.home_filled,
              color: Colors.white,
              size: 30,
            ),
          ),
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
              label: ""),
        ],
        onTap: onBottomNavigationTap,
        currentIndex: 0,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //stories
            Container(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SavedStory(name: 'Your Story', imgPath: 'lib/images/img1.jpg', borderColor: Colors.black, width: 50,),
                  SavedStory(name: 'Mr_1', imgPath: 'lib/images/img2.jpg', borderColor: Colors.purpleAccent, width: 50,),
                  SavedStory(name: 'Mrs_2', imgPath: 'lib/images/img3.jpg', borderColor: Colors.purpleAccent, width: 50,),
                  SavedStory(name: 'Mr_3', imgPath: 'lib/images/img4.jpg', borderColor: Colors.purpleAccent, width: 50,),
                  SavedStory(name: 'Mrs_4', imgPath: 'lib/images/img5.jpg', borderColor: Colors.grey, width: 50,),
                  SavedStory(name: 'Mr_5', imgPath: 'lib/images/img2.jpg', borderColor: Colors.grey, width: 50,),
                  SavedStory(name: 'Mrs_6', imgPath: 'lib/images/img3.jpg', borderColor: Colors.grey, width: 50,),
                ],
              ),
            ),

            Post(profilePicture: "lib/images/img2.jpg", profileName: "Mr_1", postPicture: "lib/images/img4.jpg", firstLike: "Mrs_2", description: "abcdefg", numberOfComments: 3, numberOfMinutes: 39),
            Post(profilePicture: "lib/images/img3.jpg", profileName: "Mrs_2", postPicture: "lib/images/img6.jpg", firstLike: "Mr_3", description: "aeiou", numberOfComments: 7, numberOfMinutes: 41),
          ],
        ),
      ),
    );
  }
}
