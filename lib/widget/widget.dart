import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:vpn_app/Screens/home.dart';
import 'package:vpn_app/Screens/setting.dart';
import 'package:vpn_app/Screens/splashscreen.dart';

// import 'package:vpn_app/Screens/shifter.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required int currentIndex,
  }) : _currentIndex = currentIndex;

  final int _currentIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.amber,
        animationDuration: const Duration(milliseconds: 300),
        height: 65,
        items: const <Widget>[
          Icon(Icons.favorite, size: 30),
          Icon(Icons.home, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Splash(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
              break;
            case 1:
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      Home(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            case 2:
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Setting(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;
                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);
                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            default:
          }

          //Handle button tap
        },
        index: _currentIndex,
      ),
      backgroundColor: Colors.amber,
      body: Container(
        height: double.infinity,
        width: MediaQuery.of(context).size.width,
      ),
    );
  }
}

// class logo extends StatelessWidget {
//   const logo({
//     Key? key, required this.radius1,
//   });
//   final int radius1;
//   @override
//   Widget build(BuildContext context) {
//     double doubleValue = radius1.toDouble();
//     return const SizedBox(
//       child: CircleAvatar(
//         radius: doubleValue,
//         backgroundImage: AssetImage("images/logo.png"),
//         // child: Image.asset("images/logo.png"),
//       ),
//     );
//   }
// }
class logo extends StatelessWidget {
  const logo({
    Key? key,
    required this.radius1,
  }) : super(key: key);

  final int radius1;

  @override
  Widget build(BuildContext context) {
    double doubleValue = radius1.toDouble();
    return SizedBox(
      child: CircleAvatar(
        radius: doubleValue,
        backgroundImage: AssetImage("assets/images/logo.png"),
      ),
    );
  }
}

loadingwidget(BuildContext context, String text, String assets) => SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            assets,
          ),
          Text(
            text,
            style: TextStyle(
                color: Colors.amber, fontSize: 20, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
