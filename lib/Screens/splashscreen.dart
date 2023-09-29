import 'dart:async';
import 'package:flutter/material.dart';
import 'package:vpn_app/Screens/home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// import 'package:vpn_app/main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SizedBox(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 300,
              ),
              SizedBox(
                height: 120,
                width: 120,
                child: Image.asset("images/logo.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: const SpinKitFadingCircle(
                  color: Colors.white,
                  size: 38,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
