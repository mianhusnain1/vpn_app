// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _startTimer();
  }

  bool _isConnected = false;
  Timer? _timer;
  String hourString = "00", minuteString = "00", secondString = "00";
  int hours = 0, minutes = 0, seconds = 0;
  String connection = "Disconnected";
  void _connection() {
    if (_isConnected == false) {
      setState(() {
        connection = "Connected";
        _isConnected = true;
      });
    } else if (_isConnected == true) {
      setState(() {
        connection = "Disconnected";
        _isConnected = false;
      });
    } else {}
  }

  void _startTimer() {
    if (_timer == null) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _startSeconds();
          _isConnected = true;
        });
      });
    } else {
      _timer!.cancel();
      _timer = null;
      setState(() {
        hours = 0;
        minutes = 0;
        seconds = 0;
        hourString = "00";
        minuteString = "00";
        secondString = "00";
      });
    }
  }

  void _startSeconds() {
    if (seconds < 59) {
      seconds = seconds + 1;
      secondString = seconds.toString();
      if (secondString.length == 1) {
        secondString = "0$secondString";
      }
    } else {
      _startMinutes();
    }
  }

  void _startMinutes() {
    setState(() {
      if (minutes < 59) {
        seconds = 0;
        secondString = "00";
        minutes = minutes + 1;
        minuteString = minutes.toString();
        if (minuteString.length == 1) {
          minuteString = "0$minuteString";
        }
      } else {
        _startHour();
      }
    });
  }

  void _startHour() {
    setState(() {
      minutes = 0;
      seconds = 0;
      minuteString = "00";
      hours = hours + 1;
      hourString = hours.toString();
      if (hourString.length == 1) {
        hourString = "0$hourString";
      }
    });
  }

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
                            _startTimer();
                            _connection();
                            print("Hello");
                            if (_isConnected == false) {
                              print('Connected');
                            } else {
                              print('Disconnected');
                            }
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
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 300.0),
                        child: Text(
                          "$connection",
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
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.4,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              "$hourString : $minuteString : $secondString",
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            )),
                      ],
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
