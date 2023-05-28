// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CartCell extends StatelessWidget {
  final String brand;
  final String title;
  final String subtitle;
  final String promotext;
  final String price;

  const CartCell({super.key, required this.brand, required this.title, required this.subtitle, required this.promotext, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // text column
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // brand
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  brand,
                                  style: TextStyle(fontSize: 18),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 18,
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox()
                      ],
                    ),
                    SizedBox(height: 10),

                    // title
                    Text(
                      title,
                      style: TextStyle(fontSize: 19),
                    ),
                    SizedBox(height: 6),

                    // subtitle
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                    SizedBox(height: 6),

                    // promo
                    Text(
                      promotext,
                      style: TextStyle(color: Colors.red[400], fontSize: 12),
                    ),
                  ],
                ),
              ),

              // img
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                    child: Image.asset('assets/images/product.png'),
                  ),

                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: Text(price,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
