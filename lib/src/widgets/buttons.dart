import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../styles/buttons.dart';
import '../styles/colors.dart';
import '../styles/containers.dart';
import '../styles/text.dart';

class DefaultButton extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final String text;
  const DefaultButton({
    this.width,
    this.height,
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? buttonWidth,
      height: height ?? buttonHeight,
      decoration: containerWithOrangeBorder.copyWith(color: primaryColor),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: textWhite,
        ),
      ),
    );
  }
}

class DefaultButtonWhite extends StatelessWidget {
  final double? width;
  final double? height;
  final VoidCallback onPressed;
  final String text;
  const DefaultButtonWhite({
    this.width,
    this.height,
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? buttonWidth,
      height: height ?? buttonHeight,
      decoration: containerWithOrangeBorder,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: DefaultText(
          text: text,
        ),
      ),
    );
  }
}

class EntryButton extends StatelessWidget {
  final double? width;
  final double? height;
  final double? widthSizedBoxLeft;
  final double? widthSizedBoxArrow;
  final double? borderRadiusBoxArrow;
  final String text;
  final double? fontSize;
  final ValueNotifier<bool> loading;
  final VoidCallback onPressed;
  const EntryButton({
    this.width,
    this.height,
    this.widthSizedBoxLeft,
    this.widthSizedBoxArrow,
    this.borderRadiusBoxArrow,
    required this.text,
    this.fontSize,
    required this.loading,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? buttonWidth,
      height: height ?? buttonHeight,
      decoration: containerWithOrangeBorder,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: buttonStyleDefault,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: widthSizedBoxLeft ?? 30,
            ),
            AnimatedBuilder(
              animation: loading,
              builder: (context, _) {
                return loading.value
                    ? SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          color: primaryColor,
                          strokeWidth: 1.5,
                        ),
                      )
                    : Text(
                        text,
                        style: defaultText.copyWith(
                          fontSize: fontSize,
                        ),
                      );
              },
            ),
            Container(
              width: widthSizedBoxArrow ?? 40,
              height: buttonHeight,
              decoration: containerWithOrangeBorder.copyWith(
                color: primaryColor,
              ),
              child: Icon(
                CupertinoIcons.right_chevron,
                color: white,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final ValueNotifier<bool> loading;
  final VoidCallback onPressed;
  const AnimatedButton({
    this.width,
    this.height,
    required this.text,
    required this.loading,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? buttonWidth,
      height: height ?? buttonHeight,
      decoration: containerWithOrangeBorder.copyWith(color: primaryColor),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: AnimatedBuilder(
          animation: loading,
          builder: (context, _) {
            return loading.value
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: white,
                      strokeWidth: 1.5,
                    ),
                  )
                : Text(
                    text,
                    style: textWhite,
                  );
          },
        ),
      ),
    );
  }
}

class AnimatedButtonIcon extends StatelessWidget {
  final double? width;
  final double? height;
  final ValueNotifier<bool> loading;
  final VoidCallback onPressed;
  const AnimatedButtonIcon({
    this.width,
    this.height,
    required this.loading,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? buttonWidth,
      height: height ?? buttonHeight,
      decoration: containerWithOrangeBorder.copyWith(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: AnimatedBuilder(
          animation: loading,
          builder: (context, _) {
            return loading.value
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: secondaryColor,
                      strokeWidth: 1.5,
                    ),
                  )
                : Icon(
                    CupertinoIcons.search,
                    color: secondaryColor,
                  );
          },
        ),
      ),
    );
  }
}

class AnimatedButtonIconBarCode extends StatelessWidget {
  final double? width;
  final double? height;
  final ValueNotifier<bool> loading;
  final VoidCallback onPressed;
  final ValueNotifier<bool>? barcode;
  const AnimatedButtonIconBarCode({
    this.width,
    this.height,
    required this.loading,
    required this.onPressed,
    this.barcode,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? buttonWidth,
      height: height ?? buttonHeight,
      decoration: containerWithOrangeBorder.copyWith(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: AnimatedBuilder(
          animation: loading,
          builder: (context, _) {
            return loading.value
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: secondaryColor,
                      strokeWidth: 1.5,
                    ),
                  )
                : barcode!.value
                    ? Icon(
                        CupertinoIcons.barcode_viewfinder,
                        color: secondaryColor,
                      )
                    : Icon(
                        CupertinoIcons.search,
                        color: secondaryColor,
                      );
          },
        ),
      ),
    );
  }
}
