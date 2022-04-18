import 'package:airport/common/network/urls.dart';
import 'package:airport/common/network/irest_client_service.dart';
import 'package:dio/dio.dart';
import 'package:states_rebuilder/scr/state_management/rm.dart';

final weatherClientService = RM.inject(() => WeatherClientService());

class WeatherClientService extends IRestClientService {
  final _dio = Dio();

  WeatherClientService() {
    init();
  }

  @override
  Dio get dio => _dio;

  @override
  void init() {
    _dio.interceptors.add(this);
    _dio.options = BaseOptions(
      baseUrl: weatherUrl,
      validateStatus: (status) {
        return status != null && status >= 200 && status < 300 || status == 304;
      },
    );
  }
}
