import 'package:airport/common/styles/colors.dart';
import 'package:flutter/material.dart';

class CounterPageSwitcher extends StatefulWidget {
  final int count;
  final int currentPage;
  final void Function(int) onNextButtonPressed;
  final void Function(int) onPreviousButtonPressed;

  const CounterPageSwitcher(
      {Key? key,
      required this.count,
      required this.currentPage,
      required this.onNextButtonPressed,
      required this.onPreviousButtonPressed})
      : super(key: key);

  @override
  State<CounterPageSwitcher> createState() => _CounterPageSwitcherState();
}

class _CounterPageSwitcherState extends State<CounterPageSwitcher> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: onPreviousButtonPressed,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: mainColor,
                )),
            Text('${widget.currentPage + 1}/${widget.count}'),
            IconButton(
                onPressed: onNextButtonPressed,
                icon: const Icon(Icons.arrow_forward_ios, color: mainColor)),
          ],
        ),
      ],
    );
  }

  void onNextButtonPressed() {
    if (isLastPage) {
      widget.onNextButtonPressed(0);
      return;
    }
    widget.onNextButtonPressed(widget.currentPage + 1);
  }

  bool get isLastPage => widget.currentPage == widget.count - 1;

  void onPreviousButtonPressed() {
    if (isFirstPage) {
      widget.onPreviousButtonPressed(widget.count - 1);
      return;
    }
    widget.onPreviousButtonPressed(widget.currentPage - 1);
  }

  bool get isFirstPage => widget.currentPage == 0;
}
