import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:github/src/pages/home/Home.dart';

class Nav extends StatefulWidget {
  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int _page = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _page == 0 ? Home() : Text("Outro"),
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (value) => setState(() {
          _page = value;
        }),
        color: Colors.black,
        backgroundColor: Colors.white,
        height: 45,
        items: [
          Icon(Icons.home, size: 24, color: Colors.white),
          Icon(Icons.person, size: 24, color: Colors.white),
        ],
      ),
    );
  }
}
