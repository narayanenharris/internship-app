import 'dart:async';
import 'package:app/pages/welcome_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const WelcomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 255, 0, 0),
                  Color.fromARGB(255, 255, 0, 0)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Center(
            child: Image.asset("assets/images/logo.png"),
          )
        ],
      ),
    );
  }
}
