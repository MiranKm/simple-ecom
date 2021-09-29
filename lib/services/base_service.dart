import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:iqapp/util/constants.dart';

class BaseService {
  final Dio _dio;

  BaseService(this._dio);

  Future<Response> getAllData() {
    return _dio.get("/api/v1/home",options:  buildCacheOptions(Duration(days: 7)));
  }
}

class CustomInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.baseUrl = BASE_URL;
    options.contentType = "application/json";

    handler.next(options);
  }
}

