import 'package:equatable/equatable.dart';

import 'user.dart';

class UserData extends Equatable {
  final String? message;
  final String? token;
  final User? user;

  const UserData({this.message, this.token, this.user});

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    message: json['message'] as String?,
    token: json['token'] as String?,
    user: json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'message': message,
    'token': token,
    'user': user?.toJson(),
  };

  @override
  List<Object?> get props => [message, token, user];
}
