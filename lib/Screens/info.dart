import 'package:flutter/material.dart';
import 'package:vpn_app/widget/navbar.dart';
import 'package:vpn_app/widget/widget.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Navbar(),
      appBar: AppBar(
        title: const Text("VPN"),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 10, 19),
          fontSize: 25,
          fontWeight: FontWeight.w300,
        ),
        backgroundColor: Colors.amber,
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Container(
              // height: MediaQuery.of(context).size.height,
              // height: MediaQuery.of(context).size.height,
              child: const logo(
                radius1: 50,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Center(
              child: Container(
                // height: MediaQuery.of(context).size.height ,
                width: MediaQuery.of(context).size.width - 20,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: const Padding(
                  padding: EdgeInsets.all(13.0),
                  child: Center(
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Welcome to our VPN app! We're glad you've chosen to use our service to enhance your online security and privacy. Below, you'll find important information about our app and its features:",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Secure Connection: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                            "We encrypt your internet connection, ensuring that your data is safe from hackers, snoopers, and other threats.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Anonymous Browsing: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                            "With our VPN, you can browse the web anonymously. Your IP address is masked, making it difficult for websites and advertisers to track your online activities.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0),
                          child: Text(
                            "Access Blocked Content: ",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                            "Our VPN allows you to access geo-restricted content and websites from anywhere in the world.",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Developed by ",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "Mian Husnain",
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
