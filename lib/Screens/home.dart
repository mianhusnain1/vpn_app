// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:vpn_app/widget/model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
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

  List<GetModel> postList = [];
  Future<List<GetModel>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body
          .toString()); // we use a .tostring function to convert the responce into the string type
      for (Map<String, dynamic> i in data) {
        postList.add(GetModel.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
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
                  Positioned(
                    bottom: 10,
                    child: Container(
                      child: Expanded(
                        child: FutureBuilder(
                            future: getData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return const Text('Loading1');
                              } else {
                                // return const Text("data");

                                return ListView.builder(
                                    itemCount: postList.length,
                                    itemBuilder: (context, index) {
                                      return Text(
                                          postList[index].body.toString());
                                    });
                              }
                            }),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50)),
                        color: Colors.amber),
                  ),
                  Center(
                    child: Positioned(
                      top: 20,
                      child: Container(
                        child: Center(
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
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 100,
                                    backgroundColor: _isConnected
                                        ? Colors.green.withOpacity(0.5)
                                        : const Color.fromARGB(
                                                255, 130, 191, 241)
                                            .withOpacity(0.8),
                                  ),
                                  CircleAvatar(
                                      radius: 85,
                                      backgroundColor: _isConnected
                                          ? Colors.green.withOpacity(0.5)
                                          : const Color.fromARGB(
                                                  255, 100, 181, 247)
                                              .withOpacity(0.8)),
                                  CircleAvatar(
                                    radius: 70,
                                    backgroundColor: _isConnected
                                        ? Colors.green
                                        : Colors.blue,
                                    child: Text(
                                      _isConnected ? "Connected" : "Connect",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  CircleAvatar(
                                    radius: 70,
                                    child: ClipRRect(
                                      child: Image.asset(
                                        "assets/images/button.png",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 210.0),
                        child: Text(
                          _isConnected ? "Connected" : "Connect",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              shadows: [
                                BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 0),
                                    blurRadius: 10,
                                    spreadRadius: 20,
                                    blurStyle: BlurStyle.outer)
                              ]),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.3,
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Text(
                              _isConnected
                                  ? "$hourString : $minuteString : $secondString"
                                  : "",
                              style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Stack(
                children: [
                  Container(
                    child: Image.asset("assets/images/map.jpg"),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [data(), data()],
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [data(), data()],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  data() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.13,
      width: MediaQuery.of(context).size.width * 0.4,
      decoration: BoxDecoration(
          color: Colors.amber.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
