import 'dart:convert';

import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:flutter/services.dart';

class ScheduleService {
  final Map<ScheduleType, List<ScheduleItem>> _schedule = {
    ScheduleType.arrive: [],
    ScheduleType.depart: []
  };

  Future<List<ScheduleItem>> getScheduleByType(ScheduleType type) async {
    if (_schedule[type]!.isNotEmpty) {
      return _schedule[type]!;
    }

    Map<String, dynamic> rawData = await _getSchedule();
    String jsonType = type.toString().split('.')[1];

    List<dynamic> rawTypeData = rawData[jsonType];
    for (dynamic item in rawTypeData) {
      _schedule[type]!.add(ScheduleItem.fromJson(item));
    }

    return _schedule[type]!;
  }

  Future<Map<String, dynamic>> _getSchedule() async {
    String data = await rootBundle.loadString('assets/data/schedule.json');
    Map<String, dynamic> rawData = jsonDecode(data);
    return rawData;
  }
}
