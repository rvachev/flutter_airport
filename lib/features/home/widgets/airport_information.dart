import 'package:airport/common/widgets/custom_vertical_divider.dart';
import 'package:airport/features/home/service/weather_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class AirportInformation extends StatefulWidget {
  const AirportInformation({Key? key}) : super(key: key);

  @override
  State<AirportInformation> createState() => _AirportInformationState();
}

class _AirportInformationState extends State<AirportInformation> {
  @override
  void initState() {
    weatherService.state.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Flexible(
            child: GestureDetector(
              onTap: () => weatherService.state.getWeather(),
              child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: double.infinity,
                  child: OnBuilder.all(
                    listenTo: weatherService,
                    onWaiting: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    onError: (err, errFunc) => const Center(
                      child: Text('Произошла ошибка'),
                    ),
                    onData: (WeatherService state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CachedNetworkImage(
                            imageUrl: state.data.imageUrl,
                            height: 36,
                            progressIndicatorBuilder: (_, __, ___) =>
                                const SizedBox(
                              height: 36,
                              width: 36,
                            ),
                          ),
                          Text(
                            '${state.data.temp.toString()}°C',
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        ],
                      );
                    },
                  )),
            ),
          ),
          const CustomVerticalDivider(
            height: 40,
          ),
          Flexible(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                child: SizedBox(
                  height: 36,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text('Омский аэропорт им. Карбышева',
                            style: Theme.of(context).textTheme.subtitle1!),
                        Text(
                          'Транссибирская ул., 28',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(fontWeight: FontWeight.w600),
                        )
                      ]),
                ),
              ))
        ],
      ),
    );
  }
}
