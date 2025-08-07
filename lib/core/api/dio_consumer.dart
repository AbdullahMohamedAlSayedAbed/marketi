import 'package:dio/dio.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/api/api_interceptors.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/error/server_exception.dart';

class DioConsumer extends ApiConsumer {
  @override
  final Dio dio;
  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoints.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        error: true,
        requestHeader: true,
        responseHeader: true,
        request: true,
        requestBody: true,
      ),
    );
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormDate = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormDate ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      return ServerException.fromDioError(e);
    } catch (e) {
      throw "Unexpected Error DioConsumer : $e";
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      return ServerException.fromDioError(e);
    } catch (e) {
      throw "Unexpected Error DioConsumer : $e";
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormDate = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormDate ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      return ServerException.fromDioError(e);
    } catch (e) {
      throw "Unexpected Error DioConsumer : $e";
    }
  }

  @override
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormDate = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormDate ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      return ServerException.fromDioError(e);
    } catch (e) {
      throw "Unexpected Error DioConsumer : $e";
    }
  }
}
