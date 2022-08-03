import 'package:app/pages/SubscriptionPage.dart';
import 'package:app/pages/home.dart';
import 'package:flutter/material.dart';
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
    );
  }
}
