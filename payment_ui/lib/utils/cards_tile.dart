import 'package:flutter/material.dart';

class CardsTile extends StatelessWidget {
  final Color color;
  final String expirationDate;
  final int lastDigits;
  final String balance;
  final String type;
  final bool flagged;

  CardsTile({
    required this.color,
    required this.expirationDate,
    required this.lastDigits,
    required this.balance,
    required this.type,
    required this.flagged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                color,
                Colors.black,
              ],
            )
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top row
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        type,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[400]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: flagged
                            ? Icon(
                                Icons.verified_user_rounded,
                                size: 15,
                                color: Colors.blue,
                              )
                            : null,
                      )
                    ],
                  ),
                  Text(
                    expirationDate,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black54),
                  )
                ],
              ),
            ),

            // balance
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                balance,
                style: TextStyle(fontSize: 20, color: Colors.grey[400]),
              ),
            ),

            // card code
            Padding(
              padding: const EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 10),
              child: Text("**** **** **** " + lastDigits.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      wordSpacing: 19,
                      color: Colors.white,
                      letterSpacing: 2
                  )),
            )
          ],
        ),
      ),
    );
  }
}
