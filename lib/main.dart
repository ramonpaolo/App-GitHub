//---- Packages
import 'package:flutter/material.dart';
import 'package:simple_splashscreen/simple_splashscreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

//---- Screens
import 'package:github/src/auth/Login.dart';

void main() {
  runApp(MaterialApp(
    home: Index(),
    title: "GitHub",
  ));
}

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  @override
  Widget build(BuildContext context) {
    return Simple_splashscreen(
        context: context,
        splashscreenWidget: SplashScreen(),
        gotoWidget: Login(),
        timerInSeconds: 3);
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            "assets/github.svg",
            width: size.width * 0.8,
          ),
          Divider(
            color: Colors.white,
          ),
          Center(
              child: Text(
            "GitHub",
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }
}
