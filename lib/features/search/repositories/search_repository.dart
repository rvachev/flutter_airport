import 'package:airport/common/network/rest_client_service.dart';
import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:airport/features/search/models/search_model.dart';
import 'package:intl/intl.dart';

class SearchRepository {
  SearchRepository._();

  static Future<List<ScheduleItem>> searchFlights(SearchModel model) async {
    final response =
        await baseRestClientService.state.dio.get('/flights', queryParameters: {
      'type': model.type.name,
      'date': DateFormat('yyyy-MM-dd').format(model.date),
      '_where[_or][0][flight_containss]': model.searchedText,
      '_where[_or][1][airport.name_containss]': model.searchedText,
      '_where[_or][2][company.name_containss]': model.searchedText,
      '_sort': 'date:desc,scheduleTime:desc'
    });
    List<ScheduleItem> schedule = [];
    for (var item in response.data) {
      schedule.add(ScheduleItem.fromJson(item));
    }
    return schedule;
  }
}
