import 'package:flutter/material.dart';
import 'package:payment_ui/screens/super_cards.dart';
import 'package:payment_ui/utils/appbar.dart';
import 'package:payment_ui/utils/bottom_navigation.dart';
import 'package:payment_ui/utils/new_section.dart';

import '../utils/cards_tile.dart';
import '../utils/payments_history_tile.dart';
// ignore_for_file: prefer_const_constructors

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarBuilder(text1: "Hi, ", text2: "Sullivan!",),
        bottomNavigationBar: BottomNavigationBuilder(currIdx: 0, context: context),
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // divider
          Divider(
            color: Colors.grey,
          ),

          // payments history
          Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  PaymentsHistoryTile(
                    image: "lib/logos/paypal.jpg",
                    title: "Paypal income",
                    price: "\$1230.12",
                  ),
                  PaymentsHistoryTile(
                    image: "lib/logos/amazon.jpg",
                    title: "Amazon shop",
                    price: "\$67.80",
                  ),
                  PaymentsHistoryTile(
                    image: "lib/logos/ebay.jpg",
                    title: "Ebay purchase",
                    price: "\$112.45",
                  ),
                ],
              ),
            ),
          ),

          // cards
          NewSection(title: "Super Cards", onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SuperCards()),
            );
          }),
          Container(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                scrollDirection: Axis.horizontal,
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
                ],
              ),
            ),
          ),

          // map
          NewSection(title: "Super ATM", onTap: () {}),
          Text("MAP", style: TextStyle(fontSize: 100),)
        ],
      ),
    ));
  }
}
