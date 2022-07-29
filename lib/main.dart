import 'package:app/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:app/pages/welcome_page.dart';
import 'package:app/pages/member_login.dart';
import 'package:app/pages/member_signup.dart';
import 'package:app/pages/business_login.dart';
import 'package:app/pages/business_signup.dart';
import 'package:app/pages/otp_verify.dart';
import 'package:app/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      initialRoute: 'welcome',
      theme: ThemeData(primaryColor: Colors.red),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        'welcome': (context) => WelcomePage(),
        'member-login': (context) => MemberLoginPage(),
        'member-register': (context) => MemberSignupPage(),
        'business-login': (context) => BusinessLoginPage(),
        'business-register': (context) => BusinessSignupPage(),
        'otp': (context) => const OtpVerifyPage(),
        'home': (context) => const HomePage()
      },
    );
  }
}
