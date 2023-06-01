import 'package:financial_management/screens/home_screen.dart';
import 'package:financial_management/screens/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  Widget body = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        inactiveColor: Colors.black54,
        icons: const [Icons.home, Icons.info],
        activeIndex: currentIndex,
        notchSmoothness: NotchSmoothness.smoothEdge,
        gapLocation: GapLocation.center,
        onTap: (index) {
          if (index == 0) {
            body = HomeScreen();
          } else {
            body = const InfoScreen();
          }
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: body,
    );
  }
}
