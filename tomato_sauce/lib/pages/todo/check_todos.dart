import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tomato_sauce/pages/home_page.dart';

class CheckTodos extends StatefulWidget {
  const CheckTodos({super.key});

  @override
  State<CheckTodos> createState() => _CheckTodosState();
}

class _CheckTodosState extends State<CheckTodos> {
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
        body: Text(""));
  }
}
