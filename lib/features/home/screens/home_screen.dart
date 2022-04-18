import 'package:airport/features/home/widgets/airport_information.dart';
import 'package:airport/features/home/widgets/header_widget.dart';
import 'package:flutter/material.dart';

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
