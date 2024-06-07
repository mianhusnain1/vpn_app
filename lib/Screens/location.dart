import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:vpn_app/Model/Apimodel.dart';
import 'package:vpn_app/controllers/location_controller.dart';
import 'package:vpn_app/widget/widget.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  final _controller = LocationController();

  @override
  void initState() {
    super.initState();
    _controller.getVpnData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Obx(() => _controller.isLoading.value
            ? loadingwidget(context, "Servers are loading...",
                "assets/lottie/AnimationServers.json")
            : _controller.list.isEmpty
                ? _empty(context)
                : _VpnData()));
  }

  _empty(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/nothing.svg",
            theme: SvgTheme(currentColor: Colors.amber),
            width: MediaQuery.of(context).size.width * 0.2,
          ),
          const SizedBox(
            height: 1,
          ),
          const Text(
            "Unfortunately, No VPN Found!",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, color: Colors.grey),
          )
        ],
      ),
    );
  }

// ignore: non_constant_identifier_names
  _VpnData() {
    return ListView.builder(
        itemCount: _controller.list.length,
        itemBuilder: (context, i) => VpnCard(vpn: _controller.list[i])
        //  ListTile(
        //       title: Text(_controller.list[i].hostname),)
        );
  }
}

class VpnCard extends StatelessWidget {
  final Vpn vpn;
  const VpnCard({super.key, required this.vpn});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ListTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Text(
            vpn.countryLong,
          ),
          subtitle: Row(
            children: [
              const Icon(
                Icons.speed_rounded,
                color: Colors.blue,
                size: 20,
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                vpn.speed.toString(),
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
          trailing: Row(
            children: [
              Text(
                vpn.numVpnSessions.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: Colors.black54),
              ),
              const SizedBox(),
              const Icon(
                Icons.person_3,
                color: Colors.blue,
              )
            ],
          )),
    );
  }
}
