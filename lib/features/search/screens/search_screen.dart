import 'package:airport/common/styles/colors.dart';
import 'package:airport/common/widgets/flight_information.dart';
import 'package:airport/features/schedule/domains/schedule_service.dart';
import 'package:airport/features/schedule/models/schedule_item.dart';
import 'package:airport/features/schedule/models/schedule_type.dart';
import 'package:airport/features/search/widgets/date_picker.dart';
import 'package:airport/features/search/widgets/flight_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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
  final List<ScheduleItem> searchedFlights = [];
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
                onPressed: () => searchFlights(),
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
              isSearched && searchedFlights.isNotEmpty
                  ? ExpansionTile(
                      title: Text('Найденные рейсы (${searchedFlights.length})',
                          style: const TextStyle(fontSize: 16)),
                      children: searchedFlights
                          .map((item) => FlightInformation(item: item))
                          .toList(),
                    )
                  : isSearched
                      ? const Center(
                          child: Text('Рейсов не найдено',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500)))
                      : Container()
            ],
          ),
        ),
      ),
    );
  }

  void searchFlights() async {
    searchedFlights.clear();
    List<ScheduleItem> schedule =
        await RM.get<ScheduleService>().state.getScheduleByType(currentType);
    for (ScheduleItem item in schedule) {
      if (item.date == DateFormat('dd.MM.yyyy').format(currentDate)) {
        String searchedText = textEditingController.text.toLowerCase();
        if (item.flight.toLowerCase().contains(searchedText) ||
            item.airport.toLowerCase().contains(searchedText) ||
            item.company.toLowerCase().contains(searchedText)) {
          searchedFlights.add(item);
        }
      }
    }

    setState(() {
      isSearched = true;
    });
  }
}
