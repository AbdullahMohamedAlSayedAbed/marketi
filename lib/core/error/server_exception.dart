import 'package:dio/dio.dart';
import 'package:marketi/core/error/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  factory ServerException.fromDioError(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case DioExceptionType.sendTimeout:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case DioExceptionType.receiveTimeout:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case DioExceptionType.badCertificate:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case DioExceptionType.badResponse:
        return ServerException.badResponse(dioException: dioException);
      case DioExceptionType.cancel:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case DioExceptionType.connectionError:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case DioExceptionType.unknown:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
    }
  }

  ServerException({required this.errorModel});

  factory ServerException.badResponse({required DioException dioException}) {
    switch (dioException.response?.statusCode) {
      case 400:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case 401:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case 403:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case 404:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case 500:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case 502:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      case 504:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
      default:
        return ServerException(
          errorModel: ErrorModel.fromDioError(dioException.response!.data),
        );
    }
  }
}
