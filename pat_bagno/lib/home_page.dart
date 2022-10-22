import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Color color = Colors.green;
  String message = "LIBERO";

  @override
  void initState() {
    super.initState();

    statusSelector();
  }

  statusSelector() {
    int rand = Random().nextInt(1000);

    if (rand % 2 == 0) {
      color = Colors.green;
      message = "LIBERO";
    } else {
      color = Colors.red;
      message = "OCCUPATO";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBackground(
          behaviour: RandomParticleBehaviour(
              options: ParticleOptions(baseColor: color)),
          vsync: this,
          child: Center(
            child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                width: 300,
                height: 150,
                child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Il bagno è:",
                            style: TextStyle(fontSize: 30),
                          ),
                          InkWell(
                            child: Text(
                              message,
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: color),
                            ),
                            onTap: () {
                              setState(() {
                                if (message == "OCCUPATO") {
                                  color = Colors.green;
                                  message = "LIBERO";
                                } else {
                                  color = Colors.red;
                                  message = "OCCUPATO";
                                }
                              });
                              },
                          ),
                        ]))),
          )),
    );
  }
}
