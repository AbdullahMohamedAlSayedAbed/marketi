import 'package:equatable/equatable.dart';

class SignIn extends Equatable {
  final String? email;
  final String? password;

  const SignIn({this.email, this.password});

  factory SignIn.fromJson(Map<String, dynamic> json) => SignIn(
    email: json['email'] as String?,
    password: json['password'] as String?,
  );

  Map<String, dynamic> toJson() => {'email': email, 'password': password};

  @override
  List<Object?> get props => [email, password];
}
