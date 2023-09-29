import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:vpn_app/Screens/favorite.dart';
// import 'package:vpn_app/Screens/home.dart';
import 'package:vpn_app/Screens/home.dart';
import 'package:vpn_app/Screens/setting.dart';
// import 'package:vpn_app/Screens/splashscreen.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  final List<Widget> _pages = [
    const Favorite(),
    const Home(),
    const Setting()
    // Replace these with your actual screens
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        child: Stack(children: <Widget>[
          PageView(
            controller: _pageController,
            children: _pages,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CurvedNavigationBar(
              color: Colors.amber,
              backgroundColor: Colors.white,
              animationDuration: const Duration(milliseconds: 300),
              height: 65,
              items: const <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.black,
                ),
                Icon(Icons.home),
                Icon(Icons.settings)
              ],
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.bounceIn,
                );
              },
              index: _currentIndex,
            ),
          ),
        ]),
      ),
    );
  }
}
