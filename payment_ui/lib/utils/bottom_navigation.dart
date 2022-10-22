import 'package:flutter/material.dart';
import 'package:payment_ui/screens/home_page.dart';

import '../screens/super_cards.dart';

class BottomNavigationBuilder extends StatelessWidget {
  final BuildContext context;
  final int currIdx;

  BottomNavigationBuilder({
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
      navigate(SuperCards());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.compare_arrows), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: ""),
      ],
      onTap: onTap,
      currentIndex: currIdx,
    );
  }
}
