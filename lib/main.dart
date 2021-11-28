import 'package:airport/common/styles/colors.dart';
import 'package:airport/features/home/service/weather_service.dart';
import 'package:airport/features/navigation/screens/navigation_container.dart';
import 'package:airport/features/schedule/domains/schedule_service.dart';
import 'package:airport/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Injector(
        inject: [
          Inject(() => ScheduleService()),
          Inject(() => WeatherService())
        ],
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Аэропорт',
            theme: ThemeData(
                primarySwatch: mainColor as MaterialColor,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                textTheme: const TextTheme(
                  bodyText1:
                      TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  subtitle1: TextStyle(fontSize: 12),
                  headline1:
                      TextStyle(fontSize: 84, fontWeight: FontWeight.w500),
                )),
            onGenerateRoute: generateRoute,
            initialRoute: '/',
          );
        });
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
      default:
        throw ('undefined route!');
    }
  }
}
