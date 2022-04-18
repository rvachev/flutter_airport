import 'package:airport/features/schedule/models/schedule_item.dart';

class DetailedScreenArgs {
  final ScheduleItem item;
  final bool fromSearch;

  DetailedScreenArgs({required this.item, this.fromSearch = false});
}
