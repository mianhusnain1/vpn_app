import 'package:flutter/material.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(),
          child: Image.asset(
            "images/map.jpg",
          ),
          // width: MediaQuery.of(context).size.width,
        ),
      ),

      // appBar: AppBar(
      //   backgroundColor: Colors.amber,
      //   title: const Text(
      //     "Setting",
      //     style: TextStyle(
      //         color: Colors.black, fontSize: 25, fontWeight: FontWeight.w300),
      //   ),
      // ),
    );
  }
}
