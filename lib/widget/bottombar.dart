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
  int _currentIndex = 1;

  final List<Widget> _pages = [
    const Favorite(),
    const Home(),
    const Setting()
    // Replace these with your actual screens
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 6, right: 6, bottom: 6, top: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(blurRadius: 25, color: Colors.grey.withOpacity(0.5))
            ]),
        child: BottomNavigationBar(
            selectedItemColor: Colors.white,
            currentIndex: _currentIndex,
            backgroundColor: Colors.amber,
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
              size: 26,
            ),
            onTap: (value) {
              setState(() {
                _currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                  ),
                  label: "Favorite"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                  ),
                  label: "Setting")
            ]),
      ),
      // backgroundColor: Colors.amber,
      // body: Container(
      //   child: Stack(children: <Widget>[
      //     PageView(
      //       controller: _pageController,
      //       children: _pages,
      //       onPageChanged: (index) {
      //         setState(() {
      //           _currentIndex = index;
      //         });
      //       },
      //     ),
      //     Positioned(
      //       bottom: 0,
      //       left: 0,
      //       right: 0,
      //       child: CurvedNavigationBar(
      //         color: Colors.amber,
      //         backgroundColor: Colors.white,
      //         animationDuration: const Duration(milliseconds: 300),
      //         height: 65,
      //         items: const <Widget>[
      //           Icon(
      //             Icons.favorite,
      //             color: Colors.black,
      //           ),
      //           Icon(Icons.home),
      //           Icon(Icons.settings)
      //         ],
      //         onTap: (index) {
      //           setState(() {
      //             _currentIndex = index;
      //           });
      //           _pageController.animateToPage(
      //             index,
      //             duration: const Duration(milliseconds: 200),
      //             curve: Curves.bounceIn,
      //           );
      //         },
      //         index: _currentIndex,
      //       ),
      //     ),
      //   ]),
      // ),
      body: _pages[_currentIndex],
    );
  }
}
