// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:vpn_app/Screens/info.dart';
import 'package:vpn_app/widget/navbar.dart';
import 'package:vpn_app/widget/bottombar.dart';

// ignore: must_be_immutable
class Shifter extends StatelessWidget {
  // int _currentIndex = 1;
  const Shifter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.amber,
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Text("VPN"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Info(),
                  ));
            },
            icon: Icon(Icons.info),
          )
        ],
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 10, 19),
          fontSize: 25,
          fontWeight: FontWeight.w300,
        ),
        backgroundColor: Colors.amber,
        // title: Text(
        //   "VPN",
        //   style: TextStyle(color: Colors.amber, fontSize: 40),
        // ),
      ),
      body: Container(
        child: const Bottombar(),
      ),
    );
  }
}
