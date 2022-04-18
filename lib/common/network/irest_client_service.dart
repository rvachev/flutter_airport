import 'package:airport/common/network/network_error.dart';
import 'package:dio/dio.dart';

abstract class IRestClientService implements Interceptor {
  Dio get dio;

  void init();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    final customError = NetworkError(err);
    handler.next(customError);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }
}
