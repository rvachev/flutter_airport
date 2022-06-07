import 'dart:math';

import 'package:flutter/material.dart';

class FlipCard extends StatefulWidget {
  final Widget frontSide;
  final Widget rearSide;
  final bool showFrontSide;
  final bool isFlippible;

  const FlipCard(
      {Key? key,
      required this.frontSide,
      required this.rearSide,
      this.showFrontSide = true,
      this.isFlippible = true})
      : super(key: key);

  @override
  State<FlipCard> createState() => _FlipCardState();
}

class _FlipCardState extends State<FlipCard> {
  late bool _isFrontSideShowed;

  @override
  void initState() {
    _isFrontSideShowed = widget.showFrontSide;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isFlippible
          ? () => setState(() => _isFrontSideShowed = !_isFrontSideShowed)
          : null,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 600),
        transitionBuilder: _transitionBuilder,
        layoutBuilder: (widget, list) => Stack(
          children: [widget!, ...list],
        ),
        switchInCurve: Curves.easeInBack,
        switchOutCurve: Curves.easeOutBack,
        child: _isFrontSideShowed
            ? _buildValueForm(
                key: const ValueKey(true), widget: widget.frontSide)
            : _buildValueForm(
                key: const ValueKey(false), widget: widget.rearSide),
      ),
    );
  }

  Widget _buildValueForm({required Key key, required Widget widget}) {
    return Container(
      key: key,
      child: widget,
    );
  }

  Widget _transitionBuilder(Widget widget, Animation<double> animation) {
    final rotateAnim = Tween(begin: pi, end: 0.0).animate(animation);
    return AnimatedBuilder(
      animation: rotateAnim,
      child: widget,
      builder: (context, widget) {
        final isUnder = (ValueKey(_isFrontSideShowed) != widget?.key);
        var tilt = ((animation.value - 0.5).abs() - 0.5) * 0.003;
        tilt *= isUnder ? -1.0 : 1.0;
        final value =
            isUnder ? min(rotateAnim.value, pi / 2) : rotateAnim.value;
        return Transform(
          transform: Matrix4.rotationY(value)..setEntry(3, 0, tilt),
          child: widget,
          alignment: Alignment.center,
        );
      },
    );
  }
}
