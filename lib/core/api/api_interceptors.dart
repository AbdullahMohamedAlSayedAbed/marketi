import 'package:dio/dio.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/services/shared_prefs.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    options.headers[ApiKeys.token] =
        CacheHelper().getData(key: ApiKeys.token) != null
        ? 'Bearer ${CacheHelper().getData(key: ApiKeys.token)}'
        : null;
    super.onRequest(options, handler);
  }
}
