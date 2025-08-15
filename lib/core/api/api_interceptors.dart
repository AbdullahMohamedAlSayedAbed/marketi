import 'package:dio/dio.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/services/shared_prefs.dart';

class ApiInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    final token = CacheHelper().getData(key: ApiKeys.token);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    super.onRequest(options, handler);
  }
}
