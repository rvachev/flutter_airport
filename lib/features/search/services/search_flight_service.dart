import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:airport/features/search/models/search_model.dart';
import 'package:airport/features/search/repositories/search_repository.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

final searchFlightService = RM.inject(() => SearchFlightService());

class SearchFlightService {
  List<ScheduleItem> _data = [];

  List<ScheduleItem> get data => _data;

  Future<void> search(SearchModel model) async {
    searchFlightService.setToIsWaiting();
    try {
      _data = await SearchRepository.searchFlights(model);

      searchFlightService.setToHasData(data);
    } catch (e) {
      searchFlightService.setToHasError(e);
      rethrow;
    }
  }
}
