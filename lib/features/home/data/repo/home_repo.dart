import 'package:dartz/dartz.dart';
import 'package:marketi/core/error/server_exception.dart';
import 'package:marketi/features/home/data/models/all_product_model/all_product_model.dart';
import 'package:marketi/features/home/data/models/brands_model.dart';
import 'package:marketi/features/home/data/models/categories_model.dart';

abstract class HomeRepo {
  Future<Either<ServerException, AllProductModel>> getAllProducts({
    int skip = 0,
    int limit = 10,
    String? sortBy,
    String? order,
  });
  Future<Either<ServerException, AllProductModel>> categoryByProduct(
    String name,
  );
  Future<Either<ServerException, AllProductModel>> brandByProduct(String name);
  Future<Either<ServerException, List<CategoriesModel>>> getCategories();
  Future<Either<ServerException, List<BrandsModel>>> getBrands();
}
