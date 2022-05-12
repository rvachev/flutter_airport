// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../features/schedule/models/schedule_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ScheduleItem _$$_ScheduleItemFromJson(Map<String, dynamic> json) =>
    _$_ScheduleItem(
      id: json['id'] as int,
      date: json['date'] as String,
      airport: Airport.fromJson(json['airport'] as Map<String, dynamic>),
      flight: json['flight'] as String,
      company: Company.fromJson(json['company'] as Map<String, dynamic>),
      scheduleTime: json['scheduleTime'] as String,
      waitingTime: json['waitingTime'] as String?,
      actualTime: json['actualTime'] as String?,
      status: $enumDecode(_$ScheduleStatusEnumMap, json['status']),
      type: $enumDecode(_$ScheduleTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_ScheduleItemToJson(_$_ScheduleItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'airport': instance.airport,
      'flight': instance.flight,
      'company': instance.company,
      'scheduleTime': instance.scheduleTime,
      'waitingTime': instance.waitingTime,
      'actualTime': instance.actualTime,
      'status': _$ScheduleStatusEnumMap[instance.status],
      'type': _$ScheduleTypeEnumMap[instance.type],
    };

const _$ScheduleStatusEnumMap = {
  ScheduleStatus.arrived: 'arrived',
  ScheduleStatus.departed: 'departed',
  ScheduleStatus.scheduled: 'scheduled',
  ScheduleStatus.flying: 'flying',
  ScheduleStatus.checkIn: 'checkIn',
};

const _$ScheduleTypeEnumMap = {
  ScheduleType.arrive: 'arrive',
  ScheduleType.depart: 'depart',
};
