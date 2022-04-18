import 'package:airport/common/constants/api_keys.dart';
import 'package:airport/common/constants/coordinates.dart';
import 'package:airport/common/network/weather_client_service.dart';
import 'package:airport/features/home/models/weather.dart';

class WeatherRepository {
  static Future<Weather> getWeather() async {
    final response = await weatherClientService.state.dio
        .get('/v1/current.json', queryParameters: {
      'key': weatherApiKey,
      'q': '$omskLat,$omskLng',
      'aqi': 'no',
      'lang': 'ru'
    });
    return Weather.fromMap(response.data);
  }
}
