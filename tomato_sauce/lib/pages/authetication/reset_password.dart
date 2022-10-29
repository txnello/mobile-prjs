// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tomato_sauce/pages/home_page.dart';
import 'package:tomato_sauce/widgets/round_button.dart';

import '../../widgets/text_field.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool emailSent = false;

  bool passwordStatus = true;
  passwordVisualization() {
    setState(() {
      passwordStatus = !passwordStatus;
    });
  }

  bool repeatPasswordStatus = true;
  repeatPasswordVisualization() {
    setState(() {
      repeatPasswordStatus = !repeatPasswordStatus;
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
                    "Reset Password",
                    style: GoogleFonts.sacramento(fontSize: 65),
                  ),
                ),

                // fields
                CustomTextField(
                    text: "E-mail",
                    icon: Icon(Icons.mail),
                    readOnly: emailSent),
                if (emailSent)
                  CustomTextField(text: "Code", icon: Icon(Icons.numbers)),
                if (emailSent)
                  CustomTextField(
                      text: "Password",
                      icon: Icon(Icons.key),
                      password: passwordVisualization,
                      hide: passwordStatus),
                if (emailSent)
                  CustomTextField(
                      text: "Repeat password",
                      icon: Icon(Icons.key),
                      password: repeatPasswordVisualization,
                      hide: repeatPasswordStatus),

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
                      if (!emailSent) {
                        setState(() {
                          emailSent = !emailSent;
                        });
                      } else {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home', (Route<dynamic> route) => false);
                      }
                    },
                    child: Text(
                      emailSent ? 'Reset password' : 'Send email',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
