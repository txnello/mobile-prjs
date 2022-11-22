import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nice_bottom_bar/utils/bottom_bar.dart';

class Network extends StatefulWidget {
  const Network({super.key});

  @override
  State<Network> createState() => _NetworkState();
}

class _NetworkState extends State<Network> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nice Bottom Bar"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomBar(
        context: context,
        currIdx: 3,
      ),
      body: Center(
        child: Text("Network"),
      ),
    );
  }
}
