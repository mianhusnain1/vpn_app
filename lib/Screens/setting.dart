import 'package:flutter/material.dart';
import 'package:vpn_app/widget/widget.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: BottomBar(currentIndex: 2)),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "Setting",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
