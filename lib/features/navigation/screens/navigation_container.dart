import 'package:airport/common/styles/colors.dart';
import 'package:airport/common/utils/textfield_focus.dart';
import 'package:airport/features/home/screens/home_screen.dart';
import 'package:airport/features/navigation/widgets/custom_bottom_navigation_bar.dart';
import 'package:airport/features/profile/screens/profile_screen.dart';
import 'package:airport/features/schedule/screens/schedule_screen.dart';
import 'package:airport/features/search/screens/search_screen.dart';
import 'package:flutter/material.dart';

class NavigationContainer extends StatefulWidget {
  final int currentIndex;

  const NavigationContainer({Key? key, required this.currentIndex})
      : super(key: key);

  @override
  State<NavigationContainer> createState() => _NavigationContainerState();
}

class _NavigationContainerState extends State<NavigationContainer> {
  late int currentIndex;

  final List<Widget> screens = [
    const HomeScreen(),
    const SearchScreen(),
    const ScheduleScreen()
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => breakFocus(context),
      child: Scaffold(
          backgroundColor: lightGrayColor,
          body: IndexedStack(
            index: currentIndex,
            children: screens,
          ),
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: currentIndex,
            onTabTapped: onTabTapped,
          )),
    );
  }
}
