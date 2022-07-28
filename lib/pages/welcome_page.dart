import 'package:flutter/material.dart';
import 'package:app/pages/member_login.dart';
import 'package:app/pages/business_login.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

  final ButtonStyle buttonStyle = TextButton.styleFrom(
    primary: Colors.red,
    backgroundColor: Colors.white,
    fixedSize: const Size(150, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  void onMemberLoginPress(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => MemberLoginPage()),
    );
  }

  void onBusinessLoginPress(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => BusinessLoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Create some space below the logo
              const SizedBox(
                width: 200.0,
                height: 300.0,
                child: null,
              ),
              TextButton(
                onPressed: () => onMemberLoginPress(context),
                style: buttonStyle,
                child: const Text(
                  "Member Login",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              TextButton(
                onPressed: () => onBusinessLoginPress(context),
                style: buttonStyle,
                child: const Text(
                  "Business Login",
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
