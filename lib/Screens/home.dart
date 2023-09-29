// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        // height: double.infinity,
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: const BoxDecoration(color: Colors.amber),
                  ),
                  Container(
                    child: const CircleAvatar(
                      radius: 200,
                      backgroundColor: Colors.amber,
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: InkWell(
                          onTap: () {
                            print("Hello");
                          },
                          child: const CircleAvatar(
                            radius: 90,
                            backgroundImage: AssetImage(
                              "images/button.png",
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 300.0),
                        child: Text(
                          "Connected",
                          style: TextStyle(color: Colors.black, fontSize: 25),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 430.0),
                      child: Image.asset("images/map.jpg"),
                    ),
                  ),
                  // Container(
                  //   height: MediaQuery.of(context).size.height,
                  //   // width: MediaQuery.of(context).size.width,
                  //   child: FittedBox(
                  //     fit: BoxFit.contain, // Adjust this to your needs
                  //     child: Image.asset(
                  //       "images/map.jpg",
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
