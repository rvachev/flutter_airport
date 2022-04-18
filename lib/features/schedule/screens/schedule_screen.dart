import 'package:airport/common/styles/colors.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:airport/features/schedule/wigdets/schedule_list.dart';
import 'package:airport/features/search/widgets/flight_switch.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  ScheduleType currentType = ScheduleType.arrive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrayColor,
        body: SafeArea(
          child: Column(
            children: [
              FlightSwitch(
                  onSelectedSwitchChanged: (type) =>
                      setState(() => currentType = type)),
              Expanded(child: ScheduleList(type: currentType))
            ],
          ),
        ));
  }
}
