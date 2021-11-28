import 'package:airport/features/home/models/weather.dart';
import 'package:dio/dio.dart';

const baseUrl = 'https://api.weatherapi.com';
const weatherApiKey = 'e163c00c08d34a09873154345210806';

class WeatherService {
  late Dio dio;
  Weather? _currentWeather;

  WeatherService() {
    dio = Dio();
    dio.options.baseUrl = baseUrl;
  }

  Future<Weather> getWeather({bool toUpdate = false}) async {
    if (_currentWeather != null && !toUpdate) {
      return _currentWeather!;
    }

    Response response = await dio.get('/v1/current.json', queryParameters: {
      'key': weatherApiKey,
      'q': '54.957906,73.316456',
      'aqi': 'no',
      'lang': 'ru'
    });
    _currentWeather = Weather.fromJson(response.data);

    return _currentWeather!;
  }
}
