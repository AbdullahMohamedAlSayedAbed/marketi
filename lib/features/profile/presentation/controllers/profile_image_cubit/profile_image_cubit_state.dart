part of 'profile_image_cubit_cubit.dart';

sealed class ProfileImageCubitState extends Equatable {
  const ProfileImageCubitState();

  @override
  List<Object> get props => [];
}

final class ProfileImageCubitInitial extends ProfileImageCubitState {}

class ProfileImageInitial extends ProfileImageCubitState {}

class ProfileImagePicked extends ProfileImageCubitState {
  final XFile image;
  const ProfileImagePicked(this.image);
}

class ProfileImageUploading extends ProfileImageCubitState {}

class ProfileImageUploaded extends ProfileImageCubitState {
  final String message;
  const ProfileImageUploaded(this.message);
}

class ProfileImageError extends ProfileImageCubitState {
  final String message;
  const ProfileImageError(this.message);
}
