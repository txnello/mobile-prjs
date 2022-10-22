import 'package:flutter/material.dart';

class PaymentsHistoryTile extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  PaymentsHistoryTile({
    required this.image,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //img
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Container(
                height: 25,
                width: 25,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(image),
                ),
              ),
            ),
            SizedBox(height: 30,),

            // price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 8,
                    color: Colors.grey
                  ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 8),
              child: Text(price),
            )
          ],
        ),
      ),
    );
  }
}
