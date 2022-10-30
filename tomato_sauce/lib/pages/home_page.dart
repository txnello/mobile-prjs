// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tomato_sauce/pages/profile.dart';
import 'package:tomato_sauce/pages/todo/create_todos.dart';
import 'package:tomato_sauce/widgets/continue_button.dart';

import '../widgets/text_field.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    onPressedContinueButton() {
      Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => CreateTodos(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Pomodoro"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) => Profile(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Icon(
                Icons.person,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
            child: Column(
          children: [
            // text fields
            CustomTextField(text: "Minutes of work", icon: Icon(Icons.work)),
            CustomTextField(
                text: "Minutes of rest", icon: Icon(Icons.tag_faces_rounded)),
            CustomTextField(text: "Repetitions", icon: Icon(Icons.numbers)),

            // continue button
            ContinueButton(
                text: 'Start pomodoro!', onPressed: onPressedContinueButton)
          ],
        )),
      ),
    );
  }
}
