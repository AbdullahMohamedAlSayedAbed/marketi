import 'package:equatable/equatable.dart';

class SignUp extends Equatable {
  final String? name;
  final String? phone;
  final String? email;
  final String? password;
  final String? confirmPassword;

  const SignUp({
    this.name,
    this.phone,
    this.email,
    this.password,
    this.confirmPassword,
  });

  factory SignUp.fromJson(Map<String, dynamic> json) => SignUp(
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    email: json['email'] as String?,
    password: json['password'] as String?,
    confirmPassword: json['confirmPassword'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'email': email,
    'password': password,
    'confirmPassword': confirmPassword,
  };

  @override
  List<Object?> get props {
    return [name, phone, email, password, confirmPassword];
  }
}
