import 'package:airport/common/styles/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onTabTapped;

  const CustomBottomNavigationBar(
      {Key? key, required this.currentIndex, required this.onTabTapped})
      : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  late int currentIndex;

  final List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
    const BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.flight_takeoff), label: 'Расписание'),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  void changeScreen(int index) {
    widget.onTabTapped(index);
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      currentIndex: currentIndex,
      type: BottomNavigationBarType.shifting,
      selectedItemColor: mainColor,
      unselectedItemColor: Colors.grey,
      onTap: changeScreen,
    );
  }
}
