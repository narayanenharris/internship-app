import 'package:flutter/material.dart';

ButtonStyle buttonStyle = TextButton.styleFrom(
  backgroundColor: const Color.fromARGB(255, 255, 0, 0),
  fixedSize: const Size(160, 36),
  padding: const EdgeInsets.symmetric(horizontal: 18.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  ),
);

final ButtonStyle buttonStyleRed = TextButton.styleFrom(
  backgroundColor: Colors.white,
  fixedSize: const Size(160, 36),
  padding: const EdgeInsets.symmetric(horizontal: 18.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  ),
);
