import 'package:airport/common/styles/colors.dart';
import 'package:airport/common/styles/shadows.dart';
import 'package:airport/common/widgets/blur_widget.dart';
import 'package:airport/features/home/models/weather.dart';
import 'package:airport/features/home/service/weather_service.dart';
import 'package:airport/features/home/widgets/airport_information.dart';
import 'package:airport/features/home/widgets/clock_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        HeaderWidget(screenHeight: screenHeight),
        const AirportInformation()
      ],
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
    required this.screenHeight,
  }) : super(key: key);

  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Container(
        height: screenHeight * 0.3,
        decoration: const BoxDecoration(
            boxShadow: [defaultBoxShadow], color: Colors.white),
        width: double.infinity,
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                    child: Center(
                  child: ClockWidget(
                    color: headerTextColor,
                  ),
                )),
                Flexible(
                    flex: 2,
                    child: Blur(
                      coverColor: mainColor,
                      height: screenHeight * 0.3,
                      child: Image.asset(
                        'assets/bgs/airport.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ))
              ],
            ),
            // Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text('Омский аэропорт им. Карбышева',
            //           style: Theme.of(context)
            //               .textTheme
            //               .bodyText1!
            //               .copyWith(color: headerTextColor)),
            //       Text(
            //         'Транссибирская ул., 28',
            //         style: Theme.of(context)
            //             .textTheme
            //             .subtitle1!
            //             .copyWith(color: headerTextColor),
            //       )
            //     ])
          ],
        ),
      ),
    );
  }
}
