import 'package:finance_payments_ui/utils/card_tile.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

Widget _menu(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Icon(Icons.horizontal_rule_rounded, color: Colors.grey, size: 50,)
    ],
  );
}

Widget _page() {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // title
        Padding(
          padding: EdgeInsets.only(left: 20, top: 15),
          child: Text(
            "My Cards",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),

        //cards
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            height: 220,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.orange[100],
                        borderRadius: BorderRadius.circular(12)),
                    width: 70,
                    child: const Center(
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Text(
                          "Add new card",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                CardTile(
                    color: Colors.blueAccent,
                    imagePath: "lib/images/mastercard_logo.png",
                    code: 1234,
                    balance: "\$334.67",
                    cardType: "Credit Card"),
                CardTile(
                    color: Colors.purple,
                    imagePath: "lib/images/visa_logo.png",
                    code: 5678,
                    balance: "\$333214.67",
                    cardType: "Debit Card"),
                CardTile(
                    color: Colors.brown,
                    imagePath: "lib/images/mastercard_logo.png",
                    code: 9012,
                    balance: "\$3234.67",
                    cardType: "Credit Card"),
                CardTile(
                    color: Colors.teal,
                    imagePath: "lib/images/visa_logo.png",
                    code: 3456,
                    balance: "\$3334.67",
                    cardType: "Debit Card"),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("lib/images/p1.jpg"),
            ),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SlidingUpPanel(
        panel: _menu(),

        body: _page(),

        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
      ),
    );
  }
}
