import 'package:flutter/material.dart';

class Topic extends StatelessWidget {
  final String text;
  final bool selected;
  final VoidCallback onSelect;

  const Topic({super.key, required this.text, this.selected = false, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: selected ? Colors.amber : Colors.transparent,
          border: Border.all(color: Colors.amber, width: 2)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(text, style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold
            )),
          )
        ),
      ),
    );
  }
}