import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketi/features/auth/data/models/sign_in.dart';
import 'package:marketi/features/auth/data/models/sign_up.dart';
import 'package:marketi/features/auth/data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  Future<void> signIn(SignInModel signInModel) async {
    emit(AuthSignedInLoading());

      final result = await authRepo.signIn(signInModel);
      result.fold(
        (error) => emit(AuthFailure(error.errorModel.message)),
        (token) => emit(AuthSignedInSuccess(token)),
      );
  }

  Future<void> signUp(SignUpModel signUpModel) async {
    emit(AuthSignedUpLoading());
    final result = await authRepo.signUp(signUpModel);
    result.fold(
      (error) => emit(AuthFailure(error.errorModel.message)),
      (token) => emit(SignUpSuccess()),
    );
  }
}
