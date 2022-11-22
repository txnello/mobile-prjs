// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:nice_bottom_bar/pages/cards.dart';
import 'package:nice_bottom_bar/pages/homepage.dart';

import '../pages/network.dart';
import '../pages/qrcode.dart';
import '../pages/settinges.dart';

class BottomBar extends StatelessWidget {
  final BuildContext context;
  final int currIdx;

  BottomBar({
    required this.context,
    required this.currIdx,
  });

  navigate(Widget page) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => page,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  onTap(int index) {
    if (index == 0) {
      navigate(HomePage());
    }
    if (index == 1) {
      navigate(Cards());
    }
    if (index == 2) {
      navigate(Qrcode());
    }
    if (index == 3) {
      navigate(Network());
    }
    if (index == 4) {
      navigate(Settings());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: currIdx == 0 ? Colors.black : Colors.grey, size: 35,), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card, color: currIdx == 1 ? Colors.black : Colors.grey, size: 35,), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner, color: currIdx == 2 ? Colors.black : Colors.grey, size: 35,), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.compare_arrows, color: currIdx == 3 ? Colors.black : Colors.grey, size: 35,), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.settings, color: currIdx == 4 ? Colors.black : Colors.grey, size: 35,), label: ""),
      ],
      onTap: onTap,
      currentIndex: currIdx,
    );
  }
}
