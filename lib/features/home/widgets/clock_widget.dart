import 'dart:async';

import 'package:airport/common/utils/date_utils.dart';
import 'package:flutter/material.dart';

class ClockWidget extends StatefulWidget {
  final Color color;

  const ClockWidget({Key? key, this.color = Colors.white}) : super(key: key);

  @override
  State<ClockWidget> createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  late int _hours;
  late int _minutes;
  late Timer _timer;

  @override
  void initState() {
    updateTimer();
    super.initState();
  }

  void updateTimer() {
    DateTime currentDate = DateTime.now();
    setState(() {
      _hours = currentDate.hour;
      _minutes = currentDate.minute;
      _timer = Timer(
          const Duration(minutes: 1) -
              Duration(seconds: currentDate.second) -
              Duration(milliseconds: currentDate.millisecond),
          updateTimer);
    });
  }

  @override
  Widget build(BuildContext context) {
    TextStyle clockStyle =
        Theme.of(context).textTheme.headline1!.copyWith(color: widget.color);
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
        formatTime(_hours),
        style: clockStyle,
      ),
      Text(
        formatTime(_minutes),
        style: clockStyle,
      )
    ]);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
