import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagram_ui/utils/saved_story.dart';

class Post extends StatelessWidget {
  final String profilePicture;
  final String profileName;

  final String postPicture;

  final String firstLike;
  final String description;

  final int numberOfComments;
  final int numberOfMinutes;

  Post({
      required this.profilePicture,
    required this.profileName,

    required this.postPicture,

    required this.firstLike,
    required this.description,

    required this.numberOfComments,
    required this.numberOfMinutes,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //post: header
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SavedStory(name: '', imgPath: profilePicture, borderColor: Colors.red, width: 25,),
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 8, bottom: 5),
                  child: Text(profileName, style: TextStyle(fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(width: 270,),
              const Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Icon(Icons.more_vert, size: 20),
              )
            ],
          ),
        ),

        //post: image
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Image.asset(postPicture),
        ),

        //post: action buttons
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 15, top: 8),
              child: FaIcon(FontAwesomeIcons.heart),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 8),
              child: FaIcon(FontAwesomeIcons.comment),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 8),
              child: Icon(CupertinoIcons.paperplane),
            ),
            SizedBox(width: 250,),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: FaIcon(FontAwesomeIcons.bookmark),
            ),
          ],
        ),

        //text
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Liked by "),
                  Text(firstLike, style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("and "),
                  Text("other", style: TextStyle(fontWeight: FontWeight.bold),),
                ],
              ),
              Row(
                children: [
                  Text("Mr_1 ", style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(description),
                ],
              ),
              Text("... more"),
              Text("View all " + numberOfComments.toString() + " comments", style: TextStyle(
                  color: Colors.grey
              ),),
              Text(numberOfMinutes.toString() + " minutes ago", style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12
              ),),
            ],
          ),
        )
      ],
    );
  }
}
