// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vpn_app/Screens/info.dart';
import 'package:vpn_app/widget/widget.dart';
// import 'package:vpn_app/Screens/info.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: const BoxDecoration(color: Colors.amber),
            child: const Column(
              children: [
                SizedBox(
                  height: 40,
                  child: Icon(
                    Icons.arrow_back,
                  ),
                ),
                logo(radius1: 50),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Key VPN",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          const ListTile(),
          _tile(
            leadingIcon: const Icon(Icons.credit_card),
            title: "Upgrade to Premium",
            ontap: () {
              Navigator.of(context).pop();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          _tile(
              title: "Server List",
              leadingIcon: const Icon(Icons.add),
              ontap: () {}),
          const SizedBox(
            height: 10,
          ),
          _tile(
              title: "Rate Us",
              leadingIcon: const Icon(Icons.star),
              ontap: () {}),
          const SizedBox(
            height: 10,
          ),
          _tile(
              title: "About Us",
              leadingIcon: const Icon(Icons.info),
              ontap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Info(),
                    ));
              }),
          const SizedBox(
            height: 10,
          ),
          _tile(
              title: "Setting",
              leadingIcon: const Icon(Icons.settings),
              ontap: () {}),
        ],
      ),
    );
  }
}

class _tile extends StatelessWidget {
  const _tile({
    super.key,
    required this.title,
    required this.leadingIcon,
    required this.ontap,
  });
  final String title;
  final Icon leadingIcon;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
            color: Colors.amber, borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          leading: leadingIcon,
          trailing: const Icon(Icons.arrow_forward_ios),
          title: Text(
            title,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
