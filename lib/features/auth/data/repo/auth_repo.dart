import 'package:dartz/dartz.dart';
import 'package:marketi/core/error/server_exception.dart';
import 'package:marketi/features/auth/data/models/sign_in.dart';
import 'package:marketi/features/auth/data/models/sign_up.dart';
import 'package:marketi/features/auth/data/models/update_password_model.dart';

abstract class AuthRepo {
  Future<Either<ServerException, String>> signIn(SignInModel signIn);
  Future<Either<ServerException, void>> signUp(SignUpModel signUp);
  Future<Either<ServerException, String>> resetPasswordEmail(String email);
  Future<Either<ServerException, String>> verifyResetCode(
    String code,
    String emailOrPhone,
  );
  Future<Either<ServerException, String>> updatePassword(
    UpdatePasswordModel updatePassword,
  );

  // Future<void> signOut();
  // Future<bool> isSignedIn();
  // Future<String?> getCurrentUserId();
}
