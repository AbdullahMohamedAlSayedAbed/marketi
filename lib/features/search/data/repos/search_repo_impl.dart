import 'package:dartz/dartz.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/error/error_model.dart';
import 'package:marketi/core/error/server_exception.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';

class SearchRepoImpl {
  final ApiConsumer apiConsumer;

  SearchRepoImpl({required this.apiConsumer});
Future<  Either<ServerException, AllProductModel?>> searchProducts({
    required String query,
    int skip = 0,
    int limit = 10,
  }) async{
    try {
      final response =await apiConsumer.post(
        EndPoints.search,
        queryParameters: {
          ApiKeys.search: query,
          ApiKeys.skip: skip,
          ApiKeys.limit: limit,
        },
      );
      return Right(AllProductModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ServerException(
          errorModel: ErrorModel(message: e.toString(), statusCode: 500),
        ),
      );
    }
  }
}
