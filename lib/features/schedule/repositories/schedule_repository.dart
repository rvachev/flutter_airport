import 'package:airport/common/network/rest_client_service.dart';
import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';

class ScheduleRepository {
  ScheduleRepository._();

  static Future<List<ScheduleItem>> getScheduleOfType(ScheduleType type) async {
    final response = await baseRestClientService.state.dio.get('/flights',
        queryParameters: {
          'type': type.name,
          '_sort': 'date:desc,scheduleTime:desc'
        });
    List<ScheduleItem> schedule = [];
    for (var item in response.data) {
      schedule.add(ScheduleItem.fromMap(item));
    }
    return schedule;
  }
}
