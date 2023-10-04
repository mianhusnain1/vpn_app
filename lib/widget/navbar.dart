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
              ontap: () {})
        ],
      ),
      // appBar: AppBar(
      //   // ignore: prefer_const_constructors
      //   title: Text("Back"),
      // ),
      // body: Container(
      // child: Drawer(
      //   backgroundColor: Colors.white,
      //   child: Column(
      //     children: [
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       Container(
      //         child: const logo(radius1: 60),
      //       ),
      //       const SizedBox(
      //         height: 5,
      //       ),
      //       Container(
      //         child: const Text(
      //           "Key VPN",
      //           style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 27,
      //               fontWeight: FontWeight.w500),
      //         ),
      //       )
      //     ],
      //   ),
      // ),

      // child: Drawer(
      //   clipBehavior: Clip.none,
      //   child: ListView(
      //     children: [
      //       Container(
      //         child: Container(
      //           height: MediaQuery.of(context).size.height * 0.3,
      //           width: MediaQuery.of(context).size.width,
      //           decoration: BoxDecoration(
      //               color: Colors.amber,
      //               borderRadius: BorderRadius.circular(25)),
      //           child: Padding(
      //             padding: const EdgeInsets.all(60.0),
      //             child: Image.asset("images/logo.png"),
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: Padding(
      //           padding: const EdgeInsets.only(bottom: 1115.0),
      //           child: Container(
      //             alignment: Alignment.bottomCenter,
      //             child: Row(
      //               mainAxisAlignment: MainAxisAlignment.center,
      //               children: [
      //                 const Text(
      //                   "Developed by ",
      //                   style: TextStyle(
      //                     fontSize: 18,
      //                   ),
      //                 ),
      //                 InkWell(
      //                   onTap: () {},
      //                   child: const Text(
      //                     "Mian Husnain",
      //                     style: TextStyle(
      //                         color: Colors.amber,
      //                         fontSize: 20,
      //                         fontWeight: FontWeight.bold),
      //                   ),
      //                 )
      //               ],
      //             ),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),
      // ),
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
