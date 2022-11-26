// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:write_it_down_app/pages/noteeditor.dart';
import 'package:write_it_down_app/widgets/note.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin {
  List<Widget> listRight = [SizedBox(height: 30)];
  List<Widget> listLeft = [];

  int notesCount = 0;

  bool loading = true;

  late AnimationController controller;

  initState() {
    super.initState();

    getNotes();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
  }

  getNotes() async {
    setState(() {
      loading = true;
    });

    final response = await http.get(Uri.parse('http://10.0.2.2:8000/getNotes'));

    if (response.statusCode == 200) {
      var data = json.decode(response.body)["response"];

      setState(() {
        notesCount = data.length;
      });

      listRight = [SizedBox(height: 30)];
      listLeft = [];

      for (int i = 0; i < data.length; i++) {
        if (i % 2 == 0) {
          setState(() {
            listLeft.add(Note(
                id: data[i]["id"],
                title: data[i]["title"] != '-' ? data[i]["title"] : "",
                text: data[i]["text"] != '-' ? data[i]["text"] : "",
                date: data[i]["date"],
                image: data[i]["cover"] != '-' ? data[i]["cover"] : "",
                onTap: () {
                  editNote(data[i]["id"], data[i]["title"] != '-' ? data[i]["title"] : "", data[i]["date"], data[i]["text"] != '-' ? data[i]["text"] : "", data[i]["cover"] != '-' ? data[i]["cover"] : "");
                },
              ));
          });
        } else {
          setState(() {
            listRight.add(Note(
                id: data[i]["id"],
                title: data[i]["title"] != '-' ? data[i]["title"] : "",
                text: data[i]["text"] != '-' ? data[i]["text"] : "",
                date: data[i]["date"],
                image: data[i]["cover"] != '-' ? data[i]["cover"] : "",
                onTap: () {
                  editNote(data[i]["id"], data[i]["title"] != '-' ? data[i]["title"] : "", data[i]["date"], data[i]["text"] != '-' ? data[i]["text"] : "", data[i]["cover"] != '-' ? data[i]["cover"] : "");
                },
              ));
          });
        }
        setState(() {
          loading = false;
        });
      }
    } else {}
  }

  editNote(String id, String title, String date, String text, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteEditor(id: id, date: date, title: title, text: text, url: url)),
    ).then((value) {
        getNotes();
    });
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    Text(
                      "Notes",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      notesCount.toString() + " notes",
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    )
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NoteEditor()),
                    ).then((value) {
                      getNotes();
                    });
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(100))),
                    child: Icon(
                      Icons.add,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),

            // notes
            SizedBox(height: 10),

            loading
                ? CircularProgressIndicator(
                    value: controller.value,
                    semanticsLabel: 'Circular progress indicator',
                  )
                : Expanded(
                    child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: listLeft,
                          ),
                          Column(
                            children: listRight,
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
