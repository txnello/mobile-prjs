import 'package:flutter/material.dart';

class CardTile extends StatelessWidget {
  final Color color;
  final String imagePath;
  final int code;
  final String balance;
  final String cardType;

  CardTile({
    required this.color,
    required this.imagePath,
    required this.code,
    required this.balance,
    required this.cardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 8),
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12)),
        width: 170,
        child: Padding(
          padding:
          const EdgeInsets.only(left: 15, top: 7, bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Image.asset(
                  imagePath,
                  width: 60,
                ),
              ),
              Text(
                "****" + code.toString(),
                style: TextStyle(fontSize: 17),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    balance,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    cardType,
                    style: TextStyle(
                        fontSize: 12, color: Colors.grey[400]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
