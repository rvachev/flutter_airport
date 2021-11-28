import 'package:airport/common/styles/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> offset;

  @override
  void initState() {
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 750));

    offset = Tween<Offset>(begin: const Offset(-1.0, 0.0), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _controller, curve: Curves.easeOutQuart));

    Future.delayed(const Duration(seconds: 2),
        () => Navigator.pushReplacementNamed(context, '/home'));

    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 130,
              decoration: const BoxDecoration(
                  border: Border(left: BorderSide(color: mainColor, width: 8))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: SlideTransition(
                position: offset,
                child: const Text('Welcome to OMS',
                    style: TextStyle(color: mainColor, fontSize: 60)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
