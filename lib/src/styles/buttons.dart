import 'package:flutter/material.dart';

double buttonWidth = 145;
double buttonHeight = 40;

final ButtonStyle buttonStyleDefault = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
    EdgeInsets.zero,
  ),
);
