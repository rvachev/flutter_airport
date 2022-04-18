import 'package:airport/features/schedule/models/schedule_status.dart';

extension ScheduleStatusExtension on ScheduleStatus {
  static ScheduleStatus fromString(String string) {
    switch (string) {
      case 'arrived':
        return ScheduleStatus.arrived;
      case 'departed':
        return ScheduleStatus.departed;
      case 'flying':
        return ScheduleStatus.flying;
      case 'checkIn':
        return ScheduleStatus.checkIn;
      case 'scheduled':
        return ScheduleStatus.scheduled;
      default:
        throw UnimplementedError();
    }
  }

  String get ruName {
    switch (this) {
      case ScheduleStatus.arrived:
        return 'Прибыл';
      case ScheduleStatus.departed:
        return 'Вылетел';
      case ScheduleStatus.scheduled:
        return 'Запланирован';
      case ScheduleStatus.flying:
        return 'В пути';
      case ScheduleStatus.checkIn:
        return 'Регистрация';
    }
  }
}
