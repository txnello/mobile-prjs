// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:write_it_down_app/pages/NoteEditor.dart';
import 'package:write_it_down_app/widgets/note.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0.0), // here the desired height
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            // title, note counter, add button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Notes", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                    Text("25 notes", style: TextStyle(fontSize: 17, color: Colors.grey),)
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NoteEditor()),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Icon(Icons.add, size: 35, color: Colors.white,),
                  ),
                )
              ],
            ),

            // notes
            Expanded(
                child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Note(title: "Stand up meeting", date: "20-12-2022", text: "mnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhv jhdv bvhv"),
                        Note(title: "Stand up meeting", date: "20-12-2022", text: "mnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhv jhdv bvhv"),
                        Note(title: "Stand up meeting", date: "20-12-2022", text: "mnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhv jhdv bvhv"),
                        Note(title: "Stand up meeting", date: "20-12-2022", text: "mnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhv jhdv bvhv"),
                        Note(title: "Stand up meeting", date: "20-12-2022", text: "mnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhv jhdv bvhv"),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(height: 50,),
                        Note(title: "Stand up meeting", date: "20-12-2022", text: "mnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhv jhdv bvhv"),
                        Note(title: "Stand up meeting", date: "20-12-2022", text: "mnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhv jhdv bvhv"),
                        Note(title: "Stand up meeting", date: "20-12-2022", text: "mnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhv jhdv bvhv"),
                        Note(title: "Stand up meeting", date: "20-12-2022", text: "mnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhv jhdv bvhv"),
                        Note(title: "Stand up meeting", date: "20-12-2022", text: "mnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhvshv vv ksvsbvb   ska sakvmnajkdnajknd jhdv bvhv jhdv bvhv"),
                      ],
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
