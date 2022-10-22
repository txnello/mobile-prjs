import 'package:flutter/material.dart';

class AppbarBuilder extends StatelessWidget implements PreferredSizeWidget {
  final String text1;
  final String text2;

  AppbarBuilder({
    required this.text1,
    required this.text2,
  });

  @override
  Size get preferredSize => const Size.fromHeight(55);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Column(
        children: [
          SizedBox(height: 10,),
        Row(
        children: [
          Text(
            text1,
            style: TextStyle(color: Colors.black),
          ),
          Text(
            text2,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      ],
      ),
      actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10, top: 10),
            child: Container(
              width: 55,
              child: OutlinedButton(
                  onPressed: null,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
                  ),
                  child: Icon(Icons.menu, color: Colors.black,)
              ),
            )
        )
      ],
    );
  }
}
