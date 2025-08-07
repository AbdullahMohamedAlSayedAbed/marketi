import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String? name;
  final String? phone;
  final String? email;
  final String? role;
  final String? image;

  const User({this.name, this.phone, this.email, this.role, this.image});

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    email: json['email'] as String?,
    role: json['role'] as String?,
    image: json['image'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'phone': phone,
    'email': email,
    'role': role,
    'image': image,
  };

  @override
  List<Object?> get props => [name, phone, email, role, image];
}
