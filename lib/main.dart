import 'package:flutter/material.dart';
import 'package:app/pages/welcome_page.dart';
import 'package:app/pages/member_login.dart';
import 'package:app/pages/member_signup.dart';
import 'package:app/pages/business_login.dart';
import 'package:app/pages/business_signup.dart';
import 'package:app/pages/otp_verify.dart';
import 'package:app/pages/home.dart';
import 'package:app/pages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
        primaryColor: const Color.fromARGB(255, 255, 0, 0),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color.fromARGB(255, 255, 0, 0),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        'welcome': (context) => const WelcomePage(),
        'member-login': (context) => MemberLoginPage(),
        'member-register': (context) => MemberSignupPage(),
        'business-login': (context) => BusinessLoginPage(),
        'business-register': (context) => BusinessSignupPage(),
        'otp': (context) => const OtpVerifyPage(),
        'home': (context) => const HomePage()
      },
      initialRoute: 'welcome',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
