// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:vpn_app/widget/navbar.dart';
import 'package:vpn_app/widget/widget.dart';

// ignore: must_be_immutable
class Home extends StatelessWidget {
  int _currentIndex = 1;
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text(
        //   "VPN",
        //   style: TextStyle(color: Colors.amber, fontSize: 40),
        // ),
      ),
      body: Container(
        child: BottomBar(currentIndex: _currentIndex),
      ),
    );
  }
}
