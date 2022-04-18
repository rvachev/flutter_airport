import 'package:airport/common/utils/date_utils.dart';
import 'package:airport/common/widgets/flight_hero_avatar.dart';
import 'package:airport/features/flight/models/detailed_screen_args.dart';
import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:flutter/material.dart';

class FlightInformation extends StatelessWidget {
  final ScheduleItem item;
  final bool fromSearch;

  const FlightInformation(
      {Key? key, required this.item, this.fromSearch = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.of(context).pushNamed('/detailed-flight',
          arguments: DetailedScreenArgs(item: item, fromSearch: fromSearch)),
      leading: FlightHeroAvatar(
        flight: item,
        fromSearch: fromSearch,
      ),
      title: Text(
        item.airport.name + ' - ' + item.flight,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle:
          Text(formatDate(item.date) + ' ' + formatTime(item.scheduleTime)),
    );
  }
}
