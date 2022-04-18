import 'package:airport/features/schedule/models/schedule_type.dart';

class SearchModel {
  final DateTime date;
  final String searchedText;
  final ScheduleType type;

  SearchModel(
      {required this.date, required this.searchedText, required this.type});
}
