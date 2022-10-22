import 'package:flutter/material.dart';

class NewSection extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  NewSection({
    required this.title,
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 17, right: 30, bottom: 10),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
          Icon(Icons.arrow_forward_ios_outlined, size: 15, color: Colors.grey,)
        ],
      ),
      ),
    );
  }
}
