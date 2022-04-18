import 'dart:convert';

import 'package:airport/common/extensions/schedule_status_extension.dart';
import 'package:airport/common/extensions/schedule_type_extension.dart';
import 'package:airport/features/schedule/models/airport_model.dart';
import 'package:airport/features/schedule/models/company_model.dart';
import 'package:airport/features/schedule/models/schedule_status.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';

class ScheduleItem {
  final int id;
  final String date;
  final AirportModel airport;
  final String flight;
  final CompanyModel company;
  final String scheduleTime;
  final String? waitingTime;
  final String? actualTime;
  final ScheduleStatus status;
  final ScheduleType type;

  ScheduleItem({
    required this.id,
    required this.date,
    required this.airport,
    required this.flight,
    required this.company,
    required this.scheduleTime,
    this.waitingTime,
    this.actualTime,
    required this.status,
    required this.type,
  });

  ScheduleItem copyWith({
    int? id,
    String? date,
    AirportModel? airport,
    String? flight,
    CompanyModel? company,
    String? scheduleTime,
    String? waitingTime,
    String? actualTime,
    ScheduleStatus? status,
    ScheduleType? type,
  }) {
    return ScheduleItem(
      id: id ?? this.id,
      date: date ?? this.date,
      airport: airport ?? this.airport,
      flight: flight ?? this.flight,
      company: company ?? this.company,
      scheduleTime: scheduleTime ?? this.scheduleTime,
      waitingTime: waitingTime ?? this.waitingTime,
      actualTime: actualTime ?? this.actualTime,
      status: status ?? this.status,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'airport': airport.toMap(),
      'flight': flight,
      'company': company.toMap(),
      'scheduleTime': scheduleTime,
      'waitingTime': waitingTime,
      'actualTime': actualTime,
      'status': status.name,
      'type': type.name,
    };
  }

  factory ScheduleItem.fromMap(Map<String, dynamic> map) {
    return ScheduleItem(
      id: map['id']?.toInt() ?? 0,
      date: map['date'] ?? '',
      airport: AirportModel.fromMap(map['airport']),
      flight: map['flight'] ?? '',
      company: CompanyModel.fromMap(map['company']),
      scheduleTime: map['scheduleTime'] ?? '',
      waitingTime: map['waitingTime'],
      actualTime: map['actualTime'],
      status: ScheduleStatusExtension.fromString(map['status']),
      type: ScheduleTypeExtension.fromString(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory ScheduleItem.fromJson(String source) =>
      ScheduleItem.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ScheduleItem(id: $id, date: $date, airport: $airport, flight: $flight, company: $company, scheduleTime: $scheduleTime, waitingTime: $waitingTime, actualTime: $actualTime, status: $status, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScheduleItem &&
        other.id == id &&
        other.date == date &&
        other.airport == airport &&
        other.flight == flight &&
        other.company == company &&
        other.scheduleTime == scheduleTime &&
        other.waitingTime == waitingTime &&
        other.actualTime == actualTime &&
        other.status == status &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        date.hashCode ^
        airport.hashCode ^
        flight.hashCode ^
        company.hashCode ^
        scheduleTime.hashCode ^
        waitingTime.hashCode ^
        actualTime.hashCode ^
        status.hashCode ^
        type.hashCode;
  }
}
