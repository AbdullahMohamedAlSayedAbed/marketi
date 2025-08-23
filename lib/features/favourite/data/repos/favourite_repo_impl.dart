import 'package:dartz/dartz.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/error/error_model.dart';
import 'package:marketi/core/error/server_exception.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';

class FavoriteRepoImpl {
  final ApiConsumer apiConsumer;
  FavoriteRepoImpl(this.apiConsumer);
  Future<Either<ServerException, AllProductModel>> getFavorite() async {
    try {
      final response = await apiConsumer.get(EndPoints.getFavorite);
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
  Future<Either<ServerException, String>> addFavorite(int productId) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.addFavorite,
        data: {'productId': productId},
      );
      return Right(response[ApiKeys.message]);
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
  Future<Either<ServerException, String>> deleteFavorite(int productId) async {
    try {
      final response = await apiConsumer.delete(
        EndPoints.deleteFavorite,
        data: {'productId': productId},
      );
      return Right(response[ApiKeys.message]);
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
