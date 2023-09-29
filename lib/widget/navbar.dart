import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(25)),
              child: Padding(
                padding: const EdgeInsets.all(60.0),
                child: Image.asset("images/logo.png"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
