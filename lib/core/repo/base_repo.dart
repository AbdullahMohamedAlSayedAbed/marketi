import 'package:dartz/dartz.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/error/error_model.dart';
import 'package:marketi/core/error/server_exception.dart';

abstract class BaseRepo {
  final ApiConsumer apiConsumer;

  BaseRepo(this.apiConsumer);

  Future<Either<ServerException, T>> execute<T>(
    Future<dynamic> Function() request,
    T Function(dynamic data) onSuccess,
  ) async {
    try {
      final response = await request();
      return Right(onSuccess(response));
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(
          errorModel: ErrorModel(
            message: "Unexpected error occurred: $e",
            statusCode: 500,
          ),
        ),
      );
    }
  }
}