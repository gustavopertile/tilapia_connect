import 'package:flutter/material.dart';
import 'package:tilapia_connect/src/styles/colors.dart';

final InputDecoration loginInput = InputDecoration(
  contentPadding: const EdgeInsets.only(left: 20),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: primaryColor,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: secondaryColor,
    ),
  ),
);
