import 'package:equatable/equatable.dart';

class UpdatePasswordModel extends Equatable {
  final String? email;
  final String? password;
  final String? confirmPassword;

  const UpdatePasswordModel({this.email, this.password, this.confirmPassword});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
    'confirmPassword': confirmPassword,
  };

  @override
  List<Object?> get props => [email, password, confirmPassword];
}
