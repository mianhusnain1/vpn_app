import 'package:flutter/material.dart';

import 'package:vpn_app/Apis/api.dart';
import 'package:vpn_app/widget/widget.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  bool _location = false;
  void initState() {
    API.getVpnServer();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: _location
            ? Center(
                child: Stack(children: [
                  Container(
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      "assets/images/map.jpg",
                    ),
                    // width: MediaQuery.of(context).size.width,
                  ),
                ]),
              )
            : loadingwidget(
                context, "servers", "assets/lottie/AnimationServers.json"));
  }
}
