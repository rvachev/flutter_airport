import 'package:airport/common/extensions/schedule_status_extension.dart';
import 'package:airport/common/utils/date_utils.dart';
import 'package:airport/common/widgets/flight_hero_avatar.dart';
import 'package:airport/features/flight/models/detailed_screen_args.dart';
import 'package:flutter/material.dart';

class FlightDetailedScreen extends StatelessWidget {
  final DetailedScreenArgs args;

  const FlightDetailedScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(args.item.flight),
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
                            flight: args.item, fromSearch: args.fromSearch)),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              args.item.airport.name,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w700),
                            ),
                            Text(args.item.flight)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                buildTileInformation(
                    title: 'Авиакомпания', info: args.item.company.name),
                buildTileInformation(
                    title: 'Дата рейса', info: formatDate(args.item.date)),
                buildTileInformation(
                    title: 'Время по расписанию',
                    info: formatTime(args.item.scheduleTime)),
                args.item.waitingTime != null
                    ? buildTileInformation(
                        title: 'Ожидаемое время',
                        info: formatTime(args.item.waitingTime!))
                    : const Center(),
                args.item.actualTime != null
                    ? buildTileInformation(
                        title: 'Фактическое время',
                        info: formatTime(args.item.actualTime!))
                    : const Center(),
                buildTileInformation(
                    title: 'Статус', info: args.item.status.ruName)
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
}
