import 'package:airport/common/widgets/flight_information.dart';
import 'package:airport/features/schedule/domains/schedule_service.dart';
import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class ScheduleList extends StatefulWidget {
  final ScheduleType type;

  const ScheduleList({Key? key, required this.type}) : super(key: key);

  @override
  State<ScheduleList> createState() => _ScheduleListState();
}

class _ScheduleListState extends State<ScheduleList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ScheduleItem>>(
        future: RM.get<ScheduleService>().state.getScheduleByType(widget.type),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            List<ScheduleItem> scheduleList = snapshot.data!;
            return ListView.builder(
                itemCount: scheduleList.length,
                itemBuilder: (context, index) {
                  if (scheduleList.isNotEmpty) {
                    return FlightInformation(item: scheduleList[index]);
                  }
                  return const Center(
                      child: Text('Рейсов в расписании нет',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500)));
                });
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
