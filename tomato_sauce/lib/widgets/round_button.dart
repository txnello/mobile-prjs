import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class RoundButton extends StatelessWidget {
  final Icon icon;

  const RoundButton({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {},
      child: icon,
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.grey),
        shape: CircleBorder(),
        padding: EdgeInsets.all(15),
      ),
    );
  }
}
