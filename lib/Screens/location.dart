import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
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
        itemBuilder: (context, i) => Column(
              children: [
                Container(
                  child: Text("Now ${_controller.list.length} are available."),
                ),
                _vpntile(
                    title: _controller.list[i].hostname,
                    leadingIcon: Icon(Icons.person),
                    ontap: () {})
              ],
            )
        //  ListTile(
        //       title: Text(_controller.list[i].hostname),)
        );
  }
}

class _vpntile extends StatelessWidget {
  const _vpntile({
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
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 212, 83),
              borderRadius: BorderRadius.circular(20)),
          child: ListTile(
            leading: leadingIcon,
            trailing: const Icon(Icons.arrow_forward_ios),
            title: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
