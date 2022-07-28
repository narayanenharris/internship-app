import 'package:flutter/material.dart';

final ButtonStyle buttonStyle = TextButton.styleFrom(
  backgroundColor: Colors.red,
  fixedSize: const Size(160, 36),
  padding: const EdgeInsets.symmetric(horizontal: 18.0),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
  ),
);
