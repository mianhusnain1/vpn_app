import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:vpn_app/widget/widget.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          decoration: BoxDecoration(),
          child: Image.asset(
            "assets/images/map.jpg",
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
