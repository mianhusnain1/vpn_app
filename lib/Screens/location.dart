import 'package:flutter/material.dart';
import 'package:vpn_app/Apis/api.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  void initState() {
    API.getVpnServer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(),
            child: Image.asset(
              "assets/images/map.jpg",
            ),
            // width: MediaQuery.of(context).size.width,
          ),
          Container(
              height: 100,
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                "hello Wolds",
                style: TextStyle(color: Colors.black),
              )),
        ]),
      ),
    );
  }
}
