import 'dart:async';
import 'package:app/pages/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(SplashScreen());
}

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = Duration(seconds: 4);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return initWidget(context);
  }

  Widget initWidget(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                gradient: LinearGradient(colors: [
                  (Color.fromARGB(255, 255, 0, 0)),
                  Color.fromARGB(255, 255, 0, 0)
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
          Center(
            child: Container(
              child: Image.asset("assets/images/logo.png"),
            ),
          )
        ],
      ),
    );
  }
}
