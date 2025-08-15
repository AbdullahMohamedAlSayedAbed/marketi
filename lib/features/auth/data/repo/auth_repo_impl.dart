import 'package:dartz/dartz.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/error/error_model.dart';
import 'package:marketi/core/error/server_exception.dart';
import 'package:marketi/core/services/shared_prefs.dart';
import 'package:marketi/features/auth/data/models/sign_in.dart';
import 'package:marketi/features/auth/data/models/sign_up.dart';
import 'package:marketi/features/auth/data/models/update_password_model.dart';
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
      await apiConsumer.post(EndPoints.signUp, data: signUp.toJson());
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

  @override
  Future<Either<ServerException, String>> resetPasswordEmail(
    String email,
  ) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.resetPassCode,
        data: {'email': email},
      );
      return Right(response[ApiKeys.message]);
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
  Future<Either<ServerException, String>> updatePassword(
    UpdatePasswordModel updatePassword,
  ) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.resetPassword,
        data: updatePassword.toJson(),
      );
      return Right(response[ApiKeys.message]);
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
  Future<Either<ServerException, String>> verifyResetCode(
    String code,
    String emailOrPhone,
  ) async {
    try {
      final response = await apiConsumer.post(
        EndPoints.activeResetPass,
        data: {'code': code, "email": emailOrPhone},
      );
      return Right(response[ApiKeys.message]);
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
