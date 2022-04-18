import 'package:airport/common/widgets/flight_information.dart';
import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:airport/features/schedule/services/schedule_service.dart';
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
  void initState() {
    scheduleService.state.getScheduleByType(widget.type);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant ScheduleList oldWidget) {
    scheduleService.state.getScheduleByType(widget.type);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return OnBuilder.all(
      listenTo: scheduleService,
      onWaiting: () => const Center(
        child: CircularProgressIndicator(),
      ),
      onError: (err, errFunc) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Что-то пошло не так'),
            TextButton(
                onPressed: () =>
                    scheduleService.state.getScheduleByType(widget.type),
                child: const Text('Обновить'))
          ],
        ),
      ),
      onData: (ScheduleService state) {
        List<ScheduleItem> scheduleList = state.data[widget.type]!;
        if (scheduleList.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () =>
                scheduleService.state.refreshScheduleByType(widget.type),
            child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                itemCount: scheduleList.length,
                itemBuilder: (context, index) {
                  return FlightInformation(item: scheduleList[index]);
                }),
          );
        }
        return const Center(
            child: Text('Рейсов в расписании нет',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)));
      },
    );
  }
}
