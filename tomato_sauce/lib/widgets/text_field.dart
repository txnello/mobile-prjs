import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  final String text;
  final Icon icon;
  final VoidCallback? password;
  final bool hide;
  final bool readOnly;

  const CustomTextField(
      {super.key,
      required this.text,
      required this.icon,
      this.password,
      this.hide = false,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        enabled: !readOnly,
        obscureText: hide,
        decoration: InputDecoration(
          prefixIcon: icon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(90.0)),
              borderSide: BorderSide.none),
          hintStyle:
              TextStyle(color: Colors.white, fontFamily: "WorkSansLight"),
          filled: true,
          fillColor: Colors.white24,
          hintText: text,
          suffixIcon: password != null
              ? IconButton(
                  icon: Icon(
                    hide ? Icons.visibility : Icons.visibility_off,
                    color: Colors.grey[300],
                  ),
                  onPressed: password,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent)
              : null,
        ),
      ),
    );
  }
}
