// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tomato_sauce/pages/home_page.dart';

class CheckTodos extends StatefulWidget {
  final List<String> todos;
  const CheckTodos({super.key, required this.todos});

  @override
  State<CheckTodos> createState() => _CheckTodosState();
}

class _CheckTodosState extends State<CheckTodos> {
  List<bool> checkedTodos = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.todos.length; i++) {
      checkedTodos.add(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Check Todos"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        HomePage(),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                );
              },
              child: Text(
                "NEXT",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
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
              // list of todos
              widget.todos.length == 0
                  ? Text(
                      "No todos.",
                      style: TextStyle(fontSize: 18),
                    )
                  : Expanded(
                      child: ListView(
                        children: [
                          for (int i = 0; i < widget.todos.length; i++)
                            CheckboxListTile(
                              title: Text(widget.todos[i]),
                              activeColor: Colors.red,
                              value: checkedTodos[i],
                              onChanged: (bool? value) {
                                setState(() {
                                  checkedTodos[i] = !checkedTodos[i];
                                });
                              },
                            )
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
