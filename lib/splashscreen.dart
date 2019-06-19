import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void navigateHome() {
    Navigator.pop(context);
  }

  @override
  void initState() {
    Timer(Duration(seconds: 3, milliseconds: 500), navigateHome);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  // 10% of the width, so there are ten blinds.
                  colors: [
                    const Color.fromRGBO(169, 237, 112, 1),
                    const Color.fromRGBO(245, 243, 106, 1)
                  ],
                  tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
            ),
            SafeArea(
              child: Center(
                  child: Material(
                    color: Colors.transparent,
                    child: Text(
                      "Bbumm",
                      style: TextStyle(
                          fontSize: 75.0,
                          color: Colors.white,
                          fontFamily: 'Nanum Gothic',
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic),
                    ),
                  )),
            ),
          ],
        ));
  }
}