import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:marketi/core/api/api_consumer.dart';
import 'package:marketi/core/api/end_points.dart';
import 'package:marketi/core/error/server_exception.dart';
import 'package:marketi/core/repo/base_repo.dart';
import 'package:marketi/core/services/shared_prefs.dart';
import 'package:marketi/core/utils/storage_key.dart';
import 'package:marketi/features/auth/data/models/sign_in.dart';
import 'package:marketi/features/auth/data/models/sign_up.dart';
import 'package:marketi/features/auth/data/models/update_password_model.dart';
import 'package:marketi/features/auth/data/models/user_data/user.dart';
import 'package:marketi/features/auth/data/repo/auth_repo.dart';

class AuthRepoImpl extends BaseRepo implements AuthRepo {
  AuthRepoImpl({required ApiConsumer apiConsumer}) : super(apiConsumer);

  @override
  Future<Either<ServerException, String>> signIn(SignInModel signIn) {
    return execute(
      () => apiConsumer.post(EndPoints.signIn, data: signIn.toJson()),
      (data) {
        CacheHelper().saveData(key: ApiKeys.token, value: data[ApiKeys.token]);
        final user = User.fromJson(data[ApiKeys.user]);
        saveUserData(user: user);
        return data[ApiKeys.token];
      },
    );
  }

  Future<void> saveUserData({required User user}) async {
    var jsonData = jsonEncode(user.toJson());
    await CacheHelper().saveData(key: StorageKey.userData, value: jsonData);
  }

  @override
  Future<Either<ServerException, void>> signUp(SignUpModel signUp) {
    return execute(
      () => apiConsumer.post(EndPoints.signUp, data: signUp.toJson()),
      (_) => null,
    );
  }

  @override
  Future<Either<ServerException, String>> resetPasswordEmail(String email) {
    return execute(
      () => apiConsumer.post(EndPoints.resetPassCode, data: {'email': email}),
      (data) => data[ApiKeys.message],
    );
  }

  @override
  Future<Either<ServerException, String>> updatePassword(
    UpdatePasswordModel updatePassword,
  ) {
    return execute(
      () => apiConsumer.post(EndPoints.resetPassword, data: updatePassword.toJson()),
      (data) => data[ApiKeys.message],
    );
  }

  @override
  Future<Either<ServerException, String>> verifyResetCode(
    String code,
    String emailOrPhone,
  ) {
    return execute(
      () => apiConsumer.post(
        EndPoints.activeResetPass,
        data: {'code': code, "email": emailOrPhone},
      ),
      (data) => data[ApiKeys.message],
    );
  }
}