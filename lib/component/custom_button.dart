import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const CustomButton(
      {super.key,
      required this.text,
      required this.backgroundColor,
      this.width,
      this.height,
      this.textStyle,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? MediaQuery.of(context).size.width - 40,
      height: height ?? 50,
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: backgroundColor,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: textStyle ?? const TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
