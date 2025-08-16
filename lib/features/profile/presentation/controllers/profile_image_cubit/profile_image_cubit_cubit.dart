import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:marketi/features/profile/data/repo/profile_repo.dart';

part 'profile_image_cubit_state.dart';

class ProfileImageCubitCubit extends Cubit<ProfileImageCubitState> {
  ProfileImageCubitCubit(this.profileRepo)
    : super(ProfileImageCubitInitial());
  final ProfileRepo profileRepo;
  final ImagePicker picker =ImagePicker();
  XFile? pickedImage;
  String? uploadedImageUrl;

  Future<void> pickImage() async {
    try {
      final image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        pickedImage = image;
        emit(ProfileImagePicked(image));
        await uploadImage(); 
      }
    } catch (e) {
      emit(ProfileImageError("Error picking image: $e"));
    }
  }

  Future<void> uploadImage() async {
    if (pickedImage == null) return;
    emit(ProfileImageUploading());
    final result = await profileRepo.uploadProfileImage(pickedImage!);
    result.fold(
      (failure) => emit(ProfileImageError(failure.toString())),
      (success) => emit(ProfileImageUploaded(success)),
    );
  }
}
