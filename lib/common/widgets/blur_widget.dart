import 'package:flutter/material.dart';

class Blur extends StatelessWidget {
  final Color coverColor;
  final double height;
  final int colorOpacity;
  final Widget child;

  const Blur(
      {Key? key,
      required this.coverColor,
      this.height = 50,
      this.colorOpacity = 128,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        child,
        Container(
          height: height,
          width: double.infinity,
          color: coverColor.withAlpha(colorOpacity),
        ),
      ],
    );
  }
}
