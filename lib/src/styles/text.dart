import 'package:flutter/material.dart';
import 'colors.dart';

final TextStyle defaultText = TextStyle(
  color: secondaryColor,
);

final TextStyle textWhite = TextStyle(
  color: white,
);

class DefaultText extends StatelessWidget {
  final String text;
  const DefaultText({
    required this.text,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: secondaryColor,
      ),
    );
  }
}
