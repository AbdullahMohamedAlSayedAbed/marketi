import 'package:dartz/dartz.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/error/error_model.dart';
import 'package:marketi/core/error/server_exception.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';
import 'package:marketi/features/home/data/models/brands_model.dart';
import 'package:marketi/features/home/data/models/categories_model.dart';
import 'package:marketi/features/home/data/repo/home_repo.dart';

class HomeRepoImpl extends HomeRepo {
  final ApiConsumer apiConsumer;

  HomeRepoImpl({required this.apiConsumer});
  @override
  Future<Either<ServerException, AllProductModel>> getAllProducts() async {
    try {
      final response = await apiConsumer.get(ApiKeys.allProducts);
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

  @override
  Future<Either<ServerException, List<BrandsModel>>> getBrands() async {
    try {
      final response = await apiConsumer.get(ApiKeys.brands);
      List<BrandsModel> brandsList = [];
      if (response['list'] != null) {
        for (var element in response['list']) {
          brandsList.add(BrandsModel.fromJson(element));
        }
      }
      return Right(brandsList);
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

  @override
  Future<Either<ServerException, List<CategoriesModel>>> getCategories() async {
    try {
      final response = await apiConsumer.get(ApiKeys.categories);
      List<CategoriesModel> categoriesList = [];
      if (response['list'] != null) {
        for (var element in response['list']) {
          categoriesList.add(CategoriesModel.fromJson(element));
        }
      }
      return Right(categoriesList);
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

  @override
  Future<Either<ServerException, AllProductModel>> brandByProduct(
    String name,
  ) async {
    try {
      final response = await apiConsumer.get(EndPoints.productsByBrand(name));
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

  @override
  Future<Either<ServerException, AllProductModel>> categoryByProduct(
    String name,
  ) async {
    try {
      final response = await apiConsumer.get(
        EndPoints.productsByCategory(name),
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
