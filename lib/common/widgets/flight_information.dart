import 'package:airport/common/styles/colors.dart';
import 'package:airport/common/utils/icon_utils.dart';
import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:flutter/material.dart';

class FlightInformation extends StatelessWidget {
  final ScheduleItem item;

  const FlightInformation({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: lightGrayColor,
          child: Image.asset(
            getIconCompany(item.company),
            fit: BoxFit.fill,
          )),
      title: Text(
        item.airport + ' - ' + item.flight,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(item.date + ' ' + item.scheduleArrive),
    );
  }
}
