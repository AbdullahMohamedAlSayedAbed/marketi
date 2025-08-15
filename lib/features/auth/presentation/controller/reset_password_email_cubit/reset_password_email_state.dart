part of 'reset_password_email_cubit.dart';

sealed class ResetPasswordEmailState extends Equatable {
  const ResetPasswordEmailState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordEmailInitial extends ResetPasswordEmailState {}

final class ResetPasswordEmailLoading extends ResetPasswordEmailState {}

final class ResetPasswordEmailSuccess extends ResetPasswordEmailState {
  final String message;
  const ResetPasswordEmailSuccess(this.message);

  @override
  List<Object> get props => [message];
}

final class ResetPasswordEmailError extends ResetPasswordEmailState {
  final String message;
  const ResetPasswordEmailError(this.message);

  @override
  List<Object> get props => [message];
}

final class ResetPasswordCodeLoading extends ResetPasswordEmailState {}

final class ResetPasswordUpdateLoading extends ResetPasswordEmailState {}
