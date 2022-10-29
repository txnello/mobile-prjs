// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_sauce/pages/home_page.dart';
import 'package:tomato_sauce/widgets/round_button.dart';

import '../../widgets/text_field.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool passwordStatus = true;
  passwordVisualization() {
    setState(() {
      passwordStatus = !passwordStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/images/login.jpg"),
              fit: BoxFit.cover,
              opacity: 450),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 70,
                ),

                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    )
                  ],
                ),

                // title
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.sacramento(fontSize: 70),
                  ),
                ),

                // fields
                CustomTextField(text: "E-mail", icon: Icon(Icons.mail)),
                CustomTextField(text: "Username", icon: Icon(Icons.person)),
                CustomTextField(
                    text: "Password",
                    icon: Icon(Icons.key),
                    password: passwordVisualization,
                    hide: passwordStatus),

                // button
                Container(
                  width: 200,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100.0),
                                    side: BorderSide(color: Colors.red)))),
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home', (Route<dynamic> route) => false);
                    },
                    child: const Text(
                      'Sign up',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

                // login with social networks
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundButton(icon: Icon(Icons.face)),
                    RoundButton(icon: Icon(Icons.key)),
                    RoundButton(icon: Icon(Icons.person)),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
