import 'package:airport/common/styles/shadows.dart';
import 'package:airport/features/home/models/weather.dart';
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
  bool toUpdate = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => setState(() => toUpdate = true),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [defaultBoxShadow]),
                child: FutureBuilder<Weather>(
                    future: RM
                        .get<WeatherService>()
                        .state
                        .getWeather(toUpdate: toUpdate),
                    builder: (context, snapshot) {
                      toUpdate = false;
                      if (snapshot.connectionState == ConnectionState.done) {
                        Weather weather = snapshot.data!;
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CachedNetworkImage(
                              imageUrl: weather.imageUrl,
                              height: 36,
                              progressIndicatorBuilder: (_, __, ___) =>
                                  const SizedBox(
                                height: 36,
                                width: 36,
                              ),
                            ),
                            Text(
                              weather.temp.toString(),
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }),
              ),
            ),
          ),
        ),
        Flexible(flex: 2, child: Container())
      ],
    );
  }
}
