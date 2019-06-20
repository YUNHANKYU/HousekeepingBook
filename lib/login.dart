import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.2),
                child: Column(
                  children: <Widget>[
                    Image(image: AssetImage('assets/Logo.png'),),
                    Padding(padding: EdgeInsets.only(top: 20.0)),
//                    Image(image: AssetImage('assets/Bboomm.png'),),
                  ],
                )
            ),
            Container(
                alignment: Alignment.center,
                child:
                    Image(image: AssetImage('assets/Bboomm.png'),),
            ),
            Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.18),
                child: Ink.image(image: AssetImage('assets/google_login_btn.png'),
                  fit: BoxFit.fill,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Home()),
                      );
                    },
                    child: Container(
                      height: 60.0,
                      width: 250.0,
                    ),
                  ),
                ),
            ),
          ],
        ),
      )
    );
  }
}
