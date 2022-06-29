import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:airport/features/schedule/repositories/schedule_repository.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final scheduleService = RM.inject(() => ScheduleService());

class ScheduleService {
  final Map<ScheduleType, List<ScheduleItem>> _data = {
    ScheduleType.arrive: [],
    ScheduleType.depart: []
  };

  Map<ScheduleType, List<ScheduleItem>> get data => _data;

  Future<void> getScheduleByType(ScheduleType type) async {
    scheduleService.setToIsWaiting();
    try {
      if (_data[type]!.isNotEmpty) {
        scheduleService.setToHasData(_data);
      } else {
        _data[type] = await ScheduleRepository.getScheduleOfType(type);

        scheduleService.setToHasData(_data);
      }
    } catch (e) {
      scheduleService.setToHasError(e);
      rethrow;
    }
  }

  Future<void> refreshScheduleByType(ScheduleType type) async {
    try {
      _data[type] = await ScheduleRepository.getScheduleOfType(type);

      scheduleService.setToHasData(_data);
    } catch (e) {
      scheduleService.setToHasError(e);
      rethrow;
    }
  }
}

///ASFDAKLSAKDL:ASKDL: