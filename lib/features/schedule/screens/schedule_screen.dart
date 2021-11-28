import 'package:airport/common/styles/colors.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:airport/features/schedule/wigdets/schedule_list.dart';
import 'package:flutter/material.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  List<String> tabNames = ['Прилет', 'Вылет'];

  IconData getIcon(String name) {
    switch (name) {
      case 'Прилет':
        return Icons.flight_land;
      case 'Вылет':
        return Icons.flight_takeoff;
      default:
        return Icons.question_answer;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: lightGrayColor,
        appBar: AppBar(
          title: const Text('Расписание'),
          bottom: TabBar(
              tabs: tabNames.map((name) => buildTabEntry(name)).toList()),
        ),
        body: const TabBarView(children: [
          ScheduleList(type: ScheduleType.arrive),
          ScheduleList(type: ScheduleType.depart)
        ]),
      ),
    );
  }

  Widget buildTabEntry(String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(getIcon(name)),
          const SizedBox(
            width: 10,
          ),
          Text(name),
        ],
      ),
    );
  }
}
