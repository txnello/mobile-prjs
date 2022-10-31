// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tomato_sauce/custom_objects/todo_row.dart';
import 'package:tomato_sauce/pages/todo/check_todos.dart';
import 'package:tomato_sauce/widgets/continue_button.dart';
import 'package:tomato_sauce/widgets/text_field.dart';

class CreateTodos extends StatefulWidget {
  const CreateTodos({super.key});

  @override
  State<CreateTodos> createState() => _CreateTodosState();
}

class _CreateTodosState extends State<CreateTodos> {
  int id = 0;
  List<String> todos = ["Do exercise", "Run 10km", "Eat pasta"];

  final todoController = TextEditingController();

  onSubmitted(String value) {
    if (value != '' && value != null) {
      setState(() {
        todos.add(value);
      });
    }
  }

  onDelete(int id) {
    setState(() {
      todos.removeAt(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text("Create Todos"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15, top: 20),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        CheckTodos(todos: todos),
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
              // text box
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 265,
                    child: CustomTextField(
                      controller: todoController,
                      text: "e.i. Do exercise...",
                      icon: Icon(Icons.check_box),
                      onSubmitted: onSubmitted,
                    ),
                  ),
                  Container(
                      width: 80,
                      height: 60,
                      child: ContinueButton(
                          text: "Save",
                          onPressed: () {
                            onSubmitted(todoController.text);
                          }))
                ],
              ),

              // list of todos
              todos.length == 0
                  ? Text(
                      "No todos.",
                      style: TextStyle(fontSize: 18),
                    )
                  : Expanded(
                      child: ListView(
                        children: [
                          for (int i = 0; i < todos.length; i++)
                            TodoRow(text: todos[i], id: i, onDelete: onDelete),
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
