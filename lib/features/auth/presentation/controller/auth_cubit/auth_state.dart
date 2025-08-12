part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
final class AuthSignedInLoading extends AuthState {}
final class AuthSignedUpLoading extends AuthState {}


final class AuthSignedInSuccess extends AuthState {
  final String token;
  const AuthSignedInSuccess(this.token);

  @override
  List<Object> get props => [token];
}

final class SignUpSuccess extends AuthState {
  const SignUpSuccess();

}

final class AuthFailure extends AuthState {
  final String message;
  const AuthFailure(this.message);

  @override
  List<Object> get props => [message];
}

