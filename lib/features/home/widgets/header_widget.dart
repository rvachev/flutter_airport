import 'package:airport/common/styles/colors.dart';
import 'package:airport/common/styles/shadows.dart';
import 'package:airport/features/home/widgets/clock_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
                    child: SizedBox(
                      height: screenHeight * 0.3,
                      child: Image.asset(
                        'assets/bgs/airport.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
