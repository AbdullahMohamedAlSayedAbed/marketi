import 'package:dartz/dartz.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/error/error_model.dart';
import 'package:marketi/core/error/server_exception.dart';
import 'package:marketi/core/services/shared_prefs.dart';
import 'package:marketi/features/auth/data/models/sign_in.dart';
import 'package:marketi/features/auth/data/models/sign_up.dart';
import 'package:marketi/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer apiConsumer;

  AuthRepoImpl({required this.apiConsumer});

  @override
  Future<Either<ServerException, String>> signIn(SignInModel signIn) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.signIn,
        data: signIn.toJson(),
      );
      CacheHelper().saveData(
        key: ApiKeys.token,
        value: response[ApiKeys.token],
      );
      return Right(response[ApiKeys.token]);
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

  @override
  Future<Either<ServerException, void>> signUp(SignUpModel signUp) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.signUp,
        data: signUp.toJson(),
      );
      if (response[ApiKeys.token] != null) {
        CacheHelper().saveData(
          key: ApiKeys.token,
          value: response[ApiKeys.token],
        );
      }
      return Right(null);
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
