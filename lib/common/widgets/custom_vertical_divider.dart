import 'package:airport/common/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomVerticalDivider extends StatelessWidget {
  final Color color;
  final double height;

  const CustomVerticalDivider(
      {Key? key, this.color = mainColor, this.height = 1})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2.0,
      height: height,
      decoration: BoxDecoration(border: Border.all(color: color)),
    );
  }
}
