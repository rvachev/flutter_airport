import 'package:airport/common/styles/colors.dart';
import 'package:airport/common/widgets/flight_information.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:airport/features/search/models/search_model.dart';
import 'package:airport/features/search/services/search_flight_service.dart';
import 'package:airport/features/search/widgets/date_picker.dart';
import 'package:airport/features/search/widgets/flight_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ScheduleType currentType = ScheduleType.arrive;
  DateTime currentDate = DateTime.now();
  TextEditingController textEditingController = TextEditingController();
  bool isSearched = false;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlightSwitch(
                    onSelectedSwitchChanged: (type) => currentType = type),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DatePicker(
                  onDateChanged: (dateTime) => currentDate = dateTime,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                    decoration: const InputDecoration(
                        labelText: 'Номер рейса, Город, Авиакомпания',
                        alignLabelWithHint: true),
                    controller: textEditingController,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: searchFlights,
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        const BorderSide(color: mainColor))),
                child: const Text(
                  'Найти рейс',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              isSearched
                  ? OnBuilder.all(
                      listenTo: searchFlightService,
                      onWaiting: () => const Center(
                            child: CircularProgressIndicator(),
                          ),
                      onError: (err, errFunc) => const Center(
                            child: Text('Что-то пошло не так'),
                          ),
                      onData: (state) {
                        final searchedFlights = searchFlightService.state.data;
                        return searchedFlights.isNotEmpty
                            ? ExpansionTile(
                                title: Text(
                                    'Найденные рейсы (${searchedFlights.length})',
                                    style: const TextStyle(fontSize: 16)),
                                children: searchedFlights
                                    .map((item) => FlightInformation(
                                          item: item,
                                          fromSearch: true,
                                        ))
                                    .toList(),
                              )
                            : const Center(
                                child: Text('Рейсов не найдено',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500)));
                      })
                  : const Center()
            ],
          ),
        ),
      ),
    );
  }

  void searchFlights() async {
    SearchModel model = SearchModel(
        date: currentDate,
        searchedText: textEditingController.text,
        type: currentType);
    searchFlightService.state.search(model);

    setState(() {
      isSearched = true;
    });
  }
}
