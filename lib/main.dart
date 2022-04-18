import 'package:airport/common/styles/colors.dart';
import 'package:airport/features/flight/models/detailed_screen_args.dart';
import 'package:airport/features/flight/screens/flight_detailed_screen.dart';
import 'package:airport/features/navigation/screens/navigation_container.dart';
import 'package:airport/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Аэропорт',
      theme: ThemeData(
          primarySwatch: mainColor as MaterialColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            subtitle1: TextStyle(fontSize: 12),
            headline1: TextStyle(fontSize: 84, fontWeight: FontWeight.w500),
          )),
      onGenerateRoute: generateRoute,
      initialRoute: '/',
    );
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        {
          return MaterialPageRoute(builder: (_) => const SplashScreen());
        }
      case '/home':
        {
          return MaterialPageRoute(
              builder: (_) => const NavigationContainer(currentIndex: 0));
        }
      case '/detailed-flight':
        {
          return MaterialPageRoute(
              builder: (_) => FlightDetailedScreen(
                  args: settings.arguments as DetailedScreenArgs));
        }
      default:
        throw ('undefined route!');
    }
  }
}
