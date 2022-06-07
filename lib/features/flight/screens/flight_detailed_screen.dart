import 'package:airport/common/extensions/schedule_status_extension.dart';
import 'package:airport/common/services/notifications_service.dart';
import 'package:airport/common/utils/date_utils.dart';
import 'package:airport/common/widgets/flight_hero_avatar.dart';
import 'package:airport/features/flight/models/detailed_screen_args.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FlightDetailedScreen extends StatefulWidget {
  final DetailedScreenArgs args;

  const FlightDetailedScreen({Key? key, required this.args}) : super(key: key);

  @override
  State<FlightDetailedScreen> createState() => _FlightDetailedScreenState();
}

class _FlightDetailedScreenState extends State<FlightDetailedScreen> {
  bool isFlightFollowed = false;
  late Box<bool> box;

  @override
  void initState() {
    initBox();
    super.initState();
  }

  void initBox() async {
    box = await Hive.openBox('notifications');
    setState(() {
      isFlightFollowed = box.get(widget.args.item.id) ?? false;
    });
  }

  void followFlight() async {
    await box.put(widget.args.item.id, true);
    await notificationsService.state
        .scheduleFlightNotification(widget.args.item);
  }

  void unfollowFlight() async {
    await box.delete(widget.args.item.id);
    await notificationsService.state
        .cancelScheduledFlightNotification(widget.args.item.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.item.flight),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                        height: 75,
                        width: 75,
                        child: FlightHeroAvatar(
                            flight: widget.args.item,
                            fromSearch: widget.args.fromSearch)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.args.item.airport.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            Text(widget.args.item.flight)
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        const Text('Следить'),
                        Switch(
                            value: isFlightFollowed,
                            onChanged: isFutureDate
                                ? (value) {
                                    setState(() {
                                      isFlightFollowed = !isFlightFollowed;
                                    });
                                    if (value) {
                                      followFlight();
                                    } else {
                                      unfollowFlight();
                                    }
                                  }
                                : null),
                      ],
                    )
                  ],
                ),
                buildTileInformation(
                    title: 'Авиакомпания', info: widget.args.item.company.name),
                buildTileInformation(
                    title: 'Дата рейса',
                    info: formatDate(widget.args.item.date)),
                buildTileInformation(
                    title: 'Время по расписанию',
                    info: formatTime(widget.args.item.scheduleTime)),
                widget.args.item.waitingTime != null
                    ? buildTileInformation(
                        title: 'Ожидаемое время',
                        info: formatTime(widget.args.item.waitingTime!))
                    : const Center(),
                widget.args.item.actualTime != null
                    ? buildTileInformation(
                        title: 'Фактическое время',
                        info: formatTime(widget.args.item.actualTime!))
                    : const Center(),
                buildTileInformation(
                    title: 'Статус', info: widget.args.item.status.ruName)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTileInformation({required String title, required String info}) {
    return ListTile(
      title: Text(info,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      subtitle: Text(title),
    );
  }

  bool get isFutureDate => DateTime.parse(
          widget.args.item.date + 'T' + widget.args.item.scheduleTime)
      .isAfter(DateTime.now());
}
