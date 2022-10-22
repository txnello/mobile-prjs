import 'package:flutter/material.dart';
import 'package:login_ui/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();

    _checkLogin();
  }

  _checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final String? user = prefs.getString('username');
    if (user == null) {
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          pageBuilder: (context, animation1, animation2) => Login(),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
        ),
      ).then((value) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
