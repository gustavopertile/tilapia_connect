import 'package:flutter/material.dart';
import '../styles/containers.dart';
import '../styles/text.dart';

class Weather extends StatelessWidget {
  final double width;
  final bool showInputCity;
  final VoidCallback onPressed;
  final Widget temp;
  final Widget inputCity;
  const Weather({
    required this.width,
    required this.showInputCity,
    required this.onPressed,
    required this.temp,
    required this.inputCity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              !showInputCity
                  ? SizedBox(
                      height: 22,
                      child: Text(
                        '',
                        style: textWhite.copyWith(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  : Container(),
              showInputCity ? inputCity : temp,
            ],
          ),
          Container(
            width: 40,
            height: 40,
            decoration: containerWithBorder.copyWith(borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: IconButton(
              iconSize: 23,
              padding: EdgeInsets.zero,
              onPressed: () {
                onPressed();
              },
              icon: Icon(showInputCity ? Icons.search_off : Icons.search, color: Colors.grey.shade600),
            ),
          )
        ],
      ),
    );
  }
}
