import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nice_bottom_bar/utils/bottom_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nice Bottom Bar"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomBar(
        context: context,
        currIdx: 4,
      ),
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
