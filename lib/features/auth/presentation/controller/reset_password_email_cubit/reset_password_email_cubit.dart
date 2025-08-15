import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:marketi/features/auth/data/models/update_password_model.dart';
import 'package:marketi/features/auth/data/repo/auth_repo.dart';

part 'reset_password_email_state.dart';

class ResetPasswordEmailCubit extends Cubit<ResetPasswordEmailState> {
  ResetPasswordEmailCubit(this.authRepo) : super(ResetPasswordEmailInitial());
  final AuthRepo authRepo;
  void resetPasswordEmail(String email) async {
    emit(ResetPasswordEmailLoading());
    final result = await authRepo.resetPasswordEmail(email);
    result.fold(
      (error) => emit(ResetPasswordEmailError(error.errorModel.message)),
      (message) => emit(ResetPasswordEmailSuccess(message)),
    );
  }

  void verifyResetCode({
    required String code,
    required String emailOrPhone,
  }) async {
    emit(ResetPasswordCodeLoading());
    final result = await authRepo.verifyResetCode(code, emailOrPhone);
    result.fold(
      (error) => emit(ResetPasswordEmailError(error.errorModel.message)),
      (message) => emit(ResetPasswordEmailSuccess(message)),
    );
  }

  void updatePassword({required UpdatePasswordModel updatePassword}) async {
    emit(ResetPasswordUpdateLoading());
    final result = await authRepo.updatePassword(updatePassword);
    result.fold(
      (error) => emit(ResetPasswordEmailError(error.errorModel.message)),
      (message) => emit(ResetPasswordEmailSuccess(message)),
    );
  }
}
