import 'package:flutter/material.dart';
import 'package:vpn_app/widget/navbar.dart';
import 'package:vpn_app/widget/widget.dart';

class Coming extends StatelessWidget {
  const Coming({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Navbar(),
        appBar: AppBar(
          title: const Text("VPN"),
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Color.fromARGB(255, 0, 10, 19),
            fontSize: 25,
            fontWeight: FontWeight.w300,
          ),
          backgroundColor: Colors.amber,
        ),
        backgroundColor: Colors.white,
        body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                // height: MediaQuery.of(context).size.height,
                // height: MediaQuery.of(context).size.height,
                child: const logo(
                  radius1: 50,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                // height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width - 40,

                child: const Text(
                  "This Feather will be available soon....",
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
              ),
            ])));
  }
}
