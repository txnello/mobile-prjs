import 'package:flutter/material.dart';

class ImageGrid extends StatelessWidget {
  final List images;

  ImageGrid({
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < images.length; i += 3)
        Row(
          children: [
            for (var j = i; j < images.length && j < i + 3; j++)
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                width: 128,
                child: ClipRRect(
                  child: Image.asset(images[j]),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
