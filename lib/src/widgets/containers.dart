import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tilapia_connect/src/index.dart';
import 'package:tilapia_connect/src/styles/buttons.dart';
import 'package:tilapia_connect/src/styles/containers.dart';
import 'package:tilapia_connect/src/styles/text.dart';

class HelloContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget child;
  const HelloContainer({
    required this.width,
    required this.height,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .8,
      height: height * .075,
      decoration: containerWithBorder.copyWith(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: width * .17,
            height: height * .075,
            decoration: containerWithBorder.copyWith(
              color: Colors.indigoAccent,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(
                logoApp,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: width * .6, child: child),
        ],
      ),
    );
  }
}

class ItemDashboard extends StatelessWidget {
  final double height;
  final IconData icon;
  final double? iconSize;
  final String text;
  final VoidCallback onPressed;
  const ItemDashboard({
    required this.height,
    required this.icon,
    this.iconSize,
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      decoration: containerWithBorderRadius.copyWith(
        borderRadius: BorderRadius.circular(15),
        color: Colors.indigoAccent,
      ),
      child: TextButton(
        style: buttonStyleDefault.copyWith(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FaIcon(
                    icon,
                    color: Colors.white,
                    size: 45,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              height: 40,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: textWhite.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InformativeCards extends StatelessWidget {
  final double height;
  final double width;
  final IconData icon;
  final double? iconSize;
  final String text;
  final VoidCallback onPressed;
  const InformativeCards({
    required this.height,
    required this.width,
    required this.icon,
    this.iconSize,
    required this.text,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * .8,
      decoration: containerWithBorderRadius.copyWith(
        borderRadius: BorderRadius.circular(15),
        color: Colors.indigoAccent,
      ),
      child: TextButton(
        style: buttonStyleDefault.copyWith(
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 70,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FaIcon(
                    icon,
                    color: Colors.white,
                    size: 45,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * .02,
            ),
            SizedBox(
              height: 40,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: textWhite.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
