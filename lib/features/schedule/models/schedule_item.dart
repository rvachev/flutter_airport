import 'package:airport/features/schedule/models/airport.dart';
import 'package:airport/features/schedule/models/company.dart';
import 'package:airport/features/schedule/models/schedule_status.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../generated/schedule_item.freezed.dart';
part '../../../generated/schedule_item.g.dart';

@freezed
class ScheduleItem with _$ScheduleItem {
  factory ScheduleItem(
      {required int id,
      required String date,
      required Airport airport,
      required String flight,
      required Company company,
      required String scheduleTime,
      String? waitingTime,
      String? actualTime,
      required ScheduleStatus status,
      required ScheduleType type}) = _ScheduleItem;

  factory ScheduleItem.fromJson(Map<String, dynamic> json) =>
      _$ScheduleItemFromJson(json);
}
