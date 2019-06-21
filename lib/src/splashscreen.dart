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
                    const Color.fromRGBO(105, 192, 201, 1),
                    const Color.fromRGBO(105, 192, 201, 1),
                  ],
                  tileMode:
                  TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
            ),
            SafeArea(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2)),
                    Image(image: AssetImage('assets/splash.png'), width: 250.0,),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}