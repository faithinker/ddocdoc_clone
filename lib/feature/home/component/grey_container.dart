import 'package:flutter/material.dart';

class GreyContainer extends StatelessWidget {
  final double imageWidth;
  final double height;
  final Widget child;
  final double containerHorizontal;

  const GreyContainer({
    Key? key,
    required this.imageWidth,
    this.height = 80,
    required this.child,
    this.containerHorizontal = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: imageWidth,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black.withOpacity(0.1)),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: containerHorizontal),
          child: child,
        ));
  }
}