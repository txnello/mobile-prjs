import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tomato_sauce/pages/todo/check_todos.dart';
import 'package:tomato_sauce/widgets/text_field.dart';

class CreateTodos extends StatefulWidget {
  const CreateTodos({super.key});

  @override
  State<CreateTodos> createState() => _CreateTodosState();
}

class _CreateTodosState extends State<CreateTodos> {
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
                        CheckTodos(),
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
              CustomTextField(
                  text: "e.i. Do exercise...", icon: Icon(Icons.check_box))
            ],
          ),
        ),
      ),
    );
  }
}
