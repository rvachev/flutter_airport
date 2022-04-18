import 'package:airport/features/schedule/models/schedule_type.dart';

extension ScheduleTypeExtension on ScheduleType {
  static ScheduleType fromString(String string) {
    switch (string) {
      case 'arrive':
        return ScheduleType.arrive;
      case 'depart':
        return ScheduleType.depart;
      default:
        throw UnimplementedError();
    }
  }
}
