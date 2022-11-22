import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:nice_bottom_bar/utils/bottom_bar.dart';

class Qrcode extends StatefulWidget {
  const Qrcode({super.key});

  @override
  State<Qrcode> createState() => _QrcodeState();
}

class _QrcodeState extends State<Qrcode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nice Bottom Bar"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomBar(
        context: context,
        currIdx: 2,
      ),
      body: Center(
        child: Text("Qrcode"),
      ),
    );
  }
}
