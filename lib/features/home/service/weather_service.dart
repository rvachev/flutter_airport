import 'package:airport/features/home/models/weather.dart';
import 'package:airport/features/home/repositories/weather_repository.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final weatherService = RM.inject<WeatherService>(() => WeatherService());

class WeatherService {
  late Weather _data;

  Weather get data => _data;

  Future<void> getWeather() async {
    weatherService.setToIsWaiting();
    try {
      _data = await WeatherRepository.getWeather();

      weatherService.setToHasData(data);
    } catch (e) {
      weatherService.setToHasError(e);
      rethrow;
    }
  }
}
