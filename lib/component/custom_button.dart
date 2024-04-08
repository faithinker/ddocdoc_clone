import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final Color frontColor;
  final Color backgroundColor;
  final List<double>? dimensions;
  final EdgeInsetsGeometry? edge;
  final double? textSize;
  final double? corner;
  final BoxBorder? border;
  final VoidCallback onTap;

  const CustomButton({
    super.key,
    this.icon,
    required this.text,
    this.frontColor = Colors.black,
    required this.backgroundColor,
    this.dimensions,
    this.edge,
    this.textSize,
    this.corner,
    this.border,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    double? width;
    double? height;

    if (dimensions != null) {
      width = dimensions![0];
      height = dimensions![1];
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        padding: edge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(corner ?? 10),
            color: backgroundColor,
            border: border),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                color: frontColor,
                size: 20,
              ),
              const SizedBox(width: 5),
            ],
            Text(
              text,
              style: TextStyle(fontSize: textSize ?? 15, color: frontColor),
            ),
          ],
        ),
      ),
    );
  }
}
