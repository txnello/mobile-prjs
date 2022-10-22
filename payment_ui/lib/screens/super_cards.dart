import 'package:flutter/material.dart';

import '../utils/appbar.dart';
import '../utils/bottom_navigation.dart';
import '../utils/cards_tile.dart';

class SuperCards extends StatefulWidget {
  const SuperCards({Key? key}) : super(key: key);

  @override
  State<SuperCards> createState() => _SuperCardsState();
}

class _SuperCardsState extends State<SuperCards> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarBuilder(
        text1: "",
        text2: "Super cards",
      ),
      bottomNavigationBar: BottomNavigationBuilder(currIdx: 1, context: context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // divider
            Divider(
              color: Colors.grey,
            ),

            // cards list
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(
                  children: [
                    CardsTile(
                      color: Colors.yellow,
                      balance: "\$1234.89",
                      expirationDate: "12/25",
                      flagged: true,
                      lastDigits: 1344,
                      type: "Visa",
                    ),
                    CardsTile(
                      color: Colors.red,
                      balance: "\$134.89",
                      expirationDate: "12/25",
                      flagged: false,
                      lastDigits: 1344,
                      type: "Mastercard",
                    ),
                    CardsTile(
                      color: Colors.green,
                      balance: "\$1237.45",
                      expirationDate: "12/25",
                      flagged: false,
                      lastDigits: 1344,
                      type: "Visa",
                    ),
                    CardsTile(
                      color: Colors.yellow,
                      balance: "\$1234.89",
                      expirationDate: "12/25",
                      flagged: true,
                      lastDigits: 1344,
                      type: "Visa",
                    ),
                    CardsTile(
                      color: Colors.red,
                      balance: "\$134.89",
                      expirationDate: "12/25",
                      flagged: false,
                      lastDigits: 1344,
                      type: "Mastercard",
                    ),
                    CardsTile(
                      color: Colors.green,
                      balance: "\$1237.45",
                      expirationDate: "12/25",
                      flagged: false,
                      lastDigits: 1344,
                      type: "Visa",
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5, left: 5, top: 10, bottom: 10),
                      child: Container(
                        height: 50,
                        child: OutlinedButton(
                            onPressed: null,
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0))),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.add, color: Colors.black),
                                Text("Add Card", style: TextStyle(color: Colors.black),)
                              ],
                            ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
