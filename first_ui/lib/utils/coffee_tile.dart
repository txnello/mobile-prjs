import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String price;

  CoffeeTile({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black54
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //img
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image),
            ),

            // text
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey[700]),
                  )
                ],
              ),
            ),

            //price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(price),
                  Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(6)
                    ),
                    child: Icon(Icons.add),
                  )

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
