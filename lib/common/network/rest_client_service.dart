import 'package:airport/common/network/irest_client_service.dart';
import 'package:airport/common/network/urls.dart';
import 'package:dio/dio.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

final baseRestClientService = RM.inject(
  () => BaseRestClientService(),
  autoDisposeWhenNotUsed: false,
);

class BaseRestClientService extends IRestClientService {
  final _dio = Dio();

  BaseRestClientService() {
    init();
  }

  @override
  Dio get dio => _dio;

  @override
  init() {
    _dio.interceptors.add(this);
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      validateStatus: (status) {
        return status != null && status >= 200 && status < 300 || status == 304;
      },
    );
  }
}
