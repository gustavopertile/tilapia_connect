import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../styles/colors.dart';
import '../styles/inputs.dart';
import '../styles/text.dart';
import 'buttons.dart';

class Input extends StatelessWidget {
  final double width;
  final double? height;
  final TextEditingController controller;
  final TextInputType inputType;
  final String label;
  final bool? autoCorrect;
  final VoidCallback onChanged;
  const Input({
    required this.width,
    this.height,
    required this.controller,
    required this.inputType,
    required this.label,
    this.autoCorrect,
    required this.onChanged,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 45,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        autocorrect: autoCorrect ?? false,
        cursorColor: primaryColor,
        onChanged: (_) {
          onChanged();
        },
        decoration: loginInput.copyWith(
          labelText: label,
          floatingLabelStyle: TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}

class InputMask extends StatelessWidget {
  final double width;
  final double? height;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputFormatter inputFormatter;
  final String label;
  const InputMask({
    required this.width,
    this.height,
    required this.controller,
    required this.inputType,
    required this.inputFormatter,
    required this.label,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height ?? 45,
      child: TextFormField(
        controller: controller,
        inputFormatters: [
          inputFormatter,
        ],
        keyboardType: inputType,
        cursorColor: primaryColor,
        decoration: loginInput.copyWith(
          labelText: label,
          floatingLabelStyle: TextStyle(color: primaryColor),
        ),
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  final double width;
  final double? height;
  final TextEditingController controller;
  final TextInputType inputType;
  final String? label;
  final bool passwordVisible;
  final VoidCallback onPressed;
  const PasswordInput({
    required this.width,
    this.height,
    required this.controller,
    required this.inputType,
    required this.passwordVisible,
    this.label,
    required this.onPressed,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 45,
      child: TextFormField(
        controller: controller,
        enableSuggestions: false,
        autocorrect: false,
        keyboardType: inputType,
        cursorColor: primaryColor,
        obscureText: !passwordVisible,
        decoration: loginInput.copyWith(
          labelText: label ?? 'Senha',
          floatingLabelStyle: TextStyle(color: primaryColor),
          suffixIcon: IconButton(
            icon: Icon(
              passwordVisible ? Icons.visibility : Icons.visibility_off,
              color: secondaryColor.withOpacity(0.8),
            ),
            onPressed: () {
              onPressed();
            },
          ),
        ),
      ),
    );
  }
}

class InputSearch extends StatelessWidget {
  final double width;
  final double? height;
  final TextEditingController controller;
  final TextInputType inputType;
  final String label;
  final bool? autoCorrect;
  final double? widthButton;
  final double? heightButton;
  final ValueNotifier<bool> loading;
  final VoidCallback onPressed;
  const InputSearch({
    required this.width,
    this.height,
    required this.controller,
    required this.inputType,
    required this.label,
    this.autoCorrect,
    required this.widthButton,
    required this.heightButton,
    required this.loading,
    required this.onPressed,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: width,
          height: height ?? 45,
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            autocorrect: autoCorrect ?? false,
            cursorColor: primaryColor,
            style: defaultText,
            cursorHeight: 14,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10, bottom: 0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              labelText: label,
              labelStyle: TextStyle(color: secondaryColor),
              floatingLabelStyle: TextStyle(color: primaryColor),
            ),
          ),
        ),
        AnimatedButtonIcon(
          onPressed: () {
            onPressed();
          },
          height: heightButton,
          width: widthButton,
          loading: loading,
        ),
      ],
    );
  }
}

class InputSearchBarCode extends StatelessWidget {
  final double width;
  final double? height;
  final TextEditingController controller;
  final TextInputType inputType;
  final String label;
  final bool? autoCorrect;
  final double? widthButton;
  final double? heightButton;
  final ValueNotifier<bool> loading;
  final ValueNotifier<bool> barcode;
  final VoidCallback onPressed;
  final VoidCallback onChanged;
  const InputSearchBarCode({
    required this.width,
    this.height,
    required this.controller,
    required this.inputType,
    required this.label,
    this.autoCorrect,
    required this.widthButton,
    required this.heightButton,
    required this.loading,
    required this.barcode,
    required this.onPressed,
    required this.onChanged,
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: width,
          height: height ?? 45,
          child: TextFormField(
            controller: controller,
            keyboardType: inputType,
            autocorrect: autoCorrect ?? false,
            cursorColor: primaryColor,
            style: defaultText,
            cursorHeight: 14,
            onChanged: (_) {
              onChanged();
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 10, bottom: 0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              labelText: label,
              labelStyle: TextStyle(
                color: secondaryColor,
                fontSize: 15,
              ),
              floatingLabelStyle: TextStyle(color: primaryColor),
            ),
          ),
        ),
        AnimatedButtonIconBarCode(
          onPressed: () {
            onPressed();
          },
          height: heightButton,
          width: widthButton,
          loading: loading,
          barcode: barcode,
        ),
      ],
    );
  }
}
