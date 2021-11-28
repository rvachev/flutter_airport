import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  final Color color;
  final double width;

  const CustomDivider({Key? key, this.color = Colors.black, this.width = 2})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: color, width: width))),
    );
  }
}
